class Shield extends GameObject implements Powerup
{
  PShape shield;
  PShape side1;
  PShape side2;
  PShape middle;
  
  Shield(float x, float y)
  {
    pos = new PVector(x, y);
    create();
  }
  
  void create()
  {
    shield = createShape(GROUP);
    noStroke();
    fill(222, 198, 16);
    side1 = createShape(ARC, 0, 0, 40, 55, radians(270), radians(450));
    fill(124, 68, 16);
    side2 = createShape(ARC, -20, 0, 40, 55, radians(90), radians(270));
    fill(95, 95, 94);
    middle = createShape(RECT, -20, -20, 20, 50);
    shield.addChild(side1);
    shield.addChild(side2);
    shield.addChild(middle);
  }
  
  void applyTo(Player p)
  {
    p.shield = 600;
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    shape(shield);
    popMatrix();
  }
  
  void update()
  {
    pos.x+=random(-1, 1);
    pos.y+=random(-1, 1);
    
  }
  

}