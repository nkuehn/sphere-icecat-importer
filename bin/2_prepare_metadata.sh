#!/bin/sh

cd ../transformed

# to get along without a database, let's create individual CSVs for each language. 
csvgrep --encoding utf8 -c langid -r "^1$" tex.csv | csvcut -c tid,value > tex_en.csv
csvgrep --encoding utf8 -c langid -r "^2$" tex.csv | csvcut -c tid,value > tex_nl.csv
csvgrep --encoding utf8 -c langid -r "^3$" tex.csv | csvcut -c tid,value > tex_fr.csv
csvgrep --encoding utf8 -c langid -r "^4$" tex.csv | csvcut -c tid,value > tex_de.csv
csvgrep --encoding utf8 -c langid -r "^5$" tex.csv | csvcut -c tid,value > tex_it.csv
csvgrep --encoding utf8 -c langid -r "^6$" tex.csv | csvcut -c tid,value > tex_es.csv

csvgrep --encoding utf8 -c langid -r "^1$" vocabulary.csv | csvcut -c sid,value > vocabulary_en.csv
csvgrep --encoding utf8 -c langid -r "^2$" vocabulary.csv | csvcut -c sid,value > vocabulary_nl.csv
csvgrep --encoding utf8 -c langid -r "^3$" vocabulary.csv | csvcut -c sid,value > vocabulary_fr.csv
csvgrep --encoding utf8 -c langid -r "^4$" vocabulary.csv | csvcut -c sid,value > vocabulary_de.csv
csvgrep --encoding utf8 -c langid -r "^5$" vocabulary.csv | csvcut -c sid,value > vocabulary_it.csv
csvgrep --encoding utf8 -c langid -r "^6$" vocabulary.csv | csvcut -c sid,value > vocabulary_es.csv


# join tex strings into the categories CSV (full join for the name, categories without even an english name don't help)
# (the minus sign references to STDIN in csvjoin)
# (if it were faster, we could use the "lookup" feature of our own csv-mapper instead of using csvjoin)
csvjoin -c sid category.csv vocabulary_en.csv | sed "1s/,sid,value/,sid.en,name.en/" | csvjoin -c tid --left - tex_en.csv | sed "1s/,tid,value/,tid.en,description.en/" > category_en.csv
rm category_en.tmp.csv

# create a minimal names index for joining into products
csvcut -c catid,value category_en.csv > categoryNames_en.csv

cd ../bin
