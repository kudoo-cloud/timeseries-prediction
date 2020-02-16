import os
import sys
import pandas as pd
import psycopg2                        # For PostgreSQL interface
from sqlalchemy import create_engine   # For PostgreSQL interface
from fbprophet import Prophet
from dotenv import load_dotenv

class PredictionBase:
    """
    This is a base class. It is not intented to be
    used alone. Implementation classes have to derive from it.
    It defines common methods to make predictions.
    """
    def __init__(self):
        load_dotenv()
        self.engine = create_engine(
                    'postgresql+psycopg2://postgres:postgres@localhost:5432/kudoo_dev' #\
                    #'postgresql+psycopg2://{}:{}@localhost:5432/{}' \
                    #    .format(
                    #        os.getenv('DB_USER'),
                    #        os.getenv('DB_PASSWORD'),
                    #        os.getenv('DB_NAME')
                    #    )
                )
        self.table_name = None    # to be defined in child class
        self.csv_file_name = None # to be define in child class
        # Getting path where script is running
        pos = sys.argv[0].rfind('/')
        if pos >= 0:
            self.path = sys.argv[0][0:pos + 1]
        else:
            self.path = './'
    def getOrderLines(self, company_id):
        """
        This method returns order lines with order date and currency
        for a given company.
        """
        stmt = 'SELECT "transactionDate", currency, inventory, qty, price ' + \
               'FROM "default$default"."SalesOrder" AS a, "default$default"."SalesOrderLine" as b ' + \
               'WHERE a.id = b."salesOrder" AND a.company=\'{}\''.format(company_id)
        order_lines = pd.read_sql_query(stmt, con=self.engine)
        return order_lines
    def makeForecast(self, dataframe):
        """
        This is a core method where prophef library is used.
        This method can be modified or reused to use
        diffeerent Prophet configuration options.
        """
        m = Prophet(daily_seasonality=True, yearly_seasonality=True)
        m.fit(dataframe)
        future = m.make_future_dataframe(periods = int(os.getenv('PREDICTION_PERIODS')))
        forecast = m.predict(future)
        return forecast
    def predict(self):
        """
        Main method. It goes company by company
        making predictions.
        """
        stmt = 'SELECT DISTINCT company FROM "default$default"."SalesOrder"'
        companies_with_sales = pd.read_sql_query(stmt, con=self.engine)
        forecasts = []
        for company_id in companies_with_sales['company']:
            forecast = self.makePredictions(company_id)
            self.storePredictions(company_id, forecast)
            forecasts.append(forecast)
        forecasts = [pd.DataFrame(frc) for frc in forecasts]
        forecasts = pd.concat(forecasts)
        forecasts.to_csv(self.path + 'csv/' + self.csv_file_name, index=False)
        return forecasts
