@unhcr: rgb(75,143,208);

@blue1: rgb(0,170,212);
@blue2: rgb(43,105,144);
@blue3: rgb(61,150,206);

@red1: rgb(255,42,42);
@red2: rgb(159,28,20);
@red3: rgb(229,38,26);



#refugee-dots {
  marker-fill:@red3;
  marker-line-color:lighten(@red3,20);
  marker-line-width: 1.5;
  marker-opacity:0.8;
  marker-line-opacity:0.9;
  marker-allow-overlap:true;
  [zoom <= 2]{
  [refugee_pop = 0]{marker-opacity:0;text-opacity:0;}
  [refugee_pop > 0][refugee_pop <= 100000]{marker-width:25;}
  [refugee_pop > 100000][refugee_pop <= 350000]{marker-width:35;}
  [refugee_pop > 350000][refugee_pop <= 500000]{marker-width:45;}
  [refugee_pop > 500000][refugee_pop <= 1000000]{marker-width:55;}
  [refugee_pop > 1000000]{marker-width:65;}
  text-size: 10;    
  }
  [zoom = 3]{
  [refugee_pop = 0]{marker-opacity:0;text-opacity:0;}   
  [refugee_pop > 0][refugee_pop <= 100000]{marker-width:35;}
  [refugee_pop > 100000][refugee_pop <= 350000]{marker-width:45;}
  [refugee_pop > 350000][refugee_pop <= 500000]{marker-width:55;}
  [refugee_pop > 500000][refugee_pop <= 1000000]{marker-width:65;}
  [refugee_pop > 1000000]{marker-width:75;}    
  }
  [zoom > 3]{
  [refugee_pop = 0]{marker-opacity:0;text-opacity:0;} 
  [refugee_pop > 0][refugee_pop <= 100000]{marker-width:45;}
  [refugee_pop > 100000][refugee_pop <= 350000]{marker-width:55;}
  [refugee_pop > 350000][refugee_pop <= 500000]{marker-width:65;}
  [refugee_pop > 500000][refugee_pop <= 1000000]{marker-width:75;}
  [refugee_pop > 1000000]{marker-width:95;}    
  }
  text-name: [refugee_pop_short] + "k";
  text-face-name: "Verdana Regular";
  text-allow-overlap:true;
  text-fill: #fff;
  text-size:15;
}

