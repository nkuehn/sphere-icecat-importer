#!/bin/sh
# Split the full import into chunks of 50000 products (to be optimized)
# copyright  https://edmondscommerce.github.io/linux/linux-split-file-eg-csv-and-keep-header-row.html
# WARN: This splits the CSV without making sure that a product will not be split into variants. So you'll effectively lose some variants
# if you use the "remove variants" parameter of the product csv sync. 

cd ../generated
mkdir split_all_products
cd split_all_products

tail -n +2 ../all_products.4sphere.csv | split -l 50000 - all_products.4sphere_
rename -a '.csv' *
for file in *
do
    head -n 1 ../all_products.4sphere.csv > tmp_file
    cat $file >> tmp_file
    mv -f tmp_file $file
done

cd ..

zip -r -j all_products.4sphere.zip split_all_products 

cd ../bin
