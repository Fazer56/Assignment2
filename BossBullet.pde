class BossBullet extends GameObject
{
  float speed = 5;
  float timeTolive;
  float direction;
  PShape gun;
  PShape back;
  PShape middle;
  PShape front;
  PShape tail;
  PVector playerP;
  
  BossBullet(float x, float y, float timeTolive, float x1, float y1)
  {
    this.timeTolive = timeTolive;
    pos = new PVector(x, y);
    playerP = new PVector(x1, y1);
    this.direction = atan2(pos.y - playerP.y, pos.x - playerP.x) / PI * 180;
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
     gun = createShape(GROUP);
    fill(0);
    back = createShape(TRIANGLE, 0, 0, 15, -15, 15, 15);
    fill(0, 0, 255);
    middle = createShape(RECT, -5, -5, 20, 10);
    fill(0);
    front = createShape(ELLIPSE, 20, 0, 20, 15);
    fill(255, 0, 0);
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
    pos.x = pos.x - cos(direction/180 * PI) * speed;
    pos.y = pos.y - sin(direction/180 * PI) * speed;
    timeTolive--;
    if(timeTolive < 0)
    {
      gameObjects.remove(this);
      timeTolive = 300;
      
    }  
  }//end update()
 
}