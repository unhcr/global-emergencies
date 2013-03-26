@unhcr: rgb(75,143,208);

@blue1: rgb(0,170,212);
@blue2: rgb(43,105,144);
@blue3: rgb(61,150,206);

@red1: rgb(255,42,42);
@red2: rgb(159,28,20);
@red3: rgb(229,38,26);

#emergencies {
  marker-width:30;
  marker-fill:#f45;
  marker-line-color:#813;
  marker-allow-overlap:true;
  marker-file:url(../../../img/emergency100.png);
  [zoom > 0][zoom < 3]{marker-transform:scale(1,1);}
  [zoom >= 3][zoom < 4]{marker-transform:scale(1.5,1.5);}
  [zoom >= 4][zoom < 5]{marker-transform:scale(2,2);}
  [zoom >= 5][zoom < 6]{marker-transform:scale(2.5,2.5);}
}

