// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Bob class, just like our regular Mover (location, velocity, acceleration, mass)

class Bob { 
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass = 2;
  
  // Arbitrary damping to simulate friction / drag 
  float damping = .95;

  // For mouse interaction
  PVector dragOffset;
  boolean dragging = false;
  
  boolean fix;
  int me;

  // Constructor
  Bob(float x, float y, boolean fixed,int Me) {
    location = new PVector(x,y);
    velocity = new PVector();
    acceleration = new PVector();
    dragOffset = new PVector();
    fix = fixed;
    me = Me;
  } 

  // Standard Euler integration
  void update() { 
    velocity.add(acceleration);
    velocity.mult(damping);
    location.add(velocity);
    acceleration.mult(0);
  }

  // Newton's law: F = M * A
  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);
    acceleration.add(f);
  }


  // Draw the bob
  void display() { 
    stroke(0);
    strokeWeight(2);
    fill(175,120);
    if (dragging) {
      fill(50);
    }
    //ellipse(location.x,location.y,mass*2,mass*2);
    //ellipse(location.x,location.y,5,5);
    imageMode(CENTER);
    image(images[me], location.x,location.y);
  } 

  // The methods below are for mouse interaction

  // This checks to see if we clicked on the mover
  void clicked(int mx, int my) {
    
    float d = dist(mx,my,location.x,location.y);
    if (d < mass) {
      dragging = true;
      dragOffset.x = location.x-mx;
      dragOffset.y = location.y-my;
    }
  }

  void stopDragging() {
    dragging = false;
  }

  void drag(int mx, int my) {
    if (dragging) {
      location.x = mx + dragOffset.x;
      location.y = my + dragOffset.y;
    }
  }
}

