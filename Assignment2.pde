void setup()
{
   size(1000, 800, P3D);
   
   font = loadFont("ARDELANEY-48.vlw");
   img = loadImage("BounceFinal.png");
}

PImage img;
PFont font;
int gameState = 0;
float imgY = 0;

ArrayList <GameObject> gameObjects = new ArrayList <GameObject>();

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
  
  image(img, width/4, imgY, width/2, height/4); 
  //image(img2, width/1.5, height/6); //width/8, height/8);
  
  imgY++;
  if(imgY >= height/4)
  {
    imgY = height/4;
  }
  


  
}