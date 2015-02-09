int circleSize = 2;
int hue = 0;
int sat = 100;
OPC opc;
int numberPanels = 15;

void setup() {
  size(150, 48);
  background(0);
  //smooth();
  colorMode(HSB, 100);
  opc = new OPC(this, "127.0.0.1", 7890);
  opc.dispose();
  opc.connect();
  int spacingX = width/(30*5);
  int spacingY = height/(16*3);
  for (int i = 0; i<numberPanels*8; i++) {
    opc.ledGrid(i * 60, 30, 2, ((i/8)%5*30+14)*spacingX, (((i%8)*2)*spacingY)+((i/8)/5)*(spacingY*15+1), spacingX, spacingY, 0, true);
  }
}

void draw() {
  background(0);
  fill(hue, sat, 100);
  ellipse (1, 1, 2, 2);
}

void mouseDragged() {
  fill(hue, sat, 100);
  noStroke();
  ellipse(mouseX, mouseY, circleSize, circleSize);
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  println(e);
  if (e<0) sat++;
  if (sat>100) sat = 100;
  if (e>0) sat--;
  if (sat<0) sat = 0;
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      circleSize ++;
    } else if (keyCode == DOWN) {
      circleSize --;
    } else if (keyCode == LEFT) {
      hue --;
      if (hue<0) hue=100;
    } else if (keyCode == RIGHT) {
      hue ++;
      if (hue>100) hue=0;
    }
  }

  if (key == DELETE) {
    background(0);
  }
}

