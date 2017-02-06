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
    rect(0, 0, 40, 40);
    popMatrix();
    
  }
  
  void update()
  {
    pos.x = pos.x - cos(angle/180 * PI) * 2;
    pos.y = pos.y - sin(angle/180 * PI) * 2;
    
    for(int i = 0; i < gameObjects.size(); i++)
    {
      GameObject go = gameObjects.get(i);
      
      if(go instanceof Bullet)
      {
        Bullet b = (Bullet) go;
        if(dist(this.pos.x, this.pos.y, go.pos.x, go.pos.y) < 50)
        {
          gameObjects.remove(this);
        
        }
      }
    }
       
  }
 
}