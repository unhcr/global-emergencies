import sys, csv, locale, os
import simplejson as json
from itertools import groupby
locale.setlocale(locale.LC_ALL, '')
# -----------------------
# Process Relief Items 
# -----------------------
# From CSV: "emergency","country","isocode","items","total","date","photo_url"

try:
    os.chdir("../")
    data_file = csv.DictReader(open('data/update-data/unhcr-relief-items.csv', 'rb'), delimiter= ',', quotechar = '"')
    data_sort = sorted(data_file, key=lambda x: x['isocode'])

    geo_file = open('data/process-data/world-full-centroids.geojson', "rb").read()
    geo = json.loads(geo_file)

    country_data = []
    relief_data = []
    for r,relief in groupby(data_sort, lambda x: x['isocode']):
        relief_data = [r]
        relief_items = {}
        items = []
        amounts = []
        date = []
        country = []
        for re in relief: 
            country.append(re['country'])
            items.append(re['items'])
            amounts.append(int(re['total']))
            date.append(re['date'])
        relief_data.append(sum(amounts))
        relief_items = dict(zip(items, amounts))
        relief_data.append(relief_items)
        relief_data.append(date.pop())
        relief_data.append(items)
        relief_data.append(country.pop())
        country_data.append(relief_data)

    geodata = {"type": "FeatureCollection","features": []}
    rowid = 0
    for g in geo['features']:
        for c in country_data:
            if g['properties']['ISO_A3'] == c[0]:
                rowid = rowid + 1
                itemKeys = c[2].keys()
                data = {
                    "type": "Feature", 
                    "id": rowid, 
                    "properties": {
                        'isocode': c[0],
                        'total': c[1],
                        'total_str': '{:,}'.format(c[1]),
                        'blankets': "",
                        'mosquitoNets': "",
                        'sleepingMats': "",
                        'jerryCans': "",
                        'kitchenSets': "",
                        'tents': "",
                        'date': c[3],
                        'country': c[5]
                    }, 
                "geometry": g['geometry']
                }
                if "Blankets" in itemKeys:
                    data['properties']['blankets'] = "%s" % '{:,}'.format(c[2]['Blankets'])
                else:
                    data['properties']['blankets'] = "--"
                if "Mosquito nets" in itemKeys:
                    data['properties']['mosquitoNets'] = "%s" % '{:,}'.format(c[2]['Mosquito nets'])
                else:
                    data['properties']['mosquitoNets'] = "--"
                if "Sleeping mats" in itemKeys:
                    data['properties']['sleepingMats'] = "%s" % '{:,}'.format(c[2]['Sleeping mats'])
                else:
                    data['properties']['sleepingMats'] = "--"
                if "Jerry cans" in itemKeys:
                    data['properties']['jerryCans'] = "%s" % '{:,}'.format(c[2]['Jerry cans'])
                else:
                    data['properties']['jerryCans'] = "--"
                if "Kitchen sets" in itemKeys:
                    data['properties']['kitchenSets'] = "%s" % '{:,}'.format(c[2]['Kitchen sets'])
                else:
                    data['properties']['kitchenSets'] = "--"
                if "Tents (Family)" in itemKeys:
                    data['properties']['tents'] = "%s" % '{:,}'.format(c[2]['Tents (Family)'])
                else: 
                    data['properties']['tents'] = "--"
                geodata['features'].append(data)

    # Write out geojson for TileMill
    data_writeout = json.dumps(geodata)
    f_out = open('data/geo/relief-items.geojson', 'wb')
    f_out.writelines(data_writeout)
    f_out.close()


    # Write out CSV for processing arcs 
    header = ['iso_start', 'iso_end', 'total']
    out = open('data/process-data/relief-arc-intermediate.csv', 'wb')
    writer = csv.writer(out)
    writer.writerow(header)
    for row in country_data:
        row.insert(0,"AUT")
        writer.writerow(row[0:3])
    out.close()
except:
    print "Unexpected error: %s" % sys.argv[0]
