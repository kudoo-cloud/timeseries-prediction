#!/usr/bin/python

# This script writes to the crontab system file
# a new entry to run predictors every period of time.

import os
from dotenv import load_dotenv
from subprocess import check_output, call

load_dotenv()

def setCronEntry():
    freq = os.getenv('CRON_FREQUENCY')
    path = os.getcwd()
    command = path + '/main.py'
    cron_str = check_output(['crontab', '-l']).decode('ascii').split('\n')
    for i, j in enumerate(cron_str):
        if cron_str[i].find(command) >= 0:
            del cron_str[i]
        if cron_str[i] == '':
            del cron_str[i]
    cron_str.append("%s python %s" % (freq, command))
    with open('crontab.txt', 'w') as fd:
        fd.write('\n'.join(cron_str) + '\n')
    call(['crontab', 'crontab.txt']) 

if __name__ == '__main__':
    setCronEntry()
