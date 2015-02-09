float rotation = 0;
float zDistance = 0;


void setup() {
  size (150, 48, P3D);
}
void draw() {
  background(0);
  noStroke();
  directionalLight(126, 126, 126, 0, 0, -1);
  ambientLight(102, 102, 102);
  translate(0, 0, zDistance); 
  //rotateY(rotation);
 // fill(110, 0, 0);
  box(20);
  //rotation = rotation + 0.01;
  zDistance = zDistance - 1;
  if (zDistance < -50 ) zDistance = 0;
  println (zDistance);
}

