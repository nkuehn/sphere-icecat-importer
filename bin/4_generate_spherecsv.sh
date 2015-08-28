#!/bin/sh

# WORD OF WARNING: this script runs ca. 40 minutes on a halfway decent MBP

cd ../transformed

mkdir ../generated

# because csv-mapper can't use columns as groupColumn that are generated in the same step we first generate a CSV with a group id:
# csv-mapper -m ../mapping_add_model_id.yaml --inCsv on_market.products_rich.withSupplierNames.withCategoryNames.csv --outCsv on_market.4sphere.csv
# csv-mapper -m ../mapping_add_model_id.yaml --inCsv on_market.products_rich.notebooksWithAll.csv --outCsv on_market.4sphere.notebooks.csv
csv-mapper -m ../mapping_add_model_id.yaml --inCsv on_market.products_rich.lipsticksWithAll.csv --outCsv on_market.4sphere.lipsticks.csv

# the group and variant ID stuff works only on sorted files, so let's sort by the id we just generated:
# csvsort -c model_identifier,product_id on_market.4sphere.csv > on_market.4sphere.sorted.csv
# csvsort -c model_identifier,product_id on_market.4sphere.notebooks.csv > on_market.4sphere.notebooks.sorted.csv
csvsort -c model_identifier,product_id on_market.4sphere.lipsticks.csv > on_market.4sphere.lipsticks.sorted.csv

# Now the great impressive last step: transform to a SPHERE compatible CSV
# csv-mapper -m ../mapping_noattributes.yaml --inCsv on_market.4sphere.csv  --outCsv ../generated/products.4sphere.csv
# csv-mapper -m ../mapping_noattributes.yaml --inCsv on_market.4sphere.notebooks.sorted.csv  --outCsv ../generated/products.4sphere.notebooks.csv
csv-mapper -m ../mapping_noattributes.yaml --inCsv on_market.4sphere.lipsticks.sorted.csv  --outCsv ../generated/products.4sphere.lipsticks.csv

# optionally analyze the data:
# csvstat ../generated/products.4sphere.csv 

cd ../bin

