int width = 150;
int height = 48;
int noOfBalls = 1000;
int ballNo = 0;

float ballsx[] = new float[noOfBalls];
float ballsy[] = new float[noOfBalls];

void setup() {
  size(width, height);
  background(0);
  for (int i = 0; i<noOfBalls; i++) {
    ballsx[i] = width/2;
    ballsy[1] = 0;
  }
}

void draw() {
  background(0);
  stroke(255);
  for (int i = 0; i<ballNo; i++) {
    point(ballsx[i], ballsy[i]);
    ballsy[i]=ballsy[i]+1;

    ballsx[i]=ballsx[i]+(random(2)-1)*2;
  }
  ballNo++;
  if (ballNo == noOfBalls-1) {
    ballNo = 0;
    for (int i = 0; i<noOfBalls; i++) {
      ballsx[i] = width/2;
      ballsy[1] = 0;
    }
  }
}

