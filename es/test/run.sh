#!/bin/bash

DIR=`dirname $0`

# Delete and create test index
curl -XDELETE "http://localhost:9200/test_movies" && echo
curl -XPUT "http://localhost:9200/test_movies"  && echo
curl -XPUT "http://localhost:9200/test_movies/movie/_mapping" -d @${DIR}/../config/mappings/movies/default-mapping.json && echo

# Populate test data
for doc in ${DIR}/data/*.json
do
     curl -XPOST "http://localhost:9200/test_movies/movie" -d @${doc} && echo
done;

curl -XPOST "http://localhost:9200/test_movies/_refresh" && echo
