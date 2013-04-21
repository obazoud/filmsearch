#!/bin/bash

# Script to download the full, initial imdb files for import
BASE="ftp://ftp.sunet.se/pub/tv+movies/imdb/"
FILES=( "actors" "actresses" "cinematographers" "composers" "countries" "directors" "distributors" "editors" "genres" "keywords" "language" "locations" "movies" "producers" "release-dates" "running-times" "soundtracks" "writers" )

for file in ${FILES[@]}
do
	wget "${BASE}/${file}.list.gz"
done;
