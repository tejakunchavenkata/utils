#! /usr/bin/env python3
#------------------------------------------------
# Author:    kasula
# Created:   Tue Dec 26 14:20:17 IST 2017
# File Name: csv2html.py
# USAGE:
#       csv2html.py <delimiter> < csvFile
# Description:
#   Converts the CSV content from stdin into html
#------------------------------------------------
import pandas as pd
import sys

df = pd.read_csv(sys.stdin, sys.argv[1])
print(df.style.render())
