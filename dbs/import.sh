#!/bin/bash

BASE=`dirname $0`

python imdbpy2sql.py -d "${BASE}/raw" -u "postgres:///jay"
