# Currency convertions

# This script implements a basic function
# to convert from one country currency to other.
#
# For further convertions, this script has to be
# replaced for a query application that gets
# real convertion rates at a given time.

EUR_TO_USD = 1.12
AUD_TO_USD = 0.70

def convert(quantity, currency_source, currency_target, date):
    result = quantity
    if currency_source == 'EUR':
        result *= EUR_TO_USD
    elif currency_source == 'AUD':
        result *= AUD_TO_USD
    return result

