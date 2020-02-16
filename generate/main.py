#!/usr/bin/python

# This is the main script to populate the database
# It calls the scripts to populate each table.
# All of them use the same interface: generate().
# Besides that, each script can be run separately.

from company import Company
from customer import Customer
from warehouse import WareHouse
from inventory import Inventory
from salesorder import SalesOrder
from salesorderline import SalesOrderLine

def runGenerators():
    generators = [Company, Customer, WareHouse, Inventory, SalesOrder, SalesOrderLine]
    for entity in generators:
        print(entity.__name__)
        entity().generate()
        
if __name__ == '__main__':
    runGenerators()
