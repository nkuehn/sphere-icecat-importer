#!/bin/sh

# sync categories:
category-sync -p icecat-opencatalog-notebooks-1 --clientId FOO --clientSecret BAR import -f ../generated/categories.4sphere.csv

# optionally: do a full delete and recreate of the products because real sync needs a large amount of local RAM
# unpublish:
# product-csv-sync state --changeTo unpublish --projectKey icecat-opencatalog-notebooks-1 --clientId FOO --clientSecret BAR
# delete:
#ä product-csv-sync state --changeTo delete  --projectKey icecat-opencatalog-notebooks-1 --clientId FOO --clientSecret BAR

# dry run:
# product-csv-sync import --projectKey icecat-opencatalog-1 --clientId FOO --clientSecret BAR --csv ../generated/products.4sphere.notebooks.csv --language en --allowRemovalOfVariants --publish --dryRun

# live run (notebooks):
product-csv-sync import --projectKey icecat-opencatalog-notebooks-1 --clientId FOO --clientSecret BAR --csv ../generated/products.4sphere.notebooks.csv --language en --allowRemovalOfVariants --publish

# live run (all):
# product-csv-sync import --projectKey icecat-opencatalog-notebooks-1 --clientId FOO --clientSecret NAR --csv ../generated/products.4sphere.csv --language en --allowRemovalOfVariants --publish

# once we can switch to sync / update we have to do a publish afterwards:? 
# product-csv-sync state --changeTo publish
