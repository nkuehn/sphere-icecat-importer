#!/bin/sh

cd ../transformed

# run the script that removes duplicate icecat product entries (synonymous manufacturer product ids)
rm on_market.products_rich.csv
../bin/index2unique.py

# FYI: not using the sphere csv-mapper's join capabilities because of performance issues with csv-mapper. using csvkit instead

# Join supplier names to the export file to be able to create the personal file for icecat. 
# (fyi: this is a fairly memory expensive call, needs ca. 1GB RAM)
csvjoin -c supplier_id --left on_market.products_rich.withImages.csv export_suppliers.csv > on_market.products_rich.withImages.withSupplierNames.csv

# Join Category Names to full feed (flat categories assumed - would be nice to be able to reference categories by externalId. 
csvjoin -c Category_ID,catid --left on_market.products_rich.withImages.withSupplierNames.csv categoryNames_en.csv > on_market.products_rich.withImages.withSupplierNames.withCategoryNames.csv

# create a personal index file for the CSV generator in "my Icecat" (not usable for big files)
# on_market and thumb URL serve as placebo for the required deeplink and price fields. You need to set the country to USA in the "my icecat" settings to avoid the VAT error (1=1)
# (commented out as the feature is not capable for such big datasets on icecat side)
# csvcut -c Name,prod_id,ean_upcs,Thumbnail_img,on_market on_market.products_rich.withImages.withSupplierNames.withCategoryNames.csv > personal_index.csv

# grep two specific categories to get a filesize that works. 
# to see category IDs do:
# csvgrep -c value -m notebook transformed/categoryNames_EN.csv | csvlook | less
# -> cat 151 = notebooks
csvgrep -c catid -r "^151$" on_market.products_rich.withImages.withSupplierNames.withCategoryNames.csv > on_market.products_rich.notebooksWithAll.csv
csvgrep -c catid -r "^3005$" on_market.products_rich.withImages.withSupplierNames.withCategoryNames.csv > on_market.products_rich.lipsticksWithAll.csv

cd ../bin
