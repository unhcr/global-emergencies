@unhcr: rgb(75,143,208);
@red: #ff2a2a;
@green: rgb(92,151,0);
@blue1: rgb(0,170,212);
@blue2: rgb(43,105,144);
@blue3: rgb(61,150,206);
@red1: rgb(255,42,42);
@red2: rgb(159,28,20);
@red3: rgb(229,38,26);

#relief {
  line-width:1;
  line-color:darken(@blue3,20);
  [total > 0][total <= 30000]{line-width:1;}
  [total > 30000][total <= 40000]{line-width:1.5;}
  [total > 40000][total <= 60000]{line-width:2;}
  [total > 60000][total <= 80000]{line-width:2.5;}
  [total > 100000]{line-width:3;}   
  line-clip:false;
}

#items {
  marker-fill:@blue3;
  marker-line-color:lighten(@blue3,10);
  marker-line-width: 1.5;
  marker-opacity:0.8;
  marker-line-opacity:0.8;
  marker-allow-overlap:true;
  [zoom >= 0][zoom < 3]{
      [total >= 0][total <= 30000]{marker-width:8;}
      [total > 30000][total <= 40000]{marker-width:10;}
      [total > 40000][total <= 60000]{marker-width:15;}
      [total > 60000][total <= 80000]{marker-width:22;}
      [total > 100000]{marker-width:30;}   
      ::icon {
      marker-allow-overlap:true;
      marker-file: url(../../../img/warehouse.png);
      [total > 0][total <= 30000]{marker-transform:scale(0.2,0.2);}
      [total > 30000][total <= 40000]{marker-transform:scale(0.25,0.25);}
      [total > 40000][total <= 60000]{marker-transform:scale(0.3,0.3);}
      [total > 60000][total <= 80000]{marker-transform:scale(0.4,0.4);}
      [total > 100000]{marker-transform:scale(0.5,0.5);}
      }
  	}
  [zoom = 3]{
      [total >= 0][total <= 30000]{marker-width:15;}
      [total > 30000][total <= 40000]{marker-width:20;}
      [total > 40000][total <= 60000]{marker-width:25;}
      [total > 60000][total <= 80000]{marker-width:30;}
      [total > 100000]{marker-width:40;}   
      ::icon {
      marker-allow-overlap:true;
      marker-file: url(../../../img/warehouse.png);
      [total > 0][total <= 30000]{marker-transform:scale(0.25,0.25);}
      [total > 30000][total <= 40000]{marker-transform:scale(0.4,0.4);}
      [total > 40000][total <= 60000]{marker-transform:scale(0.5,0.5);}
      [total > 60000][total <= 80000]{marker-transform:scale(0.55,0.55);}
      [total > 100000]{marker-transform:scale(0.75,0.75);}
      }
 	}
  [zoom > 3]{
      [total > 0][total <= 30000]{marker-width:15;}
      [total > 30000][total <= 40000]{marker-width:25;}
      [total > 40000][total <= 60000]{marker-width:30;}
      [total > 60000][total <= 80000]{marker-width:40;}
      [total > 100000]{marker-width:60;}
      ::icon {
      marker-allow-overlap:true;
      marker-file: url(../../../img/warehouse.png);
      [total > 0][total <= 30000]{marker-transform:scale(0.25,0.25);}
      [total > 30000][total <= 40000]{marker-transform:scale(0.4,0.4);}
      [total > 40000][total <= 60000]{marker-transform:scale(0.5,0.5);}
      [total > 60000][total <= 80000]{marker-transform:scale(0.7,0.7);}
      [total > 100000]{marker-transform:scale(1,1);}
      }
  }
}








