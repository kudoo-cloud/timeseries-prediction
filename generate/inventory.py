#!/usr/bin/python

# Setup of libraries

import os
import random
import pandas as pd
from datetime import datetime
from dotenv import load_dotenv
# Own library
import database

def convertPriceToFloat(x):
    """
    This is a utility function to clean prices
    from style characters.
    """
    # Removing non-numeric characters
    x = str(x) \
        .replace('£', '') \
        .replace('na', '0') \
        .replace(',', '')
    # Sometimes there is more than 1 item,
    # so it takes only the first one
    spc = x[1:].find(' ')
    x = x[0:spc]
    return float(x)

class Inventory:
    """
    This class is built to populate the Inventory table
    with simulated data got from public datasets.
    """
    def __init__(self):
        random.seed(5)
        load_dotenv()
        # Setting maximun number of items by company
        self.max_inventory_item_num = int(os.getenv('MAX_INVENTORY_ITEM_NUM'))
        # Loading and utility datasets
        self.companies = pd.read_csv('csv/company.csv')
        self.e_commerce_df = pd.read_csv('third_parties/amazon-e-commerce-sample/data.csv')
        # Converting prices from string to float and
        # ignoring records that have price equal to zero
        self.e_commerce_df['price'] = self.e_commerce_df.price.apply(convertPriceToFloat).fillna(0)
        self.e_commerce_df = self.e_commerce_df[self.e_commerce_df.price != 0]
    def generate(self):
        inventories = []  # Set for items for each company
        counter = 0       # To control unique id
        for idx in self.companies.index:
            dt = datetime.isoformat(datetime.now())
            # Getting a random sample of inventory items
            sample = self.e_commerce_df.sample(random.randint(1, self.max_inventory_item_num))[['product_name', 'price']] 
            sample.rename(columns={'product_name': 'name'}, inplace=True)
            sample['id'] = [counter + x for x in range(len(sample))]
            sample['company'] = self.companies.loc[idx].id
            sample['inventoryModel'] = 'default'
            sample['uom'] = 'unit'
            sample['isArchived'] = False
            sample['isDeleted'] = False
            sample['updatedAt'] = dt
            sample['createdAt'] = dt
            counter += len(sample)
            inventories.append(sample)
        # Joining in a unique dataset
        inventory = pd.concat(inventories)
        # Reordering columns
        inventory = inventory[['id', 'name', 'inventoryModel', 'uom', 'isArchived', 'isDeleted', 'updatedAt', 'createdAt', 'company', 'price']]
        database.tableToDBM(inventory, 'Inventory')
        inventory.to_csv('csv/inventory.csv', index=False)
        
if __name__ == '__main__':
    Inventory().generate()
