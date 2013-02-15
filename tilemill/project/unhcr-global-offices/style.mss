@green: rgb(92,151,0);

@unhcr: rgb(75,143,208);

@blue1: rgb(0,170,212);
@blue2: rgb(43,105,144);
@blue3: rgb(61,150,206);

@red1: rgb(255,42,42);
@red2: rgb(159,28,20);
@red3: rgb(229,38,26);


#offices {
[TYPE = "HQ"]{
  marker-width:2;
  marker-fill:@green;
  marker-line-color:@green;
  marker-allow-overlap:true;
  marker-opacity: 0.9;
  [zoom >= 0][zoom <=2]{marker-width:0.5;}
  [zoom >=6][zoom <= 8]{marker-width:4;}
  [zoom > 8]{marker-width:15;}
}
[TYPE = "RO"]{
  marker-width:2;
  marker-fill:@green;
  marker-line-color:@green;
  marker-allow-overlap:true;
  marker-opacity: 0.9;
  [zoom >= 0][zoom <=2]{marker-width:0.5;}
  [zoom >=6][zoom <= 8]{marker-width:4;}
  [zoom > 8]{marker-width:15;}
}
[TYPE = "GO"]{
  marker-width:2;
  marker-fill:@green;
  marker-line-color:@green;
  marker-allow-overlap:true;
  marker-opacity: 0.9;
  [zoom >= 0][zoom <=2]{marker-width:0.5;}
  [zoom >=6][zoom <= 8]{marker-width:4;}
  [zoom > 8]{marker-width:15;}    
}
[TYPE = "HO"]{
  marker-width:2;
  marker-fill:@green;
  marker-line-color:@green;
  marker-allow-overlap:true;
  marker-opacity: 0.9;
  [zoom >= 0][zoom <=2]{marker-width:0.5;}
  [zoom >=6][zoom <= 8]{marker-width:4;}
  [zoom > 8]{marker-width:15;}    
}
[TYPE = "BO"]{
  marker-width:2;
  marker-fill:@green;
  marker-line-color:@green;
  marker-allow-overlap:true;
  marker-opacity: 0.9;
  [zoom >= 0][zoom <=2]{marker-width:0.5;}
  [zoom >=6][zoom <= 8]{marker-width:4;}
  [zoom > 8]{marker-width:15;}    
}
[TYPE = "CO"]{
  marker-width:2;
  marker-fill:@green;
  marker-line-color:@green;
  marker-allow-overlap:true;
  marker-opacity: 0.9;
  [zoom >= 0][zoom <=2]{marker-width:0.5;}
  [zoom >=6][zoom <= 8]{marker-width:4;}
  [zoom > 8]{marker-width:15;}    
}
[TYPE = "LO"]{
  marker-width:2;
  marker-fill:@green;
  marker-line-color:@green;
  marker-allow-overlap:true;
  marker-opacity: 0.9;
  [zoom >= 0][zoom <=2]{marker-width:0.5;}
  [zoom >=6][zoom <= 8]{marker-width:4;}
  [zoom > 8]{marker-width:15;}    
}
[TYPE = "SO"]{
  marker-width:2;
  marker-fill:@green;
  marker-line-color:@green;
  marker-allow-overlap:true;
  marker-opacity: 0.9;
  [zoom >= 0][zoom <=2]{marker-width:0.5;}
  [zoom >=6][zoom <= 8]{marker-width:4;}
  [zoom > 8]{marker-width:15;}    
}
[TYPE = "FO"]{
  marker-width:2;
  marker-fill:@green;
  marker-line-color:@green;
  marker-allow-overlap:true;
  marker-opacity: 0.9;
  [zoom >= 0][zoom <=2]{marker-width:0.5;}
  [zoom >=6][zoom <= 8]{marker-width:4;}
  [zoom > 8]{marker-width:15;}    
}
[TYPE = "TO"]{
  marker-width:2;
  marker-fill:@green;
  marker-line-color:@green;
  marker-allow-overlap:true;
  marker-opacity: 0.9;
  [zoom >= 0][zoom <=2]{marker-width:0.5;}
  [zoom >=6][zoom <= 8]{marker-width:4;}
  [zoom > 8]{marker-width:15;}    
}
[TYPE = "FU"]{
  marker-width:2;
  marker-fill:@green;
  marker-line-color:@green;
  marker-allow-overlap:true;
  marker-opacity: 0.9;
  [zoom >= 0][zoom <=2]{marker-width:0.5;}
  [zoom >=6][zoom <= 8]{marker-width:4;}
  [zoom > 8]{marker-width:15;}    
}
}