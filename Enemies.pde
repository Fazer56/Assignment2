class Enemy extends GameObject
{
  
  PVector playerPos;
  float angle;
  
  Enemy()
  {
  }
  
  Enemy(float x1, float y1, float x2, float y2)
  {
    pos = new PVector(x1, y1);
    playerPos = new PVector(x2, y2);
    this.angle = atan2(pos.y - playerPos.y, pos.x - playerPos.x) / /*radians(180)*/ PI * 180;
  }
   
  void create()
  {
  }
  
  void render()
  {
    
    pushMatrix();
    translate(pos.x, pos.y);
    fill(0);
    rect(0, 0, 20, 20);
    popMatrix();
    
  }
  
  void update()
  {
    
    pos.x = pos.x - cos(angle/180 * PI) * 3;
    pos.y = pos.y - sin(angle/180 * PI) * 3;
    

     
  }
  
 /* class Bullet extends GameObject
{
  float theta;
  float size;
  float speed = 50;
  float timeTolive;
  float alive;
  PVector forward;
  char fire;
  float rotation;
    PShape gun;
  PShape back;
  PShape middle;
  PShape front;
  PShape tail;
  
  Bullet(float x, float y, float theta, float size, float timeTolive)
  {
    this.theta = theta;
    this.size = size;
    this.timeTolive = timeTolive;
    
    pos = new PVector(x, y);
    forward = new PVector(mouseX, mouseY);
    rotation = atan2(forward.y - pos.y, forward.x - pos.x) / radians(180) * 180;
  
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
     gun = createShape(GROUP);
    fill(0);
    back = createShape(TRIANGLE, 0, 0, -15, 15, -15, -15);
    fill(255,random(255),255);
    middle = createShape(RECT, -5, -5, 20, 10);
    fill(255, 0, 0);
    front = createShape(ELLIPSE, 20, 0, 20, 15);
    fill(255, 150, 0);
    tail = createShape(ELLIPSE, -15, 0, 20, 10);
    gun.addChild(tail);
    gun.addChild(back);
    gun.addChild(middle);
    gun.addChild(front);
    shape(gun);
    popMatrix();
  }
  
  void update()
  {
    
    pos.x = pos.x + cos(rotation/180*PI) * speed;
    pos.y = pos.y + sin(rotation/180*PI)* speed;
    
    //pos.add(PVector.mult(forward, speed));
    timeTolive--;
    if(timeTolive < 0)
    {
      gameObjects.remove(this);
      timeTolive = 300;
      
    }
    
    
  }
 
  
}*/
  
  /*
  class AIShip extends Player
{
  color c;
  
  AIShip(float x, float y, float theta, float size, char up, char down, char left, char right
  , char fire, color c)
  {    
    super(x, y, theta, size, up, down, left, right, fire); // Constructor chaining
    println("In AISHip lots of parameters constructor");
    this.c = c;
  }
  
  AIShip(float x, float y, float size, color c)
  {
    this(x, y, 0, size, ' ', ' ', ' ', ' ', ' ', c); // Constructor chaining in this class
    println("In AISHip 4 param constructor");
  }
  
  void update()
  {
    forward.x = sin(theta);
    forward.y  = -cos(theta);
    pos.add(forward);
    if (pos.y< 10)
    {
      pos.y = 10;
      theta = PI;
    }
    if (pos.y > 400)
    {
      pos.y = 400;
      theta = 0;
    }
  }
  
  void render()
  {
    stroke(c);
    super.render();
  }
}
  
  */

  
}