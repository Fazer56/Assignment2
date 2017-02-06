boolean upCheck = false;
boolean bounce = false;
boolean grav = false;
boolean jetPack = false;
boolean shoot = true;
float shootCounter;

float x1;
float y1;
float x2;
float y2;

class Player extends GameObject
{
  float theta;
  float aimTheta;
  float r;
  PVector jump;
  int lives;
  PVector pGravity;
  PVector acceleration;
  PVector pVelocity;
  PVector forward;
  PVector aim;
  float pMass; 
  PVector pos;
  PShape pod;
  PShape ship;
  PShape gun1;
  PShape gun2;
  PShape gun3;
  PShape gun4;
  PShape board;
  PShape wheel1;
  PShape wheel2;
  PShape body;
  PShape leg;
  PShape gun;
  PShape lights;
  PShape box;
  char up, down, left, right, fire;
  int jumpTime;
  int gravTime;
  int ammo;
  int health;
  int jetFuel;
  
  Player(float x, float y, int lives, float theta, float aimTheta, float mass, char up, char down, char left, char right, char fire)
  {
    this.pMass = mass;
    this.lives = lives;
    this.up = up;
    this.down = down;
    this.left = left;
    this.right = right;
    this.fire = fire;
    this.jumpTime = 30;
    this.jetFuel = 0;
    this.gravTime = 30;
    this.theta = theta;
    this.aimTheta = aimTheta;
    this.ammo = 0;
    this.health = 100;
    pos = new PVector(x, y);
    jump = new PVector(0, -.12*mass); //powerup will multiply mass by 3!
    pGravity = new PVector(0, 0.006*mass);
    forward = new PVector(3, 0);
    acceleration = new PVector(0, 0);
    pVelocity = new PVector(0, 0);
    
    create();
  }
  
