class Gun extends GameObject
{
  PShape gun;
  float theta;
  PShape back;
  PShape middle;
  PShape front;
  PShape tail;
  
  Gun()
  {
  }
  
  void applyTo(Player p)
  {
    p.gun();
    
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    gun = createShape(GROUP);
    fill(0);
    back = createShape(TRIANGLE, 60, 60, 45, 75, 45, 45);
    fill(255,255,255);
    middle = createShape(RECT, 55, 55, 20, 10);
    fill(255, 0, 0);
    front = createShape(ELLIPSE, 80, 60, 20, 15);
    fill(255, 150, 0);
    tail = createShape(ELLIPSE, 45, 60, 20, 10);
    gun.addChild(tail);
    gun.addChild(back);
    gun.addChild(middle);
    gun.addChild(front);
    shape(gun);
    popMatrix();
     
  }
  
  void update()
  {
  }
  
}