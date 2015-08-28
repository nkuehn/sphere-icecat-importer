#!/bin/sh

# TODO filter categories by "visible" (or enable import to take them as unpublished) (via csvgrep?)

# map and enhance  categories as SPHERE import wants it.
# TODO join descriptions in a separate step (memory limitation of the csv-mapper) or improve CSV mapper join efficiency
csv-mapper -m ../mapping_categories.yaml --inCsv ../transformed/category_en.csv  --outCsv ../generated/categories.4sphere.csv

# create a minimal clone of the category tree that has no parents (for two-pass import to build tree)
# TODO remove step once the category import can handle unsorted files
csvcut -c externalId,name.en,slug.en ../generated/categories.4sphere.csv > ../generated/categories.4sphere.flat.csv

# TODO create custom type with fields for watched_top10, visible, participate_in_title, searchable and import these


