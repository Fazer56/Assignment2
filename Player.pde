boolean upCheck = false;
boolean bounce = false;

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
    jump = new PVector(0, -.08*mass); //powerup will multiply mass by 3!
    pGravity = new PVector(0, 0);
    forward = new PVector(3, 0);
    acceleration = new PVector(0, 0);
    pVelocity = new PVector(0, 0);
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

  
  void update()
  {
      
      //for the wheels
      x1 = pos.x - 20;
      y1 = pos.y + 40;
      
      x2 = pos.x + 20;
      y2 = pos.y + 40;
      r =0;
      float cx;
      float cy;
      
      cx = x1 + sin(theta)*r;
      cy = y1 + cos(theta)*r;
      strokeWeight(3);
      stroke(0);
      println(x1);
      line(x1, cy + y1, cx + x2, y2);
      
      
  /*      
   float x =  width/2;
  float y = height/2;;
  
float theta = 360;
 float r = 30;
 
void draw()
{
  background(0);
  
    
  

 
  
  
  stroke(255,255,255);
  strokeWeight(3);
  //pushMatrix();
  //translate(cx, cy);
  //line(cx, cy, 50, 50 );
  line(100, cy, cx, 100);
      
    */  
    
      if(checkKey(up))
      {
        
        bounce = true;
      }
      
      if(bounce == true)
      {
        pVelocity.add(acceleration);
        jump.add(pVelocity);
        pos.add(jump);  
        acceleration.mult(0);
      }
      
    if(checkKey(left))
    {
      pVelocity.add(acceleration);
      forward.add(pVelocity);
      pos.add(PVector.mult(forward, -1));
      theta--;
      
    }
    
    if(checkKey(right))
    {
      pVelocity.add(acceleration);
      forward.add(pVelocity);
      pos.add(forward);
      theta++;
    }
    
    
    if(pos.x > 300)
    {
      if(frameCount % 240 == 0)
      {
        Gun g = new Gun();
        g.pos = new PVector(random(pos.x + 100, pos.x + 200), random(pos. y - 10, pos.y - 30 ));
        gameObjects.add(g);
      }
    }
    
  }
  
}