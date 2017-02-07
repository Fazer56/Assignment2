
void setup()
{
   //size(1000, 800, P3D);
   fullScreen(P3D);
   font = loadFont("ARDELANEY-48.vlw");
   img = loadImage("BounceFinal.png");
   img2 = loadImage("back.png");
   
   //load music
   minim = new Minim(this);
   tune = minim.loadFile ("GOTR.mp3");
   jumpSound= minim.loadFile("Jump.wav");
   shotgun = minim.loadFile("Gauge.wav");
   reload = minim.loadFile("reload.wav");
   scream = minim.loadFile("Scream.wav");
   pain = minim.loadFile("Pain.wav");
  
   
   Player player1 = new Player(100, height-250, 2, 0, 0, 50, 'w', ' ', 'a', 'd', 's');
   Block b = new Block(0, height - 170, 100, 50);
   Block b1 = new Block(b.pos.x + b.blockW, height - 170, 100, 50);
   Block b2 = new Block(b1.pos.x + b.blockW, height - 170, 100, 50);
   Block b3 = new Block(b2.pos.x + b.blockW, height - 170, 100, 50);
   Block b4 = new Block(b3.pos.x + b.blockW, height - 230, 100, 50);
   Block b5 = new Block(b.pos.x - 300, height - 170, 100, 50);
   Block b6 = new Block(b.pos.x - 200, height - 170, 100, 50);
   Block b7 = new Block(b.pos.x - 100, height - 170, 100, 50);
   Block b8 = new Block(3000, height - 800, 100, 50);
   Shield shield = new Shield( 3100, height - 850);
   
   Block[] blocks = new Block[40];
   
   float high = height - 200;
   float gap = 100;
   
   for(int i = 0 ; i< blocks.length-1; i++)
   {
     stroke(0);
     blocks[i] = new Block(b4.pos.x + gap, high, 100, 50);
     gameObjects.add(blocks[i]);
     high = high + (60 * random(-1, 1));
     gap+= 100;
   }
   
   Enemy e = new Enemy(width/2, height/2, player1.pos.x, player1.pos.y, 120);
   
   gameObjects.add(player1);
   gameObjects.add(b);
   gameObjects.add(b1);
   gameObjects.add(b2);
   gameObjects.add(b3);
   gameObjects.add(b4);
   gameObjects.add(b5);
   gameObjects.add(b6);
   gameObjects.add(b7);
   gameObjects.add(e);
   gameObjects.add(b8);
   gameObjects.add(shield);
   
   
   
}

import ddf.minim.*;
Minim minim;
AudioPlayer tune;
AudioPlayer jumpSound;
AudioPlayer shotgun;
AudioPlayer reload;
AudioPlayer scream;
AudioPlayer pain;


PImage img, img2;
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
        Menu  m = new Menu(width/4, height/2);
        println(width/4);
        gameObjects.add(m);
        m.render();
      
      break;
      
    }
    
    case 2 :
    {
      background( 20, 120,255);
      float imageX =0;
      for(int i = 0; i < 5; i++)
      {
        image(img2, imageX - 3000, 0, width, height);
        imageX+= 1920;
      }
      
      tune.play();
      tune.pause();
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
      c.pos =new PVector(random(5000), random(45, height/2.5));
      gameObjects.add(c);
      
      //gameObjects.remove(c);
     
    }
    
  
  if(frameCount % 360 == 0)
  {
    JetPack j = new JetPack(random(300, 5000), random(height -300, height -450), 240);
    gameObjects.add(j);
  }
  
  if (frameCount % 240 == 0)
  {
    Gun ammo = new Gun(random(0, 5000), random(height - 300, height - 450), 240);
    gameObjects.add(ammo);
        
  }
  
}