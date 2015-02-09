class Pixel {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;

  PVector TQ;
  color col;
  color newCol;

  Pixel(float m, float _x, float _y, float _z, color _col) {
    location = new PVector(_x, _y, _z);
    velocity = new PVector(0, 0, 0);
    acceleration = new PVector(0, 0, 0);
    TQ = new PVector(_x, _y, _z);
    col = _col;
    newCol = col;
    mass = m;
  }


  void applyForce(PVector force) {
    println(force, mass);
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }


  void colour(color colour) {
    newCol = blendColor(col, colour, MULTIPLY);
  }

  void moveHome() {
    // compute acceleration towards home
    acceleration = PVector.sub(TQ, location);
    acceleration.normalize();
    acceleration.mult(.1);
    //acceleration.add(newAcceleration);
    if (abs(location.x - TQ.x) < 1 ) {
      location.x = TQ.x;
      velocity.x = 0;
      acceleration.x = 0;
    }
    if (abs(location.y - TQ.y) < 1 ) {
      location.y = TQ.y;
      velocity.y = 0;
      acceleration.y = 0;
    }
    if (abs(location.z - TQ.z) < 1 ) {
      location.z = TQ.z;
      velocity.z = 0;
      acceleration.z = 0;
    }
  }

  void moveHome2(float speed) {
    // move towards home
    if (abs(location.x - TQ.x) < .5 ) {
      location.x = TQ.x;
      velocity.x = 0;
    }
    if (abs(location.y - TQ.y) < .5 ) {
      location.y = TQ.y;
      velocity.y = 0;
    }
    if (abs(location.z - TQ.z) < .5 ) {
      location.z = 0;
      velocity.y = 0;
    }

    if (location.x > TQ.x) location.x -=speed;
    if (location.y > TQ.y) location.y -=speed;
    if (location.z > TQ.z) location.z -=speed;
    if (location.x < TQ.x) location.x +=speed;
    if (location.y < TQ.y) location.y +=speed;
    if (location.z < TQ.z) location.z +=speed;
  }

  void drop() {
    location.x = random (-width, width);
    location.y = 30;
    location.z = random (-width, width);
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(10);
    location.add(velocity);
    acceleration.mult(0);
  }

  void plot() {
    stroke (newCol);
    point (location.x, location.y+13, location.z);
    //println (x, y, z);
    //sphere(2);
  }
}

