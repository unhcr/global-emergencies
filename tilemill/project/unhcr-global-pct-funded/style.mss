@unhcr: rgb(75,143,208);

@blue1: rgb(0,170,212);
@blue2: rgb(43,105,144);
@blue3: rgb(61,150,206);

@red1: rgb(255,42,42);
@red2: #f7cfcd;
@red3: rgb(229,38,26);

#funded {
    [zoom > 3]{
  	marker-fill: @red2;
  	marker-line-color:@red3;
  	marker-line-width:2;
    marker-line-opacity:0.9;
  	marker-allow-overlap:true;
 	marker-width:100*1.5;
    marker-opacity: 0.2;
  	::outline {
      	marker-opacity:0.9;
        marker-fill: @red3;//lighten(@red3,15);
        marker-line-color:@red3;//lighten(@red3,15);
        marker-line-width:0.5;
        marker-allow-overlap:true;
    	marker-width:[pct_funded]*1.5;
      	text-name: [pct_funded] + "%";
    	text-face-name: "Verdana Regular";
		text-allow-overlap:true;
    	text-fill: #dfdada;
	    text-size:15;
  	}
    }
    [zoom = 3]{
  	marker-fill: @red2;
  	marker-line-color:@red3;
  	marker-line-width:2;
    marker-line-opacity:0.9;
  	marker-allow-overlap:true;
 	marker-width:100;
    marker-opacity: 0.2;
  	::outline {
      	marker-opacity:0.9;
        marker-fill: @red3;//lighten(@red3,15);
        marker-line-color:@red3;//lighten(@red3,15);
        marker-line-width:0.5;
        marker-allow-overlap:true;
    	marker-width:[pct_funded];
      	text-name: [pct_funded] + "%";
    	text-face-name: "Verdana Regular";
		text-allow-overlap:true;
    	text-fill: #dfdada;
	    text-size:15;
  	}
    }
    [zoom <= 2]{
  	marker-fill: @red2;
  	marker-line-color:@red3;
  	marker-line-width:2;
    marker-line-opacity:0.9;
  	marker-allow-overlap:true;
 	marker-width:100/1.5;
    marker-opacity: 0.2;
  	::outline {
      	marker-opacity:0.9;
        marker-fill: @red3;//lighten(@red3,15);
        marker-line-color:@red3;//lighten(@red3,15);
        marker-line-width:0.5;
        marker-allow-overlap:true;
    	marker-width:[pct_funded]/1.5;
      	text-name: [pct_funded] + "%";
    	text-face-name: "Verdana Regular";
		text-allow-overlap:true;
    	text-fill: #dfdada;
	    text-size:10;
  	}
    }
  	
}







