OPC opc;
int numberPanels = 15;

int xSize =1;

void setup() {
  size(150, 48);
  noStroke();
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
  fill (255);
  rect(0, 0, width, xSize);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      xSize ++;
    } else if (keyCode == DOWN) {
      xSize --;
    }
  }
  if (xSize < 0 ) xSize = 0;
  if (xSize > height ) xSize = height;
  
}

