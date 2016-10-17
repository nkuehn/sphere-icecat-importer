#!/bin/sh

cd ../transformed

# to get along without a database, let's create individual CSVs for each language. 
csvgrep --maxfieldsize 250000 --encoding utf8 -c langid -r "^1$" tex.csv | csvcut -c tid,value > tex_en.csv
csvgrep --maxfieldsize 250000 --encoding utf8 -c langid -r "^2$" tex.csv | csvcut -c tid,value > tex_nl.csv
csvgrep --maxfieldsize 250000 --encoding utf8 -c langid -r "^3$" tex.csv | csvcut -c tid,value > tex_fr.csv
csvgrep --maxfieldsize 250000 --encoding utf8 -c langid -r "^4$" tex.csv | csvcut -c tid,value > tex_de.csv
csvgrep --maxfieldsize 250000 --encoding utf8 -c langid -r "^5$" tex.csv | csvcut -c tid,value > tex_it.csv
csvgrep --maxfieldsize 250000 --encoding utf8 -c langid -r "^6$" tex.csv | csvcut -c tid,value > tex_es.csv

csvgrep --maxfieldsize 250000 --encoding utf8 -c langid -r "^1$" vocabulary.csv | csvcut -c sid,value > vocabulary_en.csv
csvgrep --maxfieldsize 250000 --encoding utf8 -c langid -r "^2$" vocabulary.csv | csvcut -c sid,value > vocabulary_nl.csv
csvgrep --maxfieldsize 250000 --encoding utf8 -c langid -r "^3$" vocabulary.csv | csvcut -c sid,value > vocabulary_fr.csv
csvgrep --maxfieldsize 250000 --encoding utf8 -c langid -r "^4$" vocabulary.csv | csvcut -c sid,value > vocabulary_de.csv
csvgrep --maxfieldsize 250000 --encoding utf8 -c langid -r "^5$" vocabulary.csv | csvcut -c sid,value > vocabulary_it.csv
csvgrep --maxfieldsize 250000 --encoding utf8 -c langid -r "^6$" vocabulary.csv | csvcut -c sid,value > vocabulary_es.csv

# join tex strings into the categories CSV (full join for the name, categories without even an english name don't help)
# (the minus sign references to STDIN in csvjoin)
csvjoin --maxfieldsize 250000  -c sid category.csv vocabulary_en.csv | sed "1s/,sid,value/,sid.en,category_name.en/" | csvjoin -c tid --left - tex_en.csv | sed "1s/,tid,value/,tid.en,category_description.en/" > category_en.csv

# create a minimal names index for joining into products (for easier debugging of the category mapping)
# TODO "Column identifier "value" is neither an integer, nor a existing column's name."
csvcut --maxfieldsize 250000  -c catid,category_name.en category_en.csv > categoryNames_en.csv

cd ../bin
