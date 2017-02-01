class Gun extends GameObject implements Powerup
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
    //p.gun();
    
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    gun = createShape(GROUP);
    fill(0);
    back = createShape(TRIANGLE, 0, 0, -15, 15, -15, -15);
    fill(255,255,255);
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
    /*for(int i = 0 ; i < gameObjects.size() ; i ++)
    {
      GameObject go = gameObjects.get(i);
      if(go instanceof Player)
      {
       
        
       
      }
      
    }*/
    
  }
  
}