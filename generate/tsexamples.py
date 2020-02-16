#!/usr/bin/python

import pandas as pd

def convertDate(datestr):
    items = datestr.split('/')
    return '{}-{}-{}'.format(items[2], items[0], items[1])

class TSExamples:
    """
    This class has functions to generate time series datasets.
    Datasets are generated from real data taken from 
    public datasets.
    """
    def uk_retail(self):
        """
        From Annual Transactions of UK retailes
        """
        data = pd.read_csv('third_parties/annual-transactions-from-uk-retailer/data.csv', encoding='iso-8859-1')
        data['ds'] = data.InvoiceDate \
            .apply(lambda x: str(x).split(' ')[0]) \
            .apply(convertDate)
        data = data.groupby('ds').sum()['Quantity'].reset_index()
        data.rename(columns={'Quantity': 'y'}, inplace=True)
        data.to_csv('csv/ts_uk_retail.csv', index=False)
        return data
    def br_ecommerce(self):
        """
        From a braziliam e-commerce company
        """
        data = pd.read_csv('third_parties/brazilian-e-commerce/data.csv')
        data['ds'] = data.shipping_limit_date.apply(lambda x: str(x)[0:10])
        data = data[data.ds <= '2018-06-30']
        data = data[data.ds >= '2017-01-01']
        data.to_csv('csv/ts_br_ecommerce.csv')
        return data
        
if __name__ == '__main__':
    ts = TSExamples()
    ts.uk_retail()
    ts.br_ecommerce()
    # ts.combined1()
