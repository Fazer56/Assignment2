void setup()
{
   size(1000, 800, P3D);
   
   font = loadFont("ARDELANEY-48.vlw");
   img = loadImage("BounceFinal.png");
   
   Player player1 = new Player(100, height-200, 2, 50, 'w', 's', 'a', 'd', ' ');
   
   gameObjects.add(player1);
  
}

PImage img;
PFont font;
int gameState = 0;
float imgY = 0;

ArrayList <GameObject> gameObjects = new ArrayList <GameObject>();
boolean[] keys = new boolean[1000];

void keyPressed()
{ 
  keys[keyCode] = true;
}

void keyReleased()
{
  keys[keyCode] = false; 
}

boolean checkKey(int k)
{
  if (keys.length >= k) 
  {
    return keys[k] || keys[Character.toUpperCase(k)];  
  }
  return false;
}

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
  
  switch(gameState)
  {
    case 0 :
    {
      bounceBall();
      break;
    }
    
    case 1 :
    {
      Menu  m = new Menu();
       gameObjects.add(m);
       m.render();
      break;
      
    }
    
    case 2 :
    {
      background(255,255,255);
      running();
      break;
      
    }
  }
  
}

void running()
{
     for(int i = 0; i < gameObjects.size(); i++)
    {
      GameObject go = gameObjects.get(i);
      go.render();
      go.update();
      
    }
  
}