
void setup()
{
   size(1000, 800, P3D);
   //fullScreen(P3D);
   font = loadFont("ARDELANEY-48.vlw");
   img = loadImage("BounceFinal.png");
   
   
   Player player1 = new Player(100, height-250, 2, 0, 0, 50, 'w', ' ', 'a', 'd', 's');
   Block b = new Block(0, height - 170, 100, 50);
   Block b1 = new Block(b.pos.x + b.blockW, height - 170, 100, 50);
   Block b2 = new Block(b1.pos.x + b.blockW, height - 170, 100, 50);
   Block b3 = new Block(b2.pos.x + b.blockW, height - 170, 100, 50);
   Block b4 = new Block(b3.pos.x + b.blockW, height - 230, 100, 50);
   
   Enemy e = new Enemy(width/2, height/2, player1.pos.x, player1.pos.y);
   
   gameObjects.add(player1);
   gameObjects.add(b);
   gameObjects.add(b1);
   gameObjects.add(b2);
   gameObjects.add(b3);
   gameObjects.add(b4);
   gameObjects.add(e);
   
   
   
}

PImage img;
PFont font;
int gameState = 2;
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
      background( 20, 120,255);
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
    
    if(frameCount % 120 == 0)
    {
      Level c = new Level();
      c.pos =new PVector(random(width), random(25, height/3));
      gameObjects.add(c);
      
      //gameObjects.remove(c);
     
    }
    
  
  if(frameCount % 480 == 0)
  {
    JetPack j = new JetPack();
    j.pos = new PVector(random(300, width + 500), random(height -300, height -450));
    gameObjects.add(j);
  }
  
  if (frameCount % 240 == 0)
  {
    Gun ammo = new Gun();
    ammo.pos = new PVector(random(0, width), random(height - 300, height - 450));
    gameObjects.add(ammo);
  }
  

  
}