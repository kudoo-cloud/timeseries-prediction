#!/usr/bin/python

import pandas as pd
from datetime import datetime

import currency
import database
from predictionbase import PredictionBase

class SalesValue(PredictionBase):
    """
    This class provides a set of functions to make
    predictions on sales by value for each company.
    """
    def __init__(self):
        super(SalesValue, self).__init__()
        self.table_name = 'PredictedSalesValueByCompany'
        self.csv_file_name = 'salesvalues.csv'
    def convertPricesToStd(self, order_lines):
        """
        This method converts currency of each line order to standard currency.
        It returns a list of standard prices.
        """
        price_std = []
        for idx in order_lines.index:
            row = order_lines.loc[idx]
            std = currency.convert(row.price, row.currency, 'USD', row.transactionDate)
            price_std.append(std)
        return price_std
    def getNextPredictedSalesId(self):
        """
        This is a simple function to calculate the
        next unique id for forecast records to
        be predicted.
        """
        stmt = 'SELECT id FROM "default$default"."{}"'.format(self.table_name)
        ids = pd.read_sql_query(stmt, con=self.engine)
        if len(ids) > 0:
            return ids.id.apply(int).max() + 1
        else:
            return 0
    def makePredictions(self, company_id):
        """
        In this method the dataset for prediction is built.
        Order lines are summarized by day. Next, it is passed
        to prophet to generate predictions.
        """
        order_lines = self.getOrderLines(company_id)
        order_lines['price_std'] = self.convertPricesToStd(order_lines)
        # A total column is created representing sales value for each order line
        order_lines['total'] = order_lines.qty * order_lines.price_std
        # Data is summarized by day
        orders_by_day = order_lines.groupby('transactionDate').sum()['total'].reset_index()
        orders_by_day.rename(columns={'transactionDate': 'ds', 'total': 'y'}, inplace=True)
        # Making predictions
        forecast = self.makeForecast(orders_by_day)
        forecast['company'] = company_id
        forecast = forecast[forecast.ds > orders_by_day.ds.max()]
        # Returning the forecast dataset
        return forecast[['company', 'ds', 'yhat']]
    def storePredictions(self, company, forecast):
        """
        This methods remove older forecasts and store in
        the database the new ones.
        """
        frc = forecast.copy()
        # Stored forecast will be deleted from min_date
        min_date = forecast.ds.min()
        stmt = 'DELETE FROM "default$default"."{}" '.format(self.table_name) + \
               'WHERE "predictedDate">=\'{}\' AND company=\'{}\''.format(min_date, company)
        self.engine.execute(stmt)
        # Storing dataset
        id_start = self.getNextPredictedSalesId()
        frc['id'] = range(id_start, id_start + len(frc))
        frc['datePredictionRun'] = datetime.isoformat(datetime.today())
        frc.rename(columns={'ds': 'predictedDate', 'yhat': 'predictedSalesValue'}, inplace=True)
        frc['createdAt'] = datetime.isoformat(datetime.today())
        frc['updatedAt'] = datetime.isoformat(datetime.today())
        frc = frc[['id', 'datePredictionRun', 'predictedSalesValue', 'predictedDate', 'createdAt', 'updatedAt', 'company']]
        database.tableToDBM(frc, self.table_name)
    
if __name__ == '__main__':
    SalesValue().predict()
