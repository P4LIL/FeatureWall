float diag=70, l, theta;
int sides=15, frames=300;
OPC opc;
int numberPanels = 15;
 
void setup() {
  size(150*2, 48*2);
  colorMode(HSB, 360, 100, 100);
  stroke(#eeeeee);
  noStroke();
  opc = new OPC(this, "127.0.0.1", 7890);
  //opc.dispose();
  //opc.connect();
  int spacingX = width/(30*5);
  int spacingY = height/(16*3);
  for (int i = 0; i<numberPanels*8; i++) {
    opc.ledGrid(i * 60, 30, 2, ((i/8)%5*30+15)*spacingX, (((i%8)*2)*spacingY)+((i/8)/5)*(spacingY*15+2), spacingX, spacingY, 0, true);
  }
}
 
void draw() {
  background(20);
  translate(width/2, height/2);
  for (int i=0; i<sides; i++) {
    fill(360.0/sides*i, 90, 100, 150);
    pushMatrix();
    rotate(TWO_PI/sides*i);
    l = map(sin(theta), -1, 1, 0, 200);
    translate(l, 0);
    pushMatrix();
    float r = map(sin(theta), -1, 1, -PI/2, PI);
    rotate(r);
    float x1 = 0;
    float y1 = 0;
    float x2 = diag/2;
    float y2 = -diag/2;
    float x3 = diag;
    float y3 = 0 ;
    float x4 = diag/2;
    float y4 = diag/2;
    quad(x1, y1, x2, y2, x3, y3, x4, y4);
    popMatrix();
    popMatrix();
  }
  theta += TWO_PI/frames;
  //if (frameCount<=frames) saveFrame("image-###.png");
}

