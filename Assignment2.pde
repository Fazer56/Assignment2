void setup()
{
   size(1000, 800, P3D);
   
   font = loadFont("ARDELANEY-48.vlw");
}

PFont font;
int gameState = 0;

void draw()
{
  noStroke();
  fill(0,255,0);
  rect(0,0, width, height/4);
  fill(255,255,0);
  rect(0, height/4, width, height/4);
  fill(0, 0, 255);
  rect(0, height/2, width, height/4);
  fill(255, 0, 0);
  rect(0, height/4*3, width, height/4);
  
}