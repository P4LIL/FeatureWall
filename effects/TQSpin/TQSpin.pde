PImage img;

float angle = 0;
OPC opc;
int numberPanels = 15;

void setup() {
  size(150, 48, P3D); 
  img = loadImage("techniquest.png");
  img.resize(width, 0);
  opc = new OPC(this, "127.0.0.1", 7890);
//opc.dispose();
 // opc.connect();
  int spacingX = width/(30*5);
  int spacingY = height/(16*3);
  for (int i = 0; i<numberPanels*8; i++) {
    opc.ledGrid(i * 60, 30, 2, ((i/8)%5*30+14)*spacingX, (((i%8)*2)*spacingY)+((i/8)/5)*(spacingY*15+1), spacingX, spacingY, 0, true);
  }
}

void draw() {
  background(0);
  pushMatrix();
  translate(width/2, 0);
  rotateY(angle);
  imageMode(CENTER);
  image(img,0, height/2);
  angle = angle+0.02;
  if (angle ==PI/4) angle = 0.0;
  popMatrix();
}

