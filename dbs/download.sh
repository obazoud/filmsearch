#!/bin/bash

# Script to download the full, initial imdb files for import
BASE=`dirname $0`
MIRROR="ftp://ftp.sunet.se/pub/tv+movies/imdb/"
FILES=( "actors" "actresses" "cinematographers" "composers" "countries" "directors" "distributors" "editors" "genres" "keywords" "language" "locations" "movies" "producers" "release-dates" "running-times" "soundtracks" "writers" )

mkdir -p ${BASE}/raw

for file in ${FILES[@]}
do
	wget --directory-prefix "${BASE}/raw" --timestamping --continue "${MIRROR}/${file}.list.gz"
done;
