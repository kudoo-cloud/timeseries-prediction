# Setup of libraries

import io
import os
import psycopg2                        # For PostgreSQL interface
from sqlalchemy import create_engine   # For PostgreSQL interface
from dotenv import load_dotenv

# Initialization

load_dotenv()

def emptyTable(table_name):
    conn = psycopg2.connect("dbname=kudoo_dev user=postgres host=localhost password=postgres port=5432")
    #conn = psycopg2.connect("dbname={} user={} host=localhost password={} port=5432".format(os.getenv('DB_NAME'), os.getenv('DB_USER'), os.getenv('DB_PASSWORD')))
    cur = conn.cursor()
    cur.execute('DELETE FROM %s' % table_name)
    conn.commit()
    cur.close()

def tableToDBM(dataframe, name):
    table_name = '"default$default"."{}"'.format(name)
    emptyTable(table_name)
    engine = create_engine(
                #'postgresql+psycopg2://{}:{}@localhost:5432/{}' \
                'postgresql+psycopg2://postgres:postgres@localhost:5432/kudoo_dev' #\
                #    .format(
                #        os.getenv('DB_USER'),
                #        os.getenv('DB_PASSWORD'),
                #        os.getenv('DB_NAME')
                #    )
            )
    dataframe.head(0) \
            .to_sql(table_name, engine, if_exists='replace', index=False)
    conn = engine.raw_connection()
    cur = conn.cursor()
    output = io.StringIO()
    dataframe.to_csv(output, sep='\t', header=False, index=False)
    output.seek(0)
    contents = output.getvalue()
    cur.copy_from(output, table_name, null='')
    conn.commit()
    print("%d records stored" % len(dataframe))
