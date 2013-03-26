@unhcr: rgb(75,143,208);
@green: rgb(92,151,0);

@blue1: rgb(0,170,212);
@blue2: rgb(43,105,144);
@blue3: rgb(61,150,206);

@red1: rgb(255,42,42);
@red2: rgb(159,28,20);
@red3: rgb(229,38,26);

#staff {
  marker-line-color:lighten(@blue3,10);
  line-width:0.5;
  marker-fill:@blue3;
  marker-opacity: 0.8;
  marker-width:50;
  marker-allow-overlap:true;
  text-name: [num_staff];
  text-face-name: "Verdana Regular";
  text-allow-overlap:true;
  text-fill: #fff;
  text-size:15;
  [zoom > 3]{
  [num_staff > 0][num_staff < 50]{marker-width:20;text-size:10;}
  [num_staff > 50][num_staff < 100]{marker-width:40;}
  [num_staff > 100][num_staff < 200]{marker-width:50;}
  [num_staff > 200]{marker-width:70;text-size:20;}
  }
  [zoom = 3]{
  [num_staff > 0][num_staff < 50]{marker-width:20;text-size:10;}
  [num_staff > 50][num_staff < 100]{marker-width:35;}
  [num_staff > 100][num_staff < 200]{marker-width:40;}
  [num_staff > 200]{marker-width:60;text-size:20;}
  }
  [zoom <= 2]{
  [num_staff > 0][num_staff < 50]{marker-width:14;text-size:7;}
  [num_staff > 50][num_staff < 100]{marker-width:20;text-size:10}
  [num_staff > 100][num_staff < 200]{marker-width:25;text-size:12}
  [num_staff > 200]{marker-width:40;text-size:15;}
  }
}











