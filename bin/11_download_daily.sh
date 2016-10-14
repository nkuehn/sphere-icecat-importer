#!/bin/sh

# you have to provide an environment variable with the icecat password via `export ICECATPWD=fooBar` and the same for
# your IceCat username as `export ICECATUSER=fooBar`

mkdir ../downloaded
cd ../downloaded

curl -u $ICECATUSER:$ICECATPWD -o daily.export_urls_rich.txt.gz http://data.icecat.biz/export/freeurls/daily.export_urls_rich.txt.gz

gunzip -f -v *.gz

mkdir ../transformed

csvformat --tabs daily.export_urls_rich.txt > ../transformed/daily.on_market.export_urls_rich.csv

cd ../bin
