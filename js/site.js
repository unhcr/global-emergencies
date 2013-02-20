 /* Function waits til page loads to run */ 
$(function() {
 
 
 /* Asssign all map tiles to variables, coming from the UNHCR MapBox account */ 
    var base = 'unhcr.map-y08nvydq',
        layers = [
            'unhcr.unhcr-global-emergency-countries,unhcr.unhcr-global-emergencies',
            'unhcr.unhcr-global-emergency-countries,unhcr.unhcr-global-refugees',
            'unhcr.unhcr-global-emergency-countries,unhcr.unhcr-global-offices,unhcr.unhcr-global-relief,unhcr.unhcr-global-relief-source',
            'unhcr.unhcr-global-emergency-countries,unhcr.unhcr-global-offices,unhcr.unhcr-global-staff',
            'unhcr.unhcr-global-emergency-countries,unhcr.unhcr-global-pct-funded',
            'unhcr.unhcr-global-emergency-countries,unhcr.unhcr-global-infoportals'
        ],
        curLayer,
        embed = false;
        
    if (window.location.hash.split('?')[1] === 'embed') {
        embed = true;
        $('body').addClass('embed');
    }
/* Gets the JSON which has unhcr-portals data, then appends each feature to the map */ 
    $.getJSON('data/site-data/unhcr-portals.geojson', function(data) {
        $.each(data.features, function(i,d) {
            if (d.properties.url) {
                $('#sitnav ul').append(
                    '<li><a href="' + d.properties.url + '">' + d.properties.emergency + '</a></li>'
                );
            }
        });
        $('#sitnav').css('top',-$('#sitnav').height() + 54);
    });
    
    $('#sit, #sitnav').hover(
        function() {
            $('#sitnav').css('top','54px');
        },
        function() {
            $('#sitnav').css('top',-$('#sitnav').height() + 54);
        }
    );
    
    /* Function which loads the map */      

    mapbox.load(layers, function(layer) {

    /* Creates the map variable to which all actions are then appended with "m" */ 
        var m = mapbox.map('map');

        /* Add map layers defined above */  
        m.addLayer(mapbox.layer().id(base));
        (embed) ? m.zoom(3) : m.zoom(3);
        /* Set the location and zoom level for the map to laod on, and limit zoom range */  
        m.center({ lat: 19, lon: 5 }).setZoomRange(2,10);
        /* Add zoom buttons and attribution */  
        m.ui.zoomer.add();
        m.ui.attribution.add()
            .content('<a href="http://mapbox.com/about/maps">Terms &amp; Feedback</a>');
        
        $.each(layer, function(i,l) {
            m.addLayer(l.layer.composite(true));
            if (i > 0) {
                m.disableLayerAt(i+1);
            } else {
                curLayer = m.getLayerAt(i+1);
            }
        });
    /* Turn on auto interaction with mapbox.js */      
        m.interaction.auto();

    /* This function updates the map layers depending on the several navigation elements
    within the map */   
        function updateMap(ids) {
            var id = (ids.length > 1) ? ids.split(' ')[0] : ids;
            curLayer.disable();
            m.enableLayerAt(id);
            curLayer = m.getLayerAt(id);
            m.interaction.refresh();
            
            $('#story > div').hide();
            $('#story #s' + id).fadeIn();
            
            $('#sections a').removeClass('active');
            $('#sections a[data-value~="' + id + '"]').addClass('active');
            
            $('.story-nav.story-right').attr('data-value',parseInt(id)+1);
            $('.story-nav.story-left').attr('data-value',id-1);
            (id === '1') ? $('.story-nav.story-left').removeClass('active') : $('.story-nav.story-left').addClass('active');
            (id == layers.length) ? $('.story-nav.story-right').removeClass('active') : $('.story-nav.story-right').addClass('active');
            
            $('#bullets li').removeClass('active');
            $('#bullets li[data-value="' + id + '"]').addClass('active');
        }
        
        $('#story #s1').fadeIn();

    /* Enables navigation through arrows to left and right */       
        $('.story-nav').click(function(e) {
            if ($(this).hasClass('active')) {
                updateMap($(this).attr('data-value'));
            }
        });

    /* Enables navigation through small bullets below text */   
        $('#bullets li').click(function(e) {
            if (!$(this).hasClass('active')) {
                updateMap($(this).attr('data-value'));
            }
        });
    
    /* Enables navigation through the top three sections  */  
        $('#sections a').click(function(e) {
            e.preventDefault();
            if (!$(this).hasClass('active')) {
                var layer = $(this).attr('data-value').split('-')[0];
                updateMap($(this).attr('data-value'));
            }
        });
            
    /* Enables changing pages with arrow keys */
        $(document).keydown(function(e) {
            if (e.keyCode == 37) return $('.story-nav.story-left').click(); // cursor left
            if (e.keyCode == 39) return $('.story-nav.story-right').click(); // cursor right
            if (e.keyCode == 27) return updateMap(1); // esc
        });
    });
    
/* Sets up tooltips */
    $('#map').mousemove(function(e) {
        $('.wax-tooltip').each(function() {
            $(this).css('display', 'block');
            if (!$(this).hasClass('arrowtrue')) {
                $(this).append('<div class="arrow"></div>');
                $(this).addClass('arrowtrue');
            }
            if (($(this).width()/4) < (screen.width - e.pageX)) {
                if ($(this).hasClass('flip')) { $(this).removeClass('flip'); }
                $(this).css({
                    top: e.pageY - ($(this).height() + 80),
                    left: e.pageX - ($(this).width()/2) - 10
                });
                if ($('body').hasClass('embed')) {
                    $(this).css({
                        top: e.pageY - ($(this).height() + 80) + 50,
                        left: e.pageX - ($(this).width()/2) - 10
                    });                    
                }
            } else {
                $(this).addClass('flip').css({
                    top: e.pageY - ($(this).height() + 80),
                    left: e.pageX - (($(this).width()/2) - 60)
                });
            }
        });
    });

/* This line adds the share button to the map in the upper right */
    
    mapbox.share().map('map').add();
});