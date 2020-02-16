#!/usr/bin/python

import pandas as pd
from datetime import datetime

import database
from predictionbase import PredictionBase

class QuantityOfItems(PredictionBase):
    def __init__(self):
        super(QuantityOfItems, self).__init__()
        self.table_name = 'PredictedSalesQuantityOfItemsByCompany'
        self.csv_file_name = 'quantityofitems.csv'
    def getNextPredictedItemsId(self):
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
        items = order_lines.inventory.unique()
        if len(items) == 0:
            return None
        forecasts = []
        for item in items:
            df = order_lines[order_lines.inventory == item]
            # Data is summarized by day
            items_by_day = df.groupby('transactionDate').sum()['qty'].reset_index().fillna(0)
            items_by_day.rename(columns={'transactionDate': 'ds', 'qty': 'y'}, inplace=True)
            if len(items_by_day) < 1:
                continue
            # Making predictions
            frc = self.makeForecast(items_by_day)
            frc['company'] = company_id
            frc['inventory'] = item
            frc = frc[frc.ds > items_by_day.ds.max()]
            forecasts.append(frc)
        # Returning the forecast dataset
        forecast = pd.concat(forecasts)
        return forecast[['company', 'inventory', 'ds', 'yhat']]
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
        id_start = self.getNextPredictedItemsId()
        frc['id'] = range(id_start, id_start + len(frc))
        frc['datePredictionRun'] = datetime.isoformat(datetime.today())
        frc.rename(columns={'ds': 'predictedDate', 'yhat': 'predictedSalesValue'}, inplace=True)
        frc['createdAt'] = datetime.isoformat(datetime.today())
        frc['updatedAt'] = datetime.isoformat(datetime.today())
        frc = frc[['id', 'datePredictionRun', 'predictedSalesValue', 'predictedDate', 'createdAt', 'updatedAt', 'company', 'inventory']]
        database.tableToDBM(frc, self.table_name)

if __name__ == '__main__':
    QuantityOfItems().predict()
