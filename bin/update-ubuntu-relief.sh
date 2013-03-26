#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Generate site and map data files

python $DIR/data-process/relief.py

# Generate GeoJSON file with great circle arcs
$DIR/arc-process/arcs.sh

# Render and Upload Maps 
# For Ubuntu: /usr/share/tilemill/
node /usr/share/tilemill/index.js export unhcr-global-relief unhcr-global-relief.mbtiles --format=sync --config=$DIR/../tilemill/global-emergencies-config.json
