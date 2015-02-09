OPC opc;
//int numberStripsPerPanel = 16;
//int numberLEDsPerStrip = 30;
int numberPanels = 10;




/*
  -------------------------------------------------------- 
 |     1    |     3    |     5    |     7    |     9    | )
 -------------------------------------------------------- } server 1 opc1
 |     2    |     4    |     6    |     8    |    10    | )
 --------------------------------------------------------
 |    11    |    13    |    15    |    17    |    19    | )
 -------------------------------------------------------- } server 2 opc2
 |    12    |    14    |    16    |    18    |    20    | )
 --------------------------------------------------------
 
 */


void setup() {

  size(150, 64,P3D);
  frameRate(30);
  noStroke();
  //smooth();

  opc = new OPC(this, "192.168.0.36", 7890);
  int spacingX = width/(30*5);
  int spacingY = height/(32*2);
  for (int i = 0; i<numberPanels*8; i++) {
    opc.ledGrid(i * 60, 30, 2, ((i/16)*30+15)*spacingX, ((i%16)*2+1)*spacingY, spacingX, spacingY, 0, true);
  }
}

void draw() {
  background(0,0,0);
  identifyPanels();
}

void identifyPanels() {

  textAlign(CENTER, CENTER);
  fill(0, 255, 0);
  for (int i = 0; i<10; i++) {
    if (i%2 == 0) {
      text(i+1, (i/2)*(width/5)+((width/5)/2), height/8);
    } else {
      text(i+1, (i/2)*(width/5)+((width/5)/2), 3*(height/8));
    }
  }
  
  for (int i = 10; i<20; i++) {
    if (i%2 == 0) {
      text(i+1, ((i-10)/2)*(width/5)+((width/5)/2), 5*(height/8));
    } else {
      text(i+1, ((i-10)/2)*(width/5)+((width/5)/2), 7*(height/8));
    }
  }
}

