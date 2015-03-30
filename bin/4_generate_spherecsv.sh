#!/bin/sh

cd ../transformed

mkdir ../generated

# because csv-mapper can't use columns as groupColumn that are generated in the same step we first generate a CSV with a group id:
# csv-mapper -m ../mapping_add_model_id.yaml --inCsv on_market.products_rich.withImages.withSupplierNames.withCategoryNames.csv --outCsv on_market.4sphere.csv 
# use the smaller file (csv mapper can't cope with the big one)
csv-mapper -m ../mapping_add_model_id.yaml --inCsv on_market.products_rich.notebooksWithAll.csv --outCsv on_market.4sphere.notebooks.csv 

# the group and variant ID stuff works only on sorted files, so let's sort by the id we just generated:
csvsort -c model_identifier,product_id on_market.4sphere.notebooks.csv > on_market.4sphere.notebooks.sorted.csv

# Now the great impressive last step: transform to a SPHERE compatible CSV
# TODO not enough memory / CPU / whatever in node.js.  Increasing it via --max_old_space_size 1741 causes complete Mac OS X crash. 
# csv-mapper -m ../mapping_noattributes.yaml --inCsv on_market.4sphere.csv  --outCsv ../generated/products.4sphere.csv 
# for now, do the notebooks only:
csv-mapper -m ../mapping_noattributes.yaml --inCsv on_market.4sphere.notebooks.sorted.csv  --outCsv ../generated/products.4sphere.notebooks.csv 

# check the data:
# csvstat products.4sphere.csv

cd ../bin
