#!/usr/bin/python

# Setup of libraries

import os
import random
import pandas as pd
from datetime import datetime
from dotenv import load_dotenv
# Own library
import database

class Customer:
    """
    This class is built to populate the Customer table
    with simulated data got from public datasets.
    """
    def __init__(self):
        random.seed(5)
        load_dotenv()
        # Setting maximun number of items by company
        self.max_customer_num = int(os.getenv('MAX_CUSTOMER_NUM'))
        # Loading and utility datasets
        self.companies = pd.read_csv('csv/company.csv')
        self.people = pd.read_csv('third_parties/mbejda_celebrity_accounts/data.csv')
    def generate(self):
        customers = []  # Set for items for each company
        counter = 0       # To control unique id
        for idx in self.companies.index:
            dt = datetime.isoformat(datetime.now())
            # Getting a random sample of inventory items
            sample = self.people.sample(random.randint(1, self.max_customer_num))[['name', 'type']] 
            sample.rename(columns={'type': 'description'}, inplace=True)
            sample['id'] = [counter + x for x in range(len(sample))]
            sample['company'] = self.companies.loc[idx].id
            sample['govNumber'] = '000-0000'
            sample['isArchived'] = False
            sample['isDeleted'] = False
            sample['updatedAt'] = dt
            sample['createdAt'] = dt
            counter += len(sample)
            customers.append(sample)
        # Joining in a unique dataset
        customer = pd.concat(customers)
        # Reordering columns
        customer = customer[['id', 'description', 'govNumber', 'isArchived', 'isDeleted', 'name', 'updatedAt', 'createdAt', 'company']]
        database.tableToDBM(customer, 'Customer')
        customer.to_csv('csv/customer.csv', index=False)
        
if __name__ == '__main__':
    Customer().generate()
