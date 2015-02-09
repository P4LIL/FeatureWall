OPC opc;
int numberPanels = 15;


int howMany = 100;

float[] x = new float[howMany];
float[] y = new float[howMany];
float[] speed = new float[howMany];
 
void setup() {
  size(150*2, 48*2);
  background(0);
  noStroke();
  smooth();
  
  opc = new OPC(this, "127.0.0.1", 7890);
  int spacingX = width/(30*5);
  int spacingY = height/(16*3);
  for (int i = 0; i<numberPanels*8; i++) {
    // void ledGrid(int index, int stripLength, int numStrips, float x, float y,float ledSpacing, float stripSpacing, float angle, boolean zigzag)
    opc.ledGrid(i * 60, 30, 2, ((i/8)%5*30+14)*spacingX, (((i%8)*2)*spacingY)+((i/8)/5)*(spacingY*15+1), spacingX, spacingY, 0, true);
  //  println(i/8," x=",((i/8)%5*30+15)*spacingX," y=",(((i%8)*2+1)*spacingY)+((i/8)/5)*(spacingY*15+1));
  }
 
  int i = 0;
  while (i<howMany) {
    x[i] = random(0, width);
    y[i] =random(0, height);
    speed[i] = random(1,3);
    i +=1;
  }
}
 
void draw() {
  background(0);
  //fill(0,15);
  //rect(0,0,width, height);
 
  int i = 0;
  while (i < howMany) {
    fill(50*speed[i]);
    ellipse(x[i], y[i],speed[i],speed[i]);
    y[i] += speed[i]/2;
    if (y[i] > height) {
      y[i] = 0;
    }
    i +=1;
  }
}

