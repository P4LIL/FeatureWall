import peasy.*;

PeasyCam cam;

PImage TQ;
Pixel[] pixel = new Pixel[72000];
int noPixels;
float angle = .005;

int time;
int interval = 10000;

boolean explode = true;

//PVector Explode;

void setup() {
  size (150, 48, P3D);
  strokeWeight(1);
  cam = new PeasyCam(this, width/2, height/2, 0, 70);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);
  cam.setActive(false);  // false to make this camera stop responding to mouse
  TQ = loadImage("techniquest.png");
  TQ.loadPixels();
  int i=0;
  for (int y = 0; y<TQ.height; y++) {
    for (int x = 0; x<TQ.width; x++) { 
      int loc = x + y*TQ.width;
      if (TQ.pixels[loc] != color(0, 0, 0)) {
        pixel[i] = new Pixel (2.0, x, y, 0, TQ.pixels[loc]);
        i++;
      }
    }
    TQ.updatePixels();
  }
  noPixels = i;

  //PVector Explode = new PVector(1,1,1);
  //println (Explode);
  time = millis();//store the current time
}

void draw() {
  background(0);
  //check the difference between now and the previously stored time is greater than the wait interval
  if (millis() - time >= interval) {
    explode = true;
    time = millis();//also update the stored time
  }
  cam.rotateY(angle);  // rotate around the z-axis passing through the subject
  color logoCol = color( random(100, 255), random(100, 255), random(100, 255));

  for (int i = 0; i<noPixels; i++) {
    if (explode) {
      PVector Explode = new PVector(random(-8.0, 8.0), random(-8.0, 8.0), random(-8.0, 8.0));
      pixel[i].applyForce(Explode);
      pixel[i].colour(logoCol);
    }

    //pixel[i].moveHome();
    pixel[i].update();
    pixel[i].plot();

    pixel[i].moveHome();
  }
  explode=false;
}

void mousePressed() {
  color logoCol = color( random(100, 255), random(100, 255), random(100, 255));
  for (int i = 0; i<noPixels; i++) {

    //if (explode) pixel[i].explode();

    pixel[i].update();
    pixel[i].moveHome();
    pixel[i].plot();
    pixel[i].colour(logoCol);
    //ambientLight(255, 255, 255, 0,0,0);
  }
}

