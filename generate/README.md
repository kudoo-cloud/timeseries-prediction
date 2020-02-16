# Data Generators

This folder contains scripts to generate simulated data and to popopulate the
database.

## Requeriments

Client:

- Python 3
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
- `COMPANIES_NUM`: Number of companies to generate
- `MAX_CUSTOMER_NUM`: Maximum number of customers to generate
- `MAX_INVENTORY_ITEM_NUM`: Maximum number of inventory items to generate for
  each company
- `MAX_ORDER_BY_DAY`: Maximun number of orders by day to generate for each
  company
- `MAX_ITEMS_BY_ORDER`: Maximun number of items to generate by order
- `MAX_QUANTITY_BY_ITEM`: Maximun quantity for inventory item in orders
- `SIM_START_DATE`: Start date for simulation (ISO format)
- `SIM_END_DATE`: End date for simulation (ISO format)

## Usage

Each script has a class with the same name and each class has a method 
`generate()`. Classes are:

- Company
- Customer
- Inventory
- WareHouse
- SalesOrder
- SalesOrderLine

To run any of these scripts, use for example:

    $ python company.py

Keep the same order to run these scripts.

Furthermore, there is a script that run all of them:

    $ python main.py

Depending on values assigned in the `.env` file, time running can be large.
