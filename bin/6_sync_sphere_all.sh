#!/bin/sh

# TODO use env vars for the secrets

# sync categories:
# step one: import flat (no parents)
category-sync -parentBy externalId -p FOO --clientId BAR --clientSecret BAZ import -f ../generated/categories.4sphere.flat.csv
# step two: add data and build the tree (with parents)
category-sync -parentBy externalId -p FOO --clientId BAR --clientSecret BAZ import -f ../generated/categories.4sphere.csv

# optionally: do a full delete and recreate of the products because real sync needs a large amount of local RAM
# unpublish:
# product-csv-sync state --changeTo unpublish --projectKey FOO --clientId BAR --clientSecret BAZ
# delete:
#ä product-csv-sync state --changeTo delete  --projectKey FOO --clientId BAR --clientSecret BAZ

# dry run:
# product-csv-sync import --projectKey FOO --clientId BAR --clientSecret BAZ --csv ../generated/products.4sphere.notebooks.csv --language en --allowRemovalOfVariants --publish --dryRun

# live run (notebooks):
product-csv-sync import --projectKey FOO --clientId BAR --clientSecret BAZ --csv ../generated/products.4sphere.notebooks.csv --language en --allowRemovalOfVariants --publish

# live run (all):
# product-csv-sync import --projectKey FOO --clientId BAR --clientSecret BAZ --csv ../generated/products.4sphere.csv --language en --allowRemovalOfVariants --publish

# once we can switch to sync / update we have to do a publish afterwards:? 
# product-csv-sync state --changeTo publish
