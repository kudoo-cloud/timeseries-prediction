#!/usr/bin/python

# Setup of libraries

import os
import random
import pandas as pd
from datetime import datetime
from dotenv import load_dotenv
# Own library
import database
import util

class SalesOrderLine:
    """
    This class is built to populate the SalesOrderLine table
    with simulated data got from public datasets.
    """
    def __init__(self):
        random.seed(5)
        load_dotenv()
        # Settings for simulation
        self.salesorder = pd.read_csv('csv/salesorder.csv')
        self.inventories = pd.read_csv('csv/inventory.csv')
        self.max_items_by_order = int(os.getenv('MAX_ITEMS_BY_ORDER'))
        self.max_quantity_by_item = int(os.getenv('MAX_QUANTITY_BY_ITEM'))
    def makeLine(self, order):
        """
        A line of items is created for each order
        """
        items = []
        inventory_by_company = self.inventories[self.inventories.company == order.company]
        num = random.randint(1, self.max_items_by_order)
        for i in range(num):
            inventory_item = random.randint(0, len(inventory_by_company) - 1)
            item = {}
            item['qty'] = random.randint(1, self.max_quantity_by_item)
            item['price'] = inventory_by_company.iloc[inventory_item].price
            item['isArchived'] = False
            item['isDeleted'] = False
            item['updatedAt'] = order.transactionDate
            item['createdAt'] = order.transactionDate
            item['salesOrder'] = order.id
            item['inventory'] = inventory_by_company.iloc[inventory_item].id
            items.append(item)
        return items
    def generate(self):
        salesOrderLines = []  # Set for items for each order
        counter = 0       # To control unique id
        for idx in self.salesorder.index:
            salesOrderLines += self.makeLine(self.salesorder.loc[idx])
        salesOrderLines = pd.DataFrame(salesOrderLines)
        salesOrderLines['id'] = salesOrderLines.index
        salesOrderLines = salesOrderLines[['id', 'qty', 'isArchived', 'isDeleted', 'updatedAt', 'createdAt', 'salesOrder', 'inventory', 'price']]
        database.tableToDBM(salesOrderLines, 'SalesOrderLine')
        salesOrderLines.to_csv('csv/salesorderline.csv', index=False)
        return salesOrderLines

if __name__ == '__main__':
    SalesOrderLine().generate()
