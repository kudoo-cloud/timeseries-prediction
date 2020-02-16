# Data Predictors

This folder contains scripts to make predictios for sales.

## Requeriments

Client:

- Python 3
- fbprophet
- pandas
- dotenv
- sqlalchemy
- psycopg2

Server:

- PostgreSQL running in localhost

## Preparation

Before running any script, configure the .env file. To use the example:

    $ cp env-example .env

Variables in the .env file are:

- `DB_USER`: Username to connect to the database
- `DB_PASSWORD`: Password to connecto to the database
- `DB_NAME`: Database name
- `CRON_FREQUENCY`: Time to run the main script by cron
- `PREDICTION_PERIODS`: Number of days to predict

## Usage

Each script has a class with the same name and each class has a method
`predict()`. Classes are:

- SalesValue
- QuantityOfItems

These classes are based on PredictionBase. This one is not intented for direct
usage.

To run any of these scripts, use for example:

    $ python saluesvalue.py

Furthermore, there is a script that run all of them:

    $ python main.py

Depending on size of input data, running time may be large.

## Schedule

A script called `cronsetup.py` is provided to setup cron entries to run
predictors.

    $ python cronsetup.py

## Basic visualization

Using the `bokeh` library, a simple visualization of forecasts is included. To
use it:

    $ bokeh serve --show visualization.py 
