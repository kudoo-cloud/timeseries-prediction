# Prophet

Testing latest version

This repo has scripts to populate a PostgreSQL database with companies, sales,
and inventory items of simulated data. Next, there is a script to make time-series
predictions using the Facebook's library Prophet.

## Data generators

In the folder `generate` are scripts to generate data. Check the
[README](generate/README.md) file. This component is independent from `predict`

**CAUTION:** When generators are run, all previous records in database tables are erased.

## Data predictors

In the folder `predict` are scripts to make sales predictions. Check the
[README](predict/README.md) file. This component is independent from `generate`.

## Database notes

Changes were made in the database schema. A price field was added in Inventory
and SalesOrderLine tables. Primary keys were defined for SalesOrder and
SalesOrderLine tables. To check changes:

    $ diff sql/schema.sql sql/schema_mod.sql


A dump of the final database, after running generators and predictors, is
allocated in `sql/output.sql`.

## Troubleshooting

The pip installation of dotenv may fail. Please use the below:
`pip3 install python-dotenv`

If psycopg2 fails installation on Ubuntu please use the below:
`sudo apt install libpq-dev python3-dev`

Also ensure the `.env` files are setup before running the scripts
