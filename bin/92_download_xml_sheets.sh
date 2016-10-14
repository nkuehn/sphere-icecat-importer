#!/usr/bin/env bash
# you have to provide an environment variable with the icecat password via `export ICECATPWD=fooBar` and the same for
# your IceCat username as `export ICECATUSER=fooBar`

cd  ./xmlDataCache
cat ../transformed/xml_download_job.txt | parallel wget -nv --user $ICECATUSER --password $ICECATPWD --timestamping
cd ..
