#!/bin/sh

cd ../transformed

mkdir ../generated

# Caveat: you do need a 64bit OS, a current Node and Python installation and sufficent RAM free (2-4 GB)

# because csv-mapper can't use columns as groupColumn that are generated in the same step we first generate a CSV with a group id:
csv-mapper -m ../mapping_add_model_id.yaml --inCsv on_market.products_rich.withSupplierNames.withCategoryNames.csv --outCsv on_market.4sphere.csv 
# csv-mapper -m ../mapping_add_model_id.yaml --inCsv on_market.products_rich.notebooksWithAll.csv --outCsv on_market.4sphere.notebooks.csv 

# the group and variant ID stuff works only on sorted files, so let's sort by the id we just generated:
csvsort -c model_identifier,product_id on_market.4sphere.csv > on_market.4sphere.sorted.csv
# csvsort -c model_identifier,product_id on_market.4sphere.notebooks.csv > on_market.4sphere.notebooks.sorted.csv

# Now the great impressive last step: transform to a SPHERE compatible CSV
csv-mapper -m ../mapping_noattributes.yaml --inCsv on_market.4sphere.csv  --outCsv ../generated/products.4sphere.csv 
# csv-mapper -m ../mapping_noattributes.yaml --inCsv on_market.4sphere.notebooks.sorted.csv  --outCsv ../generated/products.4sphere.notebooks.csv 

# check the data:
# csvstat ../generated/products.4sphere.csv 

cd ../bin
