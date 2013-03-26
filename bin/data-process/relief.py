import sys, csv, locale, os, traceback
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

    geo_file = open('data/process-data/world-centroids.geojson', "rb").read()
    geo = json.loads(geo_file)

    country_data = []
    relief_data = []
    for r,relief in groupby(data_sort, lambda x: x['isocode']):
        relief_data = []
        relief_items = {}
        items = []
        amounts = []
        date = []
        country = []
        ctry_from = []
        since = []
        for re in relief: 
            country.append(re['country'])
            ctry_from.append(re['from'])
            items.append(re['items'])
            amounts.append(int(re['total']))
            date.append(re['date'])
            since.append(re['distr_since'])
        relief_data.append(ctry_from.pop())
        relief_data.append(r)
        relief_data.append(sum(amounts))
        relief_items = dict(zip(items, amounts))
        relief_data.append(relief_items)
        relief_data.append(date.pop())
        relief_data.append(items)
        relief_data.append(country.pop())
        relief_data.append(since.pop())
        country_data.append(relief_data)

    geodata = {"type": "FeatureCollection","features": []}
    rowid = 0
    for g in geo['features']:
        for c in country_data:
            if g['properties']['iso'] == c[1]:
                rowid = rowid + 1
                itemKeys = c[3].keys()
                data = {
                    "type": "Feature", 
                    "id": rowid, 
                    "properties": {
                        'isocode': c[1],
                        'total': c[2],
                        'total_str': '{:,}'.format(c[2]),
                        'blankets': "",
                        'mosquitoNets': "",
                        'sleepingMats': "",
                        'jerryCans': "",
                        'kitchenSets': "",
                        'tents': "",
                        'date': c[4],
                        'country': c[6],
                        'dist_since': c[7]
                    }, 
                "geometry": g['geometry']
                }
                if "Blankets" in itemKeys:
                    data['properties']['blankets'] = "%s" % '{:,}'.format(c[3]['Blankets'])
                else:
                    data['properties']['blankets'] = "--"
                if "Mosquito nets" in itemKeys:
                    data['properties']['mosquitoNets'] = "%s" % '{:,}'.format(c[3]['Mosquito nets'])
                else:
                    data['properties']['mosquitoNets'] = "--"
                if "Sleeping mats" in itemKeys:
                    data['properties']['sleepingMats'] = "%s" % '{:,}'.format(c[3]['Sleeping mats'])
                else:
                    data['properties']['sleepingMats'] = "--"
                if "Jerry cans" in itemKeys:
                    data['properties']['jerryCans'] = "%s" % '{:,}'.format(c[3]['Jerry cans'])
                else:
                    data['properties']['jerryCans'] = "--"
                if "Kitchen sets" in itemKeys:
                    data['properties']['kitchenSets'] = "%s" % '{:,}'.format(c[3]['Kitchen sets'])
                else:
                    data['properties']['kitchenSets'] = "--"
                if "Tents (Family)" in itemKeys:
                    data['properties']['tents'] = "%s" % '{:,}'.format(c[3]['Tents (Family)'])
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
        writer.writerow(row[0:3])
    out.close()

    geodata = {"type": "FeatureCollection","features": []}
    rowid = 0
    for g in geo['features']:
        for c in country_data:
            if g['properties']['iso'] == c[0]:
                rowid = rowid + 1
                data = {
                    "type": "Feature", 
                    "id": rowid, 
                    "properties": {
                        'isocode': c[0],
                        'total': c[2],
                        'country': g['properties']['name']
                    },
                "geometry": g['geometry']
                }
                geodata['features'].append(data)

    data_writeout = json.dumps(geodata)
    f_out = open('data/geo/relief-source.geojson', 'wb')
    f_out.writelines(data_writeout)
    f_out.close()                                                     


except StandardError, err:
    print "Unexpected error"
    traceback.print_exc(file=sys.stdout)
