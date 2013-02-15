# UNHCR Global Emergencies site

Global Emergencies is microsite designed by [Development Seed](http://developmentseed.org) visualizing global emergency data from UNHCR. Available at <http://unhcr.github.org/global-emergencies>. 

## System requirements

*For running the site locally and updating data.*

Use [Ruby Gem](http://rubygems.org/) to install:

- [Jekyll](http://jekyllrb.com/)
- [liquid](http://liquidmarkup.org/)
- [rdiscount](https://github.com/rtomayko/rdiscount/)

*For updating site and maps*

- [TileMill](http://mapbox.com/tilemill/)
- [node 0.6.x](http://nodejs.org/)
- [Python 2.7+](http://www.python.org/download/)
- [git](http://git-scm.com/)

## Check out site from repository

    # This will check out the site from the remote repository on
    # GitHub and place it in a local directory named unhcr-emergencies/
    git clone https://github.com/developmentseed/unhcr-emergencies.git
    # Your site should now be here:
    ls global-emergencies/

## Run site

    cd global-emergencies/
    jekyll

Point browser to `http://0.0.0.0:4000/global-emergencies`

## Update site

The site can be entirely updated from the command line. It is recommended
to review changes locally before pushing them live.

The update script has been written to process the data and then render and upload all maps automatically. Each part of the script can be run individually. 

```
cd global-emergencies/ 
cd bin/ 
./update.sh
```

### [See here for complete data update documentation](https://github.com/unhcr/global-emergencies/wiki/Data-Update-Documentation)



