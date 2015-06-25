#!/bin/sh

mkdir ../downloaded
cd ../downloaded

curl -u nikolauskuehn:spheredemo11 -o categorization_1.txt  http://data.icecat.biz/export/freeurls/categorization_1.txt
curl -u nikolauskuehn:spheredemo11 -o category.txt.utf8.gz https://data.icecat.biz/export/freexml.int/csv/category.txt.utf8.gz
curl -u nikolauskuehn:spheredemo11 -o category_keywords.txt.utf8.gz https://data.icecat.biz/export/freexml.int/csv/category_keywords.txt.utf8.gz
curl -u nikolauskuehn:spheredemo11 -o feature.txt.utf8.gz https://data.icecat.biz/export/freexml.int/csv/feature.txt.utf8.gz
curl -u nikolauskuehn:spheredemo11 -o category_feature.txt.utf8.gz https://data.icecat.biz/export/freexml.int/csv/category_feature.txt.utf8.gz
curl -u nikolauskuehn:spheredemo11 -o feature_group.txt.utf8.gz https://data.icecat.biz/export/freexml.int/csv/feature_group.txt.utf8.gz 
curl -u nikolauskuehn:spheredemo11 -o category_feature_group.txt.utf8.gz https://data.icecat.biz/export/freexml.int/csv/category_feature_group.txt.utf8.gz

curl -u nikolauskuehn:spheredemo11 -o tex.txt.utf8.gz https://data.icecat.biz/export/freexml.int/csv/tex.txt.utf8.gz
curl -u nikolauskuehn:spheredemo11 -o vocabulary.txt.utf8.gz https://data.icecat.biz/export/freexml.int/csv/vocabulary.txt.utf8.gz

curl -u nikolauskuehn:spheredemo11 -o export_suppliers.txt http://data.icecat.biz/export/freeurls/export_suppliers.txt

curl -u nikolauskuehn:spheredemo11 -o on_market.export_urls_rich.txt.gz http://data.icecat.biz/export/freeurls/on_market.export_urls_rich.txt.gz

gunzip -f -v *.gz

mkdir ../transformed

csvformat --tabs categorization_1.txt > ../transformed/categorization_EN.csv
csvformat --tabs --encoding utf8 category.txt.utf8 > ../transformed/category.csv
csvformat --tabs --encoding utf8 category_keywords.txt.utf8 > ../transformed/category_keywords.csv
csvformat --tabs --encoding utf8 feature.txt.utf8 > ../transformed/feature.csv
csvformat --tabs --encoding utf8 category_feature.txt.utf8 > ../transformed/category_feature.csv
csvformat --tabs --encoding utf8 feature_group.txt.utf8 > ../transformed/feature_group.csv
csvformat --tabs --encoding utf8 category_feature_group.txt.utf8 > ../transformed/category_feature_group.csv

# FYI: tex file contains a null byte and may break stuff later on.
csvformat --tabs --encoding utf8 tex.txt.utf8 > ../transformed/tex.csv
csvformat --tabs --encoding utf8 vocabulary.txt.utf8 > ../transformed/vocabulary.csv
csvformat --tabs export_suppliers.txt > ../transformed/export_suppliers.csv
csvformat --tabs on_market.export_urls_rich.txt > ../transformed/on_market.export_urls_rich.csv

cd ../bin
