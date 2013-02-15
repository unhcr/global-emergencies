import sys, csv, locale, os
import simplejson as json
from itertools import groupby
locale.setlocale(locale.LC_ALL, '')
# -----------------------
# Process Finances Figures 
# -----------------------
#"isocode","emergency","supp_budget","fund_receive","fund_shortfall","pct_funded","graph","date"
try:
	os.chdir("../")
	data_file = csv.DictReader(open('data/update-data/unhcr-finances.csv', 'rb'), delimiter= ',', quotechar = '"')
	data_sort = sorted(data_file, key=lambda x: x['isocode'])

	geo_file = open('data/process-data/world-full-centroids.geojson', "rb").read()
	geo = json.loads(geo_file)

	geodata = {"type": "FeatureCollection","features": []}
	rowid = 0
	for g in geo['features']:
	    for d in data_sort:
	        if d['isocode'] == g['properties']['ISO_A3']:
	        	rowid = rowid + 1
		    	data = {
		    		"type": "Feature", 
		    		"id": rowid, 
		    		"properties": {
		    			'isocode': d['isocode'],
		        		'emergency': d['emergency'],
		       			'supp_budget': d['supp_budget'],
		       			'fund_receive': "{:,}".format(abs(locale.atof(d['fund_receive']))),
		       			'fund_shortfall': "{:,}".format(abs(locale.atof(d['fund_shortfall']))),
		       			'budget': "{:,}".format(abs(locale.atof(d['supp_budget']))),
		       			'pct_funded': int(float(d['pct_funded'].rstrip("%	"))),
		       			'date': d['date']
		    		}, 
		    		"geometry": g['geometry']
		    		}
		        geodata['features'].append(data)

	data_writeout = json.dumps(geodata)
	f_out = open('data/geo/finances.geojson', 'wb')
	f_out.writelines(data_writeout)
	f_out.close()
except:
	print "Unexpected error: %s" % sys.argv[0]
