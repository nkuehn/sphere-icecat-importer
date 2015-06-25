#!/bin/sh

# sort by parent ID (and then ID?) and hope that that's enough to be able to build the tree (until category import can build the tree itself)
csvsort -c pcatid,catid ../transformed/category_en.csv > category_en.sorted.csv

# TODO filter categories by "visible" (or enable import to take them as unpublished)

# map categories as SPHERE import wants it.
csv-mapper -m ../mapping_categories.yaml --inCsv ../transformed/category_en.csv  --outCsv ../generated/categories.4sphere.csv

