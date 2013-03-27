import sys, csv, os, traceback
import simplejson as json
from itertools import groupby

# -----------------------
# Process Emergencies CSV file
# - creates emergency locations layer
# -----------------------
try: 
	os.chdir("../")
	data_file = csv.DictReader(open('data/update-data/unhcr-emergencies.csv', 'rb'), delimiter= ',', quotechar = '"')
	data_sort = sorted(data_file, key=lambda x: x['isocode'])

	geo_file = open('data/process-data/world-centroids.geojson', "rb").read()
	geo = json.loads(geo_file)

# isocode,emergency,level,declaration,deactivation,note,thumbnail,url

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
		        		'emergency': d['emergency'],
		        		'level': d['level'],
		        		'declaration': d['declaration'],
		        		'deactivation': d['deactivation'],
		        		'note': d['note'],
		        		'thumbnail': d['thumbnail'],
		        		'url': d['url']
		    		}, 
		    		"geometry": g['geometry']
		    		}
		        geodata['features'].append(data)

	data_writeout = json.dumps(geodata, sort_keys=True)
	f_out = open('data/geo/emergencies.geojson', 'wb')
	f_out.writelines(data_writeout)
	f_out.close()
except StandardError, err:
    print "Unexpected error"
    traceback.print_exc(file=sys.stdout)
