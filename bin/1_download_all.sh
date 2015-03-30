#!/bin/sh

mkdir ../downloaded
cd ../downloaded

curl -u nikolauskuehn:spheredemo11 -o categorization_1.txt.gz  http://data.icecat.biz/export/freeurls/categorization_1.txt.gz
curl -u nikolauskuehn:spheredemo11 -o category.txt.utf8.gz http://data.icecat.biz/export/freeurls/category.txt.utf8.gz
curl -u nikolauskuehn:spheredemo11 -o category_keywords.txt.utf8.gz http://data.icecat.biz/export/freeurls/category_keywords.txt.utf8.gz
curl -u nikolauskuehn:spheredemo11 -o feature.txt.utf8.gz http://data.icecat.biz/export/freeurls/feature.txt.utf8.gz
curl -u nikolauskuehn:spheredemo11 -o category_feature.txt.utf8.gz http://data.icecat.biz/export/freeurls/category_feature.txt.utf8.gz
curl -u nikolauskuehn:spheredemo11 -o feature_group.txt.utf8.gz http://data.icecat.biz/export/freeurls/feature_group.txt.utf8.gz 
curl -u nikolauskuehn:spheredemo11 -o category_feature_group.txt.utf8.gz http://data.icecat.biz/export/freeurls/category_feature_group.txt.utf8.gz

curl -u nikolauskuehn:spheredemo11 -o tex.txt.utf8.gz http://data.icecat.biz/export/freeurls/tex.txt.utf8.gz
curl -u nikolauskuehn:spheredemo11 -o vocabulary.txt.utf8.gz http://data.icecat.biz/export/freeurls/vocabulary.txt.utf8.gz

curl -u nikolauskuehn:spheredemo11 -o export_suppliers.txt http://data.icecat.biz/export/freeurls/export_suppliers.txt

curl -u nikolauskuehn:spheredemo11 -o on_market.export_urls_rich.txt.gz http://data.icecat.biz/export/freeurls/on_market.export_urls_rich.txt.gz

gunzip *

mkdir ../transformed

csvformat --tabs categorization_1.txt > ../transformed/categorization_EN.csv
csvformat --tabs --encoding utf8 category.txt.utf8 > ../transformed/category.csv
csvformat --tabs --encoding utf8 category_keywords.txt.utf8 > ../transformed/category_keywords.csv
csvformat --tabs --encoding utf8 feature.txt.utf8 > ../transformed/feature.csv
csvformat --tabs --encoding utf8 category_feature.txt.utf8 > ../transformed/category_feature.csv
csvformat --tabs --encoding utf8 feature_group.txt.utf8 > ../transformed/feature_group.csv
csvformat --tabs --encoding utf8 category_feature_group.txt.utf8 > ../transformed/category_feature_group.csv

# TODO  tex file contains a null byte and may break stuff later on. 
csvformat --tabs --encoding utf8 tex.txt.utf8 > ../transformed/tex.csv
csvformat --tabs --encoding utf8 vocabulary.txt.utf8 > ../transformed/vocabulary.csv
csvformat --tabs export_suppliers.txt > ../transformed/export_suppliers.csv
csvformat --tabs on_market.export_urls_rich.txt > ../transformed/on_market.export_urls_rich.csv

cd ../bin
