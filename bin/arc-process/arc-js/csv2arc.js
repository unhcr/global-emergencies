/*
Adapted from springmeyer's csv2arc.js
https://github.com/springmeyer/arc.js/blob/master/example/csv2arc.js
*/

// Files
var connFile = '../data/process-data/relief-arc-intermediate.csv',
    countryFile = '../data/geo/country-coords.csv',
    outFile = '../data/geo/unhcr-relief-items-arcs.geojson';

// Modules
var arc = require('./arc.js'),
    fs = require('fs'),
    path = require('path'),
    csv = require('csv');

// Data
var countries = {},
    features = [],
    geojson = { 'type': 'FeatureCollection',
                'features': features
              };

// Import countries, then work off connections.
csv()
.fromPath(countryFile, {trim: true, columns: true})
.on('data', function(data) {
    countries[data.iso] = {
        lon: parseFloat(data.lon),
        lat: parseFloat(data.lat)
    };
})
.on('end', function() {
    csv()
    .fromPath(connFile, {trim: true, columns: true})
    .on('data', function(data) {
        data.total = parseFloat(data.total)
        // Form a great circle object, create line, push into feature object.
        var start = new arc.Coord(
            countries[data['iso_start']].lon,
            countries[data['iso_start']].lat
        );
        var end = new arc.Coord(
            countries[data['iso_end']].lon,
            countries[data['iso_end']].lat
        );
        var gc = new arc.GreatCircle(start, end, data);
        features.push(gc.Arc(50).json());
    })
    .on('end', function() {
        fs.writeFileSync(outFile, JSON.stringify(geojson));
    });
});
