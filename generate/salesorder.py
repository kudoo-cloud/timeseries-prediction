#!/usr/bin/python

# Setup of libraries

import os
import random
import pandas as pd
from datetime import datetime, timedelta
from dotenv import load_dotenv
# Own library
import database
import util

class SalesOrder:
    """
    This class is built to populate the SalesOrder table
    with simulated data got from public datasets.
    """
    def __init__(self):
        random.seed(5)
        load_dotenv()
        # Settings for simulation
        self.start_date = datetime.fromisoformat(os.getenv('SIM_START_DATE'))
        self.end_date = datetime.fromisoformat(os.getenv('SIM_END_DATE'))
        self.one_day = timedelta(days=1)
        self.max_orders = int(os.getenv('MAX_ORDER_BY_DAY'))
        self.customers = pd.read_csv('csv/customer.csv')
        self.companies = pd.read_csv('csv/company.csv')
    def makeOrders(self, company, date):
        """
        A random number of orders are created for each day
        """
        orders = []
        currency_codes = util.currencyCodes()
        num = random.randint(1, self.max_orders)
        for i in range(num):
            order = {}
            order['transactionDate'] = date
            order['currency'] = currency_codes[random.randint(0, len(currency_codes) - 1)]
            order['isArchived'] = False
            order['isDeleted'] = False
            order['updatedAt'] = date
            order['createdAt'] = date
            order['customer'] = self.customers.id.values[random.randint(0, len(self.customers) - 1)]
            order['company'] = company
            orders.append(order)
        return orders
    def generate(self):
        salesOrders = []  # Set for items for each order
        counter = 0       # To control unique id
        for idx in self.companies.index:
            pos_date = self.start_date
            while pos_date < self.end_date:
                salesOrders += self.makeOrders(idx, pos_date)
                pos_date += self.one_day
        salesOrders = pd.DataFrame(salesOrders)
        salesOrders['id'] = salesOrders.index
        salesOrders = salesOrders.sort_values('transactionDate')
        salesOrders = salesOrders[['id', 'transactionDate', 'currency', 'isArchived', 'isDeleted', 'updatedAt', 'createdAt', 'customer', 'company']]
        database.tableToDBM(salesOrders, 'SalesOrder')
        salesOrders.to_csv('csv/salesorder.csv', index=False)
        return salesOrders

if __name__ == '__main__':
    SalesOrder().generate()
