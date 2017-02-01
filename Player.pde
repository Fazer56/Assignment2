boolean upCheck = false;
boolean bounce = false;
boolean grav = false;


float x1;
float y1;
float x2;
float y2;

class Player extends GameObject
{
  float theta;
  float r;
  PVector jump;
  int lives;
  PVector pGravity;
  PVector acceleration;
  PVector pVelocity;
  PVector forward;
  float pMass; 
  PVector pos;
  PShape pod;
  PShape ship;
  PShape head;
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
  
  Player(float x, float y, int lives, float mass, char up, char down, char left, char right, char fire)
  {
    this.pMass = mass;
    this.lives = lives;
    this.up = up;
    this.down = down;
    this.left = left;
    this.right = right;
    this.fire = fire;
    pos = new PVector(x, y);
    jump = new PVector(0, -.12*mass); //powerup will multiply mass by 3!
    pGravity = new PVector(0, 0.008*mass);
    forward = new PVector(3, 0);
    acceleration = new PVector(0, 0);
    pVelocity = new PVector(0, 0);
    jumpTime = 30;
    gravTime = 5;
    create();
  }
  
  void create()
  {
      ship = createShape(GROUP);
      fill(255, 0, 0);
      pod = createShape(ELLIPSE, 0, 0, 80, 80);
      fill(0);
      head = createShape(ARC, 5, - 5, 55, 55, radians(270), radians(360));
      box = createShape(RECT, -78, -10, 40, 10);
      noFill();
      strokeWeight(7);
      wheel1 = createShape(ELLIPSE, -20,  40, 30, 30);
      wheel2 = createShape(ELLIPSE, 20,  40, 30, 30);
      ship.addChild(box);
      ship.addChild(pod);
      ship.addChild(head);
      ship.addChild(wheel1);
      ship.addChild(wheel2); 
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    shape(ship);
    popMatrix();
    
  }
  
  //Using newtons second law to apply force
  float jHeight = 120;
  float posY = 0;
  
  void update()
  {
      
      //for the wheels
      x1 = pos.x + 20;
      y1 = pos.y + 40;
      
      x2 = pos.x - 20;
      y2 = pos.y + 40;
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
     
      line(cx , cy, pos.x + 20, pos.y + 40);
      line(cx + 5, cy1, pos.x - 20, pos.y + 40);
      line(cx + 5 , cy1, pos.x - 25, pos.y + 40);
      line(cx , cy1, pos.x - 20, pos.y + 40);
      line(cx1 , cy1, pos.x - 20, pos.y + 40);
      line(cx1 + 5, cy1, pos.x - 20, pos.y + 40);
      line(cx1 + 5 , cy1, pos.x - 25, pos.y + 40);
      line(cx1 , cy1, pos.x - 20, pos.y + 40);
      
      if(upCheck == false)
      {
        if(checkKey(up) /*&& grav == false*/)
        {
          //posY = pos.y;
          bounce = true;
          upCheck = true;
        }
      }
      if(bounce == true)
      {
        pVelocity.add(acceleration);
        jump.add(pVelocity);
        pos.add(jump);  
        acceleration.mult(0);
        jumpTime-=1;
        if(jumpTime < 0)
        {
          bounce = false;
          grav = true;
          jumpTime = 30;
        }
      }
      
      if(grav == true && pos.y < height- 100)
       {
         /*println("piss");
         PVector g = PVector.div(pGravity, mass);
         acceleration.add(g);
         pos.add(acceleration); 
         gravTime-=1;
         if(pos.y > height - 100)
         {
           acceleration.mult(0);
           println("cunt");
           grav = false;
           acceleration.x = 0;
           acceleration.y = 0;
          // acceleration.mult(0);
         }
         */
         
         pos.y+=5;
         
         if(pos.y < height -100)
         {
           upCheck = false;
           
         }
         
         
       } 
       else
       {
         grav = false;
         
         
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
    
    if(pos.x > 300)
    {
      if(frameCount % 240 == 0)
      {
        Gun g = new Gun();
        g.pos = new PVector(random(pos.x + 100, pos.x + 200), random(pos. y - 10, pos.y - 30 ));
        gameObjects.add(g);
      }
      
      if(frameCount % 480 == 0)
      {
        JetPack j = new JetPack();
        j.pos = new PVector(random(pos.x + 150, pos.x + 250), random(pos. y - 10, pos.y - 30 ));
        gameObjects.add(j);
      }
    }
    
  }
  
}