OPC opc;
int numberPanels = 15;

int quantity = 400;
float [] xPosition = new float[quantity];
float [] yPosition = new float[quantity];
int [] flakeSize = new int[quantity];
int [] direction = new int[quantity];
color [] colour = new color[quantity];
int minFlakeSize = 2;
int maxFlakeSize = 3;

void setup() {

  size(150, 48);
  frameRate(30);
  noStroke();
  smooth();

  opc = new OPC(this, "192.168.0.36", 7890);
  int spacingX = width/(30*5);
  int spacingY = height/(16*3);
  for (int i = 0; i<numberPanels*8; i++) {
    // void ledGrid(int index, int stripLength, int numStrips, float x, float y,float ledSpacing, float stripSpacing, float angle, boolean zigzag)
    opc.ledGrid(i * 60, 30, 2, ((i/8)%5*30+14)*spacingX, (((i%8)*2)*spacingY)+((i/8)/5)*(spacingY*15+1), spacingX, spacingY, 0, true);
  //  println(i/8," x=",((i/8)%5*30+15)*spacingX," y=",(((i%8)*2+1)*spacingY)+((i/8)/5)*(spacingY*15+1));
  }

  for (int i = 0; i < quantity; i++) {
    flakeSize[i] = round(random(minFlakeSize, maxFlakeSize));
    xPosition[i] = random(0, width);
    yPosition[i] = random(0, height);
    direction[i] = round(random(0, .2));
    colour[i] = color(random(0, 255), random(0, 255), random(0, 255));
  }
}

void draw() {

  background(0);

  for (int i = 0; i < xPosition.length; i++) {
    
    ellipse(xPosition[i], yPosition[i], flakeSize[i], flakeSize[i]);
  fill(colour[i]);
    if (direction[i] == 0) {
      xPosition[i] += map(flakeSize[i], minFlakeSize, maxFlakeSize, .1, .5);
    } else {
      xPosition[i] -= map(flakeSize[i], minFlakeSize, maxFlakeSize, .1, .5);
    }

    yPosition[i] += flakeSize[i]/3 + direction[i]; 

    if (xPosition[i] > width + flakeSize[i] || xPosition[i] < -flakeSize[i] || yPosition[i] > height + flakeSize[i]) {
      xPosition[i] = random(0, width);
      yPosition[i] = -flakeSize[i]/3;
    }
  }
}

