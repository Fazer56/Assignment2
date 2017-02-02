class JetPack extends GameObject implements Powerup
{
  PShape gun;
  PShape back;
  PShape middle;
  PShape front;
  PShape tail;
  PShape tail1;
   int timeTolive;
  
  JetPack()
  {
    timeTolive = 300;
  }
  
  void applyTo(Player p)
  {
    p.pos.y--;
    if(pos.y > height - 500)
    {
      pos.y = height - 500;
      
    }
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    gun = createShape(GROUP);
    fill(255, 0, 0);
    back = createShape(TRIANGLE, 0, 0, 15, 15, -15, 15);
    fill(255,255,255);
    middle = createShape(RECT, -15, -30, 30, 30);
    /*fill(255, 0, 0);
    front = createShape(ELLIPSE, 80, 60, 20, 15);
    fill(255, 150, 0);*/
    tail = createShape();
    tail.beginShape();
    tail.strokeWeight(8);
    tail.stroke(255, 150, 0);
    tail.vertex(-10, 15);
    tail.vertex(-10, 20);
    tail.endShape(CLOSE);
    tail1 = createShape();
    tail1.beginShape();
    tail1.strokeWeight(8);
    tail1.stroke(255, 150, 0);
    tail1.vertex(10, 15);
    tail1.vertex(10, 20);
    tail1.endShape(CLOSE);
    gun.addChild(tail1);
    gun.addChild(tail);
    gun.addChild(back);
    gun.addChild(middle);
    shape(gun);
    popMatrix();

  }
  
  void update()
  {
    strokeWeight(6);
    stroke(255, 150, 0);
    line(pos.x -10, pos.y + 15, pos.x-10, pos.y + 20);
    line(pos.x +10, pos.y + 15, pos.x + 10, pos.y + 20);
    
    pos.x+=random(-2, 2);
    pos.y+=random(-2, 2);
    timeTolive--;
    if(timeTolive < 0)
    {
      gameObjects.remove(this);
      
    }
    stroke(0);
    strokeWeight(3);
  }
  
}