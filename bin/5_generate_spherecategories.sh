#!/bin/sh

# TODO filter categories by "visible" (or enable import to take them as unpublished)

# map and enhance  categories as SPHERE import wants it.
# TODO join descriptions in a separate step (memory limitation of the csv-mapper)
csv-mapper -m ../mapping_categories.yaml --inCsv ../transformed/category_en.csv  --outCsv ../transformed/categories.4sphere.unsorted.csv

# sort by parent ID (and then ID?) and hope that that's enough to be able to build the tree (until category import can build the tree itself)
# TODO remove once the category import does support unsorted (currently enables to import at least the root nodes)
csvsort -c parentId,externalId ../transformed/categories.4sphere.unsorted.csv > ../generated/categories.4sphere.csv

