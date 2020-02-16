#!/usr/bin/python

# This script populates the Company table with
# simulated data. Some data is obtained from
# public sources availables in Internet.

import os
import requests
import pandas as pd
import random
from datetime import datetime
from dotenv import load_dotenv

import database
import util

class Company:
    def __init__(self):
        random.seed(5)                         # For repeated experiments
        load_dotenv()
    def businessTypes(self):
        """
        This method defines a set of business types.
        A list of them is returned.
        """
        business_types = [
                'Sole proprietor', 
                'Partnership', 
                'Company', 
                'Franchise', 
                'Limited liability'
            ]
        return business_types
    def countryNames(self):
        """
        This method returns a list of countries
        """
        countries = pd.read_csv('third_parties/countries/data.csv')
        return list(countries.Name)
    def businessDir(self):
        """
        Getting data from company dataset examples
        """
        business_dir = pd.read_csv('third_parties/port_moody_companies/data.csv')
        return business_dir
    def generate(self):
        """
        This function generates a table of companies.
        """
        business_types = self.businessTypes()
        currency_codes = util.currencyCodes()
        country_names = self.countryNames()
        business_dir = self.businessDir()
        # Filling the Company table with simulated data
        how_many = int(os.getenv('COMPANIES_NUM'))
        companies = {}
        companies['id'] = range(how_many)
        companies['bankAccount'] = ['%08d' % x for x in range(how_many)]
        companies['businessType'] = [
                business_types[random.randint(0, len(business_types) - 1)]
                for i in range(how_many)
            ]
        companies['country'] = [
                country_names[random.randint(0, len(country_names) - 1)] 
                for i in range(how_many)
            ]
        companies['govNumber'] = ['%08d' % x for x in range(how_many)]
        companies['currency'] = [
                currency_codes[random.randint(0, len(currency_codes) - 1)] 
                for i in range(how_many)
            ]
        companies['isArchived'] = [False for i in range(how_many)]
        companies['isDeleted'] = [False for i in range(how_many)]
        companies['legalName'] = []  # It is populated below
        companies['name'] = []       # It is populated below
        companies['salesTax'] = [False for i in range(how_many)]
        companies['timeSheetSettings'] = [None for i in range(how_many)]
        companies['websiteURL'] = []
        companies['updatedAt'] = [
                datetime.isoformat(datetime.now()) 
                for i in range(how_many)
            ]
        companies['createdAt'] = companies['updatedAt']
        companies['logo'] = [None for i in range(how_many)]
        for i in range(how_many):
            row = business_dir.iloc[i]
            companies['legalName'].append(row['Business Name'])
            companies['name'].append(row['Business Name'])
            companies['websiteURL'].append(row['Website'])
        # Converting the table Company to a dataframe
        df = pd.DataFrame(companies)
        # Writing data to the DBM
        database.tableToDBM(df, 'Company')
        # Saving tables of company in a local file
        df.to_csv('csv/company.csv', index=False)

if __name__ == '__main__':
    Company().generate()
