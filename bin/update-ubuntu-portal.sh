#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Generate site and map data files
# python $DIR/data-process/refugees.py
 python $DIR/data-process/emergency-countries.py
# python $DIR/data-process/finances.py
 python $DIR/data-process/portals.py
# python $DIR/data-process/relief.py
# python $DIR/data-process/staff.py

# Generate GeoJSON file with great circle arcs
# $DIR/arc-process/arcs.sh

# Render and Upload Maps 
# For Ubuntu: /usr/share/tilemill/
#node /usr/share/tilemill/index.js export unhcr-global-emergencies unhcr-global-emergencies.mbtiles --format=sync --config=$DIR/../tilemill/global-emergencies-config.json
#node /usr/share/tilemill/index.js export unhcr-global-emergency-countries unhcr-global-emergency-outlines.mbtiles --format=sync --config=$DIR/../tilemill/global-emergencies-config.json
node /usr/share/tilemill/index.js export unhcr-global-infoportals unhcr-global-infoportal.mbtiles --format=sync --config=$DIR/../tilemill/global-emergencies-config.json
# node /usr/share/tilemill/index.js export unhcr-global-offices unhcr-global-offices.mbtiles --format=sync --config=$DIR/../tilemill/global-emergencies-config.json
# node /usr/share/tilemill/index.js export unhcr-global-pct-funded unhcr-global-pct-funded.mbtiles --format=sync --config=$DIR/../tilemill/global-emergencies-config.json
# node /usr/share/tilemill/index.js export unhcr-global-refugees unhcr-global-refugees.mbtiles --format=sync --config=$DIR/../tilemill/global-emergencies-config.json
# node /usr/share/tilemill/index.js export unhcr-global-relief unhcr-global-relief.mbtiles --format=sync --config=$DIR/../tilemill/global-emergencies-config.json
# node /usr/share/tilemill/index.js export unhcr-global-staff unhcr-global-staff.mbtiles --format=sync --config=$DIR/../tilemill/global-emergencies-config.json
