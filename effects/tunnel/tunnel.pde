int width = 150*2;
int height = 48*2;
float t=0;
float b=50;
float top[] = new float[width];
float bottom[] = new float[width];

void setup() {
  for (int i = 0; i<width; i++) {
    top[i] = noise(t);
    top[i] = map(top[i], 0, 1, 0, height-20);
    t=t+0.05;
    bottom[i] = noise(b);
    bottom[i] = map(bottom[i], 0, 1, top[i]+30, height);
    b=b+0.01;
  }
  size(width, height);
  background(0);
}

void draw() {
  background(0);
  stroke(139,69,19);
  for (int i = 0; i < width; i++) {
    line(i,0,i, top[i]);
    line(i,height,i, bottom[i]); 
  }
  stroke(255);
  int pos = width/2;
  //point(pos,(bottom[pos]-top[pos])/2+top[pos]);
  float x=pos;
  float y=(bottom[pos]-top[pos])/2+top[pos];
  point(x,y);
  triangle(x,y,x-4,y-1,x-4,y+1);
  arrayCopy(top, 1, top, 0, top.length-1);
  top[top.length-1] = noise(t);
  top[top.length-1] = map(top[top.length-1], 0, 1, 0, height-30);
  t=t+0.05;

  arrayCopy(bottom, 1, bottom, 0, bottom.length-1);
  bottom[bottom.length-1] = noise(b);
  bottom[bottom.length-1] = map(bottom[bottom.length-1], 0, 1, top[top.length-1]+10, height);
  b=b+0.01;
}

