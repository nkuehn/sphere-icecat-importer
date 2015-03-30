#!/bin/sh

# this does a full delete and recreate because real sync via updates currently blows the platform. 

# unpublish:
product-csv-sync state --changeTo unpublish --projectKey icecat-opencatalog-notebooks-1 --clientId XXX --clientSecret XXX  
# delete:
product-csv-sync state --changeTo delete  --projectKey icecat-opencatalog-notebooks-1 --clientId XXX --clientSecret XXX  

# dry run:
# product-csv-sync import --projectKey icecat-opencatalog-1 --clientId XXX --clientSecret XXX --csv ../generated/products.4sphere.notebooks.csv --language en --allowRemovalOfVariants --publish --dryRun

# live run:
product-csv-sync import --projectKey icecat-opencatalog-notebooks-1 --clientId XXX --clientSecret XXX --csv ../generated/products.4sphere.notebooks.csv --language en --allowRemovalOfVariants --publish 

# once we can switch to sync / update we have to do a publish afterwards:? 
# product-csv-sync state --changeTo publish
