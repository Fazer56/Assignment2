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
  int ammo;
  int health;
  
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
    this.gravTime = 5;
    this.theta = theta;
    this.aimTheta = aimTheta;
    this.ammo = 0;
    this.health = 100;
    pos = new PVector(x, y);
    jump = new PVector(0, -.12*mass); //powerup will multiply mass by 3!
    pGravity = new PVector(0, 0.008*mass);
    forward = new PVector(3, 0);
    acceleration = new PVector(0, 0);
    pVelocity = new PVector(0, 0);
    
    create();
  }
  
  void create()
  {
      ship = createShape(GROUP);
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
      ship.addChild(wheel2); 
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    textSize(20);
    text("Health " + health, 0, -500);
    text("Ammo " + ammo, 0, -550);
    shape(ship);
    popMatrix();
    
  }
  
  //Using newtons second law to apply force
  float jHeight = 120;
  float posY = 0;
  
  void update()
  {
      
      //for the wheels
      x1 = pos.x + 40;
      y1 = pos.y + 45;
      
      x2 = pos.x - 30;
      y2 = pos.y + 45;
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
     
      line(cx , cy, pos.x + 30, pos.y + 40);
      line(cx + 5, cy1, pos.x - 25, pos.y + 40);
      line(cx + 5 , cy1, pos.x - 35, pos.y + 40);
      line(cx , cy1, pos.x - 25, pos.y + 40);
      line(cx1 , cy1, pos.x - 30, pos.y + 40);
      line(cx1 + 5, cy1, pos.x - 30, pos.y + 40);
      line(cx1 + 5 , cy1, pos.x - 35, pos.y + 40);
      line(cx1 , cy1, pos.x - 30, pos.y + 40);
      
        if(checkKey(up) && grav == false)
        {
          //posY = pos.y;
          bounce = true;
          upCheck = true;
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
          ellipse(pos.x, pos.y + (40 + spring), 15, 10);
          spring+=10;
        }
        
        if(jumpTime < 0)
        {
          bounce = false;
          grav = true;
          jumpTime = 30;
        }
      }
      
      if(grav == true && pos.y < height- 150)
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
         
         if(pos.y < height -150)
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
    
    if(checkKey(fire) && ammo > 0)
    {

      Bullet b = new Bullet(pos.x, pos.y - 90, 0, 10, 300);
      gameObjects.add(b);
      ammo--;
    }
    

    for(int i = 0 ; i < gameObjects.size() ; i ++)
    {
      GameObject go = gameObjects.get(i);
      if (go instanceof Powerup)
      {
        Powerup p = (Powerup) go;
         if (dist(go.pos.x, go.pos.y, this.pos.x, this.pos.y) < mass + 5)
        {
          p.applyTo(this);
          gameObjects.remove(go);
          
        }
        
      }
    }
    
    //aim.x = sin(aimTheta) + mouseX;
   // aim.y = -cos(aimTheta) + mouseY;
    
    if(this.ammo > 0)
    {
    
      Gun g = new Gun(pos.x, pos.y - 90);
      
      gameObjects.add(g);
      
    }
    
  }
  
}