#!/usr/bin/python

# This script creates an interactive plot of
# sales forecasts by company

# To run, use:
# bokeh server --show visualization.py

import pandas as pd
from bokeh.models import ColumnDataSource, DataRange1d, Select
from bokeh.plotting import figure, save, output_file
from bokeh.layouts import column, row
from bokeh.io import curdoc
from datetime import datetime

def dataset(source, company):
    df = source[source.company == company].copy()
    return ColumnDataSource(df)

def make_plot(source, title):
    plot = figure(x_axis_type="datetime", plot_width=800)
    plot.scatter(x='ds', y='yhat', color='blue', source=source)
    plot.line(x='ds', y='yhat', color='green', line_width=0.3, source=source)
    plot.yaxis.axis_label = "Sales (USD)"
    return plot

def update_plot(attr, old, new):
    company = company_select.value
    src = dataset(df, company)
    source.data.update(src.data)

output_file = 'forecast.html'
df = pd.read_csv('csv/salesvalues.csv')
df['ds'] = df.ds.apply(datetime.fromisoformat)
df['company'] = df.company.apply(str)
company = df.company.values[0]
company_select = Select(value=company, title='company',
        options=list(df.company.sort_values().unique()))
source = dataset(df, company)
plot = make_plot(source, 'Forecasts %s' % company)
company_select.on_change('value', update_plot)
controls = column(company_select)
curdoc().add_root(row(plot, controls))
curdoc().title = 'Forecast'
