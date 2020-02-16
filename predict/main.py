#!/usr/bin/python

# This is main script to run predictors of sales.

from salesvalues import SalesValue
from quantityofitems import QuantityOfItems

def runPredictors():
    predictors = [SalesValue, QuantityOfItems]
    for entity in predictors:
        print(entity.__name__)
        entity().predict()
        
if __name__ == '__main__':
    runPredictors()
