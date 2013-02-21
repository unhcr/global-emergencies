import sys, csv, locale, os, traceback
import simplejson as json
from itertools import groupby
locale.setlocale(locale.LC_ALL, '')
# -----------------------
# Process Staff Numbers
# -----------------------

#"country","isocode","emergency","num_staff","emergency_deployments","url_unhcr_inperson"
try: 
	os.chdir("../")
	data_file = csv.DictReader(open('data/update-data/unhcr-staff.csv', 'rb'), delimiter= ',', quotechar = '"')
	data_sort = sorted(data_file, key=lambda x: x['num_staff'])

	geo_file = open('data/process-data/world-centroids.geojson', "rb").read()
	geo = json.loads(geo_file)

	geodata = {"type": "FeatureCollection","features": []}
	rowid = 0
	for g in geo['features']:
	    for d in data_sort:
	        if d['isocode'] == g['properties']['iso']:
	        	rowid = rowid + 1
		    	data = {
		    		"type": "Feature", 
		    		"id": rowid, 
		    		"properties": {
		    			'isocode': d['isocode'],
		    			'country': d['country'],
		        		'emergency': d['emergency'],
		        		'num_staff': int(d['num_staff']),
		        		'emergency_deployments': int(d['emergency_deployments']),
		        		'url': d['url_unhcr_inperson']
		    		}, 
		    		"geometry": g['geometry']
		    		}
		        geodata['features'].append(data)

	data_writeout = json.dumps(geodata)
	f_out = open('data/geo/staff.geojson', 'wb')
	f_out.writelines(data_writeout)
	f_out.close()
except StandardError, err:
    print "Unexpected error"
    traceback.print_exc(file=sys.stdout)
