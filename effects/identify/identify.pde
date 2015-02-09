OPC opc;
int numberPanels = 15;

/*
 -------------------------------------------------------- 
 |     1    |     2    |     3    |     4    |     5    | )
 -------------------------------------------------------- } server 1 opc1
 |     6    |     7    |     8    |     9    |    10    | )
 --------------------------------------------------------
 |    11    |    12    |    13    |    14    |    15    | )
 --------------------------------------------------------  

 */


void setup() {

  size(150, 48);
  frameRate(30);
  noStroke();
  smooth();

  opc = new OPC(this, "127.0.0.1", 7890);
  int spacingX = width/(30*5);
  int spacingY = height/(16*3);
  for (int i = 0; i<numberPanels*8; i++) {
    // void ledGrid(int index, int stripLength, int numStrips, float x, float y,float ledSpacing, float stripSpacing, float angle, boolean zigzag)
    opc.ledGrid(i * 60, 30, 2, ((i/8)%5*30+14)*spacingX, (((i%8)*2)*spacingY)+((i/8)/5)*(spacingY*15+1), spacingX, spacingY, 0, true);
  //  println(i/8," x=",((i/8)%5*30+15)*spacingX," y=",(((i%8)*2+1)*spacingY)+((i/8)/5)*(spacingY*15+1));
  }
}

void draw() {
  background(30, 0,0);
  identifyPanels();
}

void identifyPanels() {

  textAlign(CENTER, CENTER);
  fill(0, 255, 0);
  for (int i = 0; i<5; i++) {
    text(i+1, (i)*(width/5)+((width/5)/2), height/6);
  }
  for (int i = 5; i<10; i++) {
    text(i+1, (i-5)*(width/5)+((width/5)/2), 3*height/6);
  }
  for (int i = 10; i<15; i++) {
    text(i+1, (i-10)*(width/5)+((width/5)/2), 5*height/6);
  }
}

