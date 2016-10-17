#!/bin/sh

# WORD OF WARNING: this script runs ca. 40 minutes on a halfway decent MBP
# Lipsticks: 1second
# Notebooks: ca 40 seconds
# All: ca 30 minutes

cd ../transformed

mkdir ../generated

# because csv-mapper can't use columns as groupColumn that are generated in the same step we first generate a CSV with a group id:
csv-mapper -m ../mapping_add_model_id.yaml --inCsv on_market.products_rich.lipsticksWithAll.csv --outCsv on_market.4sphere.lipsticks.csv
csv-mapper -m ../mapping_add_model_id.yaml --inCsv on_market.products_rich.notebooksWithAll.csv --outCsv on_market.4sphere.notebooks.csv
csv-mapper -m ../mapping_add_model_id.yaml --inCsv on_market.products_rich.withSupplierNames.withCategoryNames.csv --outCsv on_market.4sphere.csv
# plus: including the archive of products:
csv-mapper -m ../mapping_add_model_id.yaml --inCsv products_rich.withSupplierNames.withCategoryNames.csv --outCsv 4sphere.csv

# the group and variant ID stuff works only on sorted files, so let's sort by the id we just generated:
csvsort --maxfieldsize 250000 -c model_identifier,product_id on_market.4sphere.lipsticks.csv > on_market.4sphere.lipsticks.sorted.csv
csvsort --maxfieldsize 250000 -c model_identifier,product_id on_market.4sphere.notebooks.csv > on_market.4sphere.notebooks.sorted.csv
csvsort --maxfieldsize 250000 -c model_identifier,product_id on_market.4sphere.csv > on_market.4sphere.sorted.csv
# plus: including the archive of products:
csvsort --maxfieldsize 250000 -c model_identifier,product_id 4sphere.csv > 4sphere.sorted.csv

# Now the great impressive last step: transform to a SPHERE compatible CSV
csv-mapper -m ../mapping_noattributes.yaml --inCsv on_market.4sphere.lipsticks.sorted.csv  --outCsv ../generated/products.4sphere.lipsticks.csv
csv-mapper -m ../mapping_noattributes.yaml --inCsv on_market.4sphere.notebooks.sorted.csv  --outCsv ../generated/products.4sphere.notebooks.csv
csv-mapper -m ../mapping_noattributes.yaml --inCsv on_market.4sphere.sorted.csv  --outCsv ../generated/products.4sphere.csv
# plus: including the archive of products:
csv-mapper -m ../mapping_noattributes.yaml --inCsv 4sphere.sorted.csv  --outCsv ../generated/all_products.4sphere.csv

# optionally analyze the data:
# csvstat ../generated/products.4sphere.csv 
# csvstat ../generated/all_products.4sphere.csv 

cd ../bin

