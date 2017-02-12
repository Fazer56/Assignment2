class Bullet extends GameObject
{
  float size;
  float speed = 10;
  float timeTolive;
  float alive;
  PVector forward;
  float direction;
  PShape gun;
  PShape back;
  PShape middle;
  PShape front;
  PShape tail;
  
  Bullet(float x, float y, float size, float timeTolive)
  {
    
    this.size = size;
    this.timeTolive = timeTolive;
    this.alive = 0;
    pos = new PVector(x, y);
    forward = new PVector(mouseX, mouseY);
    direction = atan2(forward.y - pos.y, forward.x - pos.x) / radians(180) * 180;
    create();
  }
  
  void create()
  {
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
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    shape(gun);
    popMatrix();
  }
  
  void update()
  {
    
    pos.x = pos.x + cos(direction/180*PI) * speed;
    pos.y = pos.y + sin(direction/180*PI)* speed;
    
    timeTolive--;
    if(timeTolive < 0)
    {
      gameObjects.remove(this);
      timeTolive = 300;
      
    }
    
    
    
    
  }//end update
 
  
}