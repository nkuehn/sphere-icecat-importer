#!/bin/sh

# you have to provide your commercetools credentials as environment variables:
# export CT_PROJECT=fooBar
# export CT_CLIENT_ID=fooBar
# export CT_CLIENT_SECRET=fooBar

# sync categories:
# step one: import flat (no parents)
category-sync -parentBy externalId -p $CT_PROJECT --clientId $CT_CLIENT_ID --clientSecret $CT_CLIENT_SECRET import -f ../generated/categories.4sphere.flat.csv
# step two: add data and build the tree (with parents)
category-sync -parentBy externalId -p $CT_PROJECT --clientId $CT_CLIENT_ID --clientSecret $CT_CLIENT_SECRET import -f ../generated/categories.4sphere.csv

# optionally: do a full delete and recreate of the products because real sync needs a large amount of local RAM
# unpublish:
# product-csv-sync state --changeTo unpublish --projectKey $CT_PROJECT --clientId $CT_CLIENT_ID --clientSecret $CT_CLIENT_SECRET
# delete:
# product-csv-sync state --changeTo delete  --projectKey $CT_PROJECT --clientId $CT_CLIENT_ID --clientSecret $CT_CLIENT_SECRET

# dry run:
# product-csv-sync import --projectKey $CT_PROJECT --clientId $CT_CLIENT_ID --clientSecret $CT_CLIENT_SECRET --csv ../generated/products.4sphere.notebooks.csv --matchBy sku --language en --allowRemovalOfVariants --publish --dryRun

# live run (all):
# product-csv-sync import --projectKey $CT_PROJECT --clientId $CT_CLIENT_ID --clientSecret $CT_CLIENT_SECRET --csv ../generated/products.4sphere.csv --matchBy sku --language en --allowRemovalOfVariants --publish

# live run (notebooks):
product-csv-sync import --projectKey $CT_PROJECT --clientId $CT_CLIENT_ID --clientSecret $CT_CLIENT_SECRET --csv ../generated/products.4sphere.notebooks.csv --matchBy sku --language en --allowRemovalOfVariants --publish


# once we can switch to sync / update we have to do a publish afterwards:? 
# product-csv-sync state --changeTo publish
