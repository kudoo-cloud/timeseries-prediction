#!/usr/bin/python

# This script populates the WareHouse table with
# simulated data.

import os
import random
import requests
import pandas as pd
from datetime import datetime
from dotenv import load_dotenv
from zipfile import ZipFile
from dotenv import load_dotenv

import database


class WareHouse:
    """
    This class populates the table WareHouse
    """
    def __init__(self):
        random.seed(5)
        load_dotenv()
        self.companies = pd.read_csv('csv/company.csv')
        self.cities = pd.read_csv('third_parties/worldcities/data.csv')
    def getRandomCities(self, country):
        """
        This method returns a list of random cities for a given country.
        It the country is not in the cities dataset, a unique item
        named 'central' is returned.
        """
        df = self.cities[self.cities.country == country]
        if len(df) < 1:
            return ['Central']
        else:
            df = df.sample(random.randint(1, len(df)))
            return df.city.values
    def generate(self):
        """
        This is the main method which generates
        warehouse data for each company
        """
        warehouses = []
        counter = 0
        for idx in self.companies.index: 
            # Getting random locations
            locations = self.getRandomCities(self.companies.loc[idx].country)
            # Creating a warehouse record for each location
            for city in locations:
                dt = datetime.isoformat(datetime.now())
                warehouse = {
                    'id': counter,
                    'name': city,
                    'isArchived': False,
                    'isDeleted': False,
                    'updatedAt': dt,
                    'createdAt': dt,
                    'company': self.companies.loc[idx].id
                }
                # Appending the new warehousue record
                warehouses.append(warehouse)
                counter += 1
        # Converting the table to a dataframe
        df = pd.DataFrame(warehouses)
        df = df[warehouses[0].keys()]
        # Saving records to the database manager
        database.tableToDBM(df, 'WareHouse')
        df.to_csv('csv/warehouse.csv', index=False)
        
if __name__ == '__main__':
    WareHouse().generate()
