#!/bin/sh

# you have to provide an environment variable with the icecat password via `export ICECATPWD=fooBar` and the same for
# your IceCat username as `export ICECATUSER=fooBar`

mkdir ../transformed

csvformat --tabs --maxfieldsize 250000 ../downloaded/categorization_1.txt > ../transformed/categorization_EN.csv
csvformat --tabs --maxfieldsize 250000 --encoding utf8 ../downloaded/category.txt.utf8 > ../transformed/category.csv
csvformat --tabs --maxfieldsize 250000 --encoding utf8 ../downloaded/category_keywords.txt.utf8 > ../transformed/category_keywords.csv
csvformat --tabs --maxfieldsize 250000 --encoding utf8 ../downloaded/feature.txt.utf8 > ../transformed/feature.csv
csvformat --tabs --maxfieldsize 250000 --encoding utf8 ../downloaded/category_feature.txt.utf8 > ../transformed/category_feature.csv
csvformat --tabs --maxfieldsize 250000 --encoding utf8 ../downloaded/feature_group.txt.utf8 > ../transformed/feature_group.csv
csvformat --tabs --maxfieldsize 250000 --encoding utf8 ../downloaded/category_feature_group.txt.utf8 > ../transformed/category_feature_group.csv

# FYI: tex file contains a null byte and may break stuff later on.
csvformat --tabs --maxfieldsize 250000 --encoding utf8 ../downloaded/tex.txt.utf8 > ../transformed/tex.csv
csvformat --tabs --maxfieldsize 250000 --encoding utf8 ../downloaded/vocabulary.txt.utf8 > ../transformed/vocabulary.csv
csvformat --tabs --maxfieldsize 250000 ../downloaded/export_suppliers.txt > ../transformed/export_suppliers.csv

csvformat --tabs --maxfieldsize 250000 ../downloaded/on_market.export_urls_rich.txt > ../transformed/on_market.export_urls_rich.csv
csvformat --tabs --maxfieldsize 250000 ../downloaded/export_urls_rich.txt > ../transformed/export_urls_rich.csv

csvformat --tabs --maxfieldsize 250000 ../downloaded/daily.export_urls_rich.txt > ../transformed/on_market.export_urls_rich.csv