  void create()
  {
      /*ship = createShape(GROUP);
      fill(255, 0, 0);
      pod = createShape(RECT, -35, -55, mass, mass);
      fill(0);
      body = createShape(RECT, 30, -30, mass-30, mass/1.5);
      head = createShape(ARC, 10, - 50, mass-25, mass-25, radians(180), radians(360));
      box = createShape(RECT, -78, -20, mass/2, mass/10);
      noFill();
      strokeWeight(7);
      wheel1 = createShape(ELLIPSE, -20,  45, mass-70, mass-70);
      wheel2 = createShape(ELLIPSE, 40,  45, mass-70, mass-70);
      ship.addChild(box);
      ship.addChild(pod);
      ship.addChild(head);
      ship.addChild(body);
      ship.addChild(wheel1);
      ship.addChild(wheel2);*/
      
      ship = createShape(GROUP);
      fill(255, 255, 255);
      pod = createShape(ELLIPSE, 00, 00, pMass, pMass + 20); //createShape(ELLIPSE, 80, 80, mass, mass + 20);
      body = createShape(RECT, -15, 35, pMass-20, pMass+ 40);
      fill(0);
      gun1 = createShape(ELLIPSE, 00, 60, pMass/2 + 5, pMass/2 + 5); // PShape gun1 = createShape(ELLIPSE, mass, mass + 90, mass/2, mass/2);
      fill(255,0,0);
      gun2 = createShape(RECT, 15, 50, pMass-20, pMass/4); //PShape gun2 = createShape(RECT, mass + mass/5, mass*2, mass -20, mass/4);
      fill(0);
      gun = createShape(ARC, 45, 55, (pMass/4) - 5, (pMass/4) -5 , radians(270), radians(440));
      fill(0);
      gun3 = createShape(ARC, 16, 50, pMass -20,pMass/4, radians(0), radians(90));
      gun4 = createShape(ARC, 30, 60, pMass/3, pMass/3, radians(0), radians(180));
      fill(0, 255, 255);
      board = createShape(RECT, -50, 125, pMass * 2, pMass - 20);
      noFill();
      strokeWeight(7);
      wheel1 = createShape(ELLIPSE, -40,  170, pMass-70,pMass-70);
      wheel2 = createShape(ELLIPSE, 40,  170, pMass-70, pMass-70);
      
      ship.addChild(pod);
      ship.addChild(body);
      ship.addChild(gun1);
      ship.addChild(gun);
      ship.addChild(gun2);
      ship.addChild(gun3);
      ship.addChild(gun4);
      ship.addChild(board);
      ship.addChild(wheel1);
      ship.addChild(wheel2);
  }
  
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    textSize(30);
    noFill();
    rect(-50, -70, 100, 20);
    fill(255,0,0);
    rect(-50, -70, health, 20);
    fill(0);
    text(ammo, -90, -90);
    fill(0);
      PShape gun;
      PShape back;
      PShape middle;
      PShape front;
      PShape tail;
    gun = createShape(GROUP);
    fill(0);
    back = createShape(TRIANGLE, 15, -100, 0, -85, 0, -115);
    fill(255,random(255),255);
    middle = createShape(RECT, 10, -105, 20, 10);
    fill(255, 0, 0);
    front = createShape(ELLIPSE, 40, -100, 20, 15);
    fill(255, 150, 0);
    tail = createShape(ELLIPSE, -10, -100, 20, 10);
    gun.addChild(tail);
    gun.addChild(back);
    gun.addChild(middle);
    gun.addChild(front);
    shape(gun);
    noFill();
    fill(255,255,0);
    rect(-50, -160, jetFuel/6, 20);
    fill(0);
    text("Fuel ", -130, -145);
    shape(ship);
    popMatrix();
    
  }
  
  //Using newtons second law to apply force
  float jHeight = 120;
  float posY = 0;
  
  void update()
  {
       camera(pos.x, height/2, (height/2)/tan(PI/6), pos.x, height/2, 0, 0, 1, 0);
      //for the wheels
      x1 = pos.x + 40;
      y1 = pos.y + 170;
      
      x2 = pos.x - 40;
      y2 = pos.y + 170;
      r =15;
      float cx;
      float cy;
      float cx1;
      float cy1;
      
      cx = sin(theta)*r + x1;
      cy = cos(theta)*r + y1;
      cx1 = sin(theta)*r + x2;
      cy1 = cos(theta)*r + y2;
      strokeWeight(3);
      stroke(0);
      println(x1);
      println(cx);
     
      line(cx , cy, pos.x + 40, pos.y + 170);
      line(cx + 5, cy1, pos.x - 35, pos.y + 170);
      line(cx + 5 , cy1, pos.x - 45, pos.y + 170);
      line(cx , cy1, pos.x - 35, pos.y + 170);
      line(cx1 , cy1, pos.x - 40, pos.y + 170);
      line(cx1 + 5, cy1, pos.x - 40, pos.y + 170);
      line(cx1 + 5 , cy1, pos.x - 45, pos.y + 170);
      line(cx1 , cy1, pos.x - 40, pos.y + 170);
      
      if(checkKey(up) && grav == false)
      {
        jumpSound.rewind();
        jumpSound.play();
       
        bounce = true;
       
      }
   
      if(bounce == true)
      {
        pVelocity.add(acceleration);
        jump.add(pVelocity);
        pos.add(jump);  
        acceleration.mult(0);
        jumpTime-=1;
        float spring = 10;
        for(int i = 0; i < 5; i++)
        {
          fill(255,0,0);
          ellipse(pos.x, pos.y + (140 + spring), 15, 10);
          spring+=10;
        }
        
        if(jumpTime < 0)
        {
          bounce = false;
          grav = true;
          
        }
      }
      
      
       
    if(checkKey(left))
    {
      pVelocity.add(acceleration);
      forward.add(pVelocity);
      pos.add(PVector.mult(forward, -1));
      theta+=.5f;
    }
    
    if(checkKey(right))
    {
      pVelocity.add(acceleration);
      forward.add(pVelocity);
      pos.add(forward);
      theta-=.5f;
    }
    
    if(checkKey(fire) && ammo > 0)
    {
      //tune.pause();
       shotgun.rewind();
       shotgun.play();
       
      
      if(shoot == true)
      {
        
        Bullet b = new Bullet(pos.x + 20, pos.y + 30, 0, 10, 300);
        gameObjects.add(b);
        shoot = false;
        shootCounter = 0;
       
        ammo--; 
      }
         
    }
   
    if(shoot == false)
    {  
      shootCounter++;
      
      if(shootCounter == 10)
      {
        shoot = true;
      }
    }

    for(int i = 0 ; i < gameObjects.size() ; i ++)
    {
      GameObject go = gameObjects.get(i);
      if (go instanceof Powerup)
      {
        Powerup p = (Powerup) go;
        if (dist(go.pos.x, go.pos.y - 50, this.pos.x, this.pos.y) < mass + 10)
        {
          p.applyTo(this);
          gameObjects.remove(go);
          
        }
        
      }
      
      if(go instanceof Block)
      {
        Block b = (Block) go;
        if(bounce == false)
        {
          if(grav == false && jetFuel <= 0)
          {
            if((this.pos.y + 180 >= go.pos.y|| this.pos.y + 180 <= go.pos.y) && this.pos.x  >= go.pos.x && this.pos.x <= go.pos.x + 100)
            {
              
              this.pos.y = go.pos.y - 180;
            }
          }
          if(grav == true && jetFuel <= 0)
          {
            /* //println("piss");
            PVector g = PVector.div(pGravity, mass);
            acceleration.add(g);
            pos.add(acceleration); 
            acceleration.mult(0);
             */
           
             pos.y+=.05;
             if(this.pos.y >= go.pos.y - 180)
             {
               jumpTime = 30;
               grav = false;
             }
          }
         }
       }
      
        if(go instanceof Enemy)
        {  
          Enemy e = (Enemy) go;
        if(dist(this.pos.x, this.pos.y, go.pos.x, go.pos.y) < mass )
        {
          this.health--;
          gameObjects.remove(e);
         
        
          }
        
      }
    }
      
  if(frameCount % 240 == 0)
  {
    
    Enemy e = new Enemy(width/2, height/2, this.pos.x, this.pos.y);
    gameObjects.add(e);
    
  }
    
    if(jetFuel > 0)
    {
        pVelocity.add(acceleration);
        jump.add(pVelocity);
        pos.add(jump);  
        acceleration.mult(0);
        
        JetPack j = new JetPack(pos.x - 30, pos.y + 70);
        gameObjects.add(j);
        jetFuel--;
        
        if(pos.y < height - 600)
        {
          pos.y = height - 600;
          
        }
       
    }
    if(this.ammo > 0)
    {
    
      Gun g = new Gun(pos.x + 20, pos.y + 50);
      stroke(38, 179, 10);
      line(pos.x + 20, pos.y + 50, mouseX, mouseY);
      noCursor();
      ellipse(mouseX, mouseY, 10, 10);
      stroke(0);
      gameObjects.add(g);
      
    }
    
  }
  
}