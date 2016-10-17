#!/bin/sh

# you have to provide an environment variable with the icecat password via `export ICECATPWD=fooBar` and the same for
# your IceCat username as `export ICECATUSER=fooBar`

mkdir ../downloaded

curl -u $ICECATUSER:$ICECATPWD -o ../downloaded/categorization_1.txt  http://data.icecat.biz/export/freeurls/categorization_1.txt
curl -u $ICECATUSER:$ICECATPWD -o ../downloaded/category.txt.utf8.gz https://data.icecat.biz/export/freexml.int/csv/category.txt.utf8.gz
curl -u $ICECATUSER:$ICECATPWD -o ../downloaded/category_keywords.txt.utf8.gz https://data.icecat.biz/export/freexml.int/csv/category_keywords.txt.utf8.gz
curl -u $ICECATUSER:$ICECATPWD -o ../downloaded/feature.txt.utf8.gz https://data.icecat.biz/export/freexml.int/csv/feature.txt.utf8.gz
curl -u $ICECATUSER:$ICECATPWD -o ../downloaded/category_feature.txt.utf8.gz https://data.icecat.biz/export/freexml.int/csv/category_feature.txt.utf8.gz
curl -u $ICECATUSER:$ICECATPWD -o ../downloaded/feature_group.txt.utf8.gz https://data.icecat.biz/export/freexml.int/csv/feature_group.txt.utf8.gz
curl -u $ICECATUSER:$ICECATPWD -o ../downloaded/category_feature_group.txt.utf8.gz https://data.icecat.biz/export/freexml.int/csv/category_feature_group.txt.utf8.gz

curl -u $ICECATUSER:$ICECATPWD -o ../downloaded/tex.txt.utf8.gz https://data.icecat.biz/export/freexml.int/csv/tex.txt.utf8.gz
curl -u $ICECATUSER:$ICECATPWD -o ../downloaded/vocabulary.txt.utf8.gz https://data.icecat.biz/export/freexml.int/csv/vocabulary.txt.utf8.gz

curl -u $ICECATUSER:$ICECATPWD -o ../downloaded/export_suppliers.txt http://data.icecat.biz/export/freeurls/export_suppliers.txt

curl -u $ICECATUSER:$ICECATPWD -o ../downloaded/on_market.export_urls_rich.txt.gz http://data.icecat.biz/export/freeurls/on_market.export_urls_rich.txt.gz
# same for old products:
curl -u $ICECATUSER:$ICECATPWD -o ../downloaded/export_urls_rich.txt.gz http://data.icecat.biz/export/freeurls/export_urls_rich.txt.gz

curl -u $ICECATUSER:$ICECATPWD -o ../downloaded/daily.export_urls_rich.txt.gz http://data.icecat.biz/export/freeurls/daily.export_urls_rich.txt.gz

gunzip -f -v ../downloaded/*.gz

