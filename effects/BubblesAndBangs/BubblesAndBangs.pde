// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Separation
// Via Reynolds: http://www.red3d.com/cwr/steer/

// A list of vehicles
ArrayList<Vehicle> vehicles;

OPC opc;
int numberPanels = 15;


void setup() {
  size(150, 48);
  smooth();

  opc = new OPC(this, "127.0.0.1", 7890);
  int spacingX = width/(30*5);
  int spacingY = height/(16*3);
  for (int i = 0; i<numberPanels*8; i++) {
    opc.ledGrid(i * 60, 30, 2, ((i/8)%5*30+14)*spacingX, (((i%8)*2)*spacingY)+((i/8)/5)*(spacingY*15+1), spacingX, spacingY, 0, true);
  }
  // We are now making random vehicles and storing them in an ArrayList
  vehicles = new ArrayList<Vehicle>();
  for (int i = 0; i < 100; i++) {
    vehicles.add(new Vehicle(random(width), random(height)));
  }
}

void draw() {
  background(0);

  for (Vehicle v : vehicles) {
    // Path following and separation are worked on in this function
    v.separate(vehicles);
    // Call the generic run method (update, borders, display, etc.)
    v.update();
    v.borders();
    v.display();
  }

  // Instructions
  fill(0, 150);
  rect(3, 3, width-6, 20, 3);
  fill(255, 0, 255);
  textSize(13);
  text("BUBBLES AND BLASTS", 7, height-30);
}


void mouseDragged() {
  vehicles.add(new Vehicle(mouseX, mouseY));
}



