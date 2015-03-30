#!/usr/bin/python
# other than the XML, the icecat CSV file is an "index", so products occur multiple times if they are known by different manufacturer ids
# this script takes only the first occurrence and does some more filtering (like requiring an image URL). 

# TODO check if encoding is handled correctly. Unicode? 

import csv
with open('../transformed/on_market.export_urls_rich.csv', 'rb') as indexfile, open('../transformed/on_market.products_rich.csv', 'wb') as productsfile:
	indexreader = csv.reader(indexfile)
	productswriter = csv.writer(productsfile)
	prodids = set()  # set is waaaay faster than list for this case
	rowsbuffer = []  # flush many lines at once
	linecount = 0
	prodcount = 0
	for row in indexreader :
		linecount += 1
		if (row[0] not in prodids) and (row[5]):  # check if product is no dupe and if there is an image URL filled
			if len(rowsbuffer) > 200 :
				productswriter.writerows(rowsbuffer)
				del rowsbuffer[:]
			rowsbuffer.append(row)
			prodids.add(row[0])
			prodcount += 1
	productswriter.writerows(rowsbuffer)
	print linecount, " lines, ", prodcount, " products with unique ids"
