// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Mover object
OPC opc;
int numberPanels = 15;
Bob[] bobs = new Bob[11];

Spring[] springs = new Spring[10];

PImage[] images = new PImage[11];


void setup() {
  size(150, 48);
  opc = new OPC(this, "127.0.0.1", 7890);
opc.dispose();
  opc.connect();
  int spacingX = width/(30*5);
  int spacingY = height/(16*3);
  for (int i = 0; i<numberPanels*8; i++) {
    opc.ledGrid(i * 60, 30, 2, ((i/8)%5*30+14)*spacingX, (((i%8)*2)*spacingY)+((i/8)/5)*(spacingY*15+1), spacingX, spacingY, 0, true);
  }
  // Create objects at starting location
  // Note third argument in Spring constructor is "rest length"
  for (int i = 0; i < bobs.length; i++) {
    boolean fix = false;
    if (i==0 || i==10)  fix = true;
    bobs[i] = new Bob(i*(width/11)+width/12, height/2+3, fix,i);
  }
  for (int i = 0; i < springs.length; i++) {
    springs[i] = new Spring(bobs[i], bobs[i+1], width/12);
  }
  // load images
  for ( int i = 0; i< images.length; i++ )
  {
    images[i] = loadImage( i + ".png" );   // make sure images "0.jpg" to "11.jpg" exist
    images[i].resize(0, 20);
  }
  
}

void draw() {
  background(0); 

  for (Spring s : springs) {
    s.update();
    //s.display();
  }

  for (Bob b : bobs) {
    b.update();
    b.display();
    //b.drag(mouseX, mouseY);
    b.drag(int(b.location.x+random(-10, 10)), int(b.location.y+random(-10, 10)));
  }

  if (frameCount%60 == 0) {
    int bobtoMove = int(random(1, 9));
    bobs[bobtoMove].location.x = int(bobs[bobtoMove].location.x+random(-10, 10));
    bobs[bobtoMove].location.y = int(bobs[bobtoMove].location.y+random(-20, 20));
  }
}



void mousePressed() {
  for (Bob b : bobs) {
    b.clicked(mouseX, mouseY);
    //b.clicked(int(random(width)),int(random(height)));
  }
}

void mouseReleased() {
  for (Bob b : bobs) {
    b.stopDragging();
  }
}

