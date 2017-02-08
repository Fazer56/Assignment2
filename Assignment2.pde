void setup()
{
   //size(1000, 800, P3D);
   fullScreen(P3D);
   font2 = loadFont("ARDESTINE-48.vlw");
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
   jet = minim.loadFile("jet2.mp3");
   boss = minim.loadFile("Laugh.wav");
   dead = minim.loadFile("zomb.wav");
   shieldSound = minim.loadFile("shield.wav");
   winning = minim.loadFile("win.wav");
   
    tune.rewind();
    tune.play();
   
   Player player1 = new Player(100, height-250, 2, 0, 0, 50, 'w', ' ', 'a', 'd', 's');
   Block b = new Block(0, height - 170, 110, 50);
   Block b1 = new Block(b.pos.x + b.blockW, height - 170, 110, 50);
   Block b2 = new Block(b1.pos.x + b.blockW, height - 170, 110, 50);
   Block b3 = new Block(b2.pos.x + b.blockW, height - 170, 110, 50);
   Block b4 = new Block(b3.pos.x + b.blockW, height - 230, 110, 50);
   Block b5 = new Block(b.pos.x - 310, height - 170, 110, 50);
   Block b6 = new Block(b.pos.x - 210, height - 170, 110, 50);
   Block b7 = new Block(b.pos.x - 110, height - 170, 110, 50);
   Block b8 = new Block(3000, height - 800, 110, 50);
   Shield shield = new Shield( 1200, height - 850);
   
   
   Block[] blocks = new Block[40];
   
   float high = height - 200;
   float gap = 110;
   
   for(int i = 0 ; i< blocks.length-1; i++)
   {
     stroke(0);
     blocks[i] = new Block(b4.pos.x + gap, high, 110, 50);
     gameObjects.add(blocks[i]);
     high = high + (60 * random(-1, 1));
     gap+= 110;
   }
   
   Enemy e = new Enemy(width/2, height/2, player1.pos.x, player1.pos.y, 120, 2);
   
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
AudioPlayer jet;
AudioPlayer boss;
AudioPlayer dead;
AudioPlayer shieldSound;
AudioPlayer winning;

int score = 0;
int score2 = 0;
int gameOver = 230;
PImage img, img2;
PFont font, font2;
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
      
      running(); 
      break;
      
    }
  }
  
}

void running()
{          
    for( int i  = 0; i < gameObjects.size(); i++)
    {
      GameObject go = gameObjects.get(i);
      go.render();
      go.update();
    }
    if(frameCount % 120 == 0)
    {
      Level c = new Level();
      c.pos =new PVector(random(2000), random(45, height/2.5));
      gameObjects.add(c);
      
      //gameObjects.remove(c);
    }
    
  
}