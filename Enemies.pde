class Enemy extends GameObject
{
  float angle;
  PShape body;
  PShape wing1;
  PShape wing2;
  PShape eye1;
  PShape eye2;
  PShape enemy;
  float speed;
  float timeTolive;
  
  Enemy()
  {
  }
  
  Enemy(float x1, float y1, float live, float speed)
  {
    this.speed = speed;
    this.timeTolive = live; 
    pos = new PVector(x1, y1);
    create();
  }
   
  void create()
  {
    enemy = createShape(GROUP);
    fill(0);
    body = createShape(ELLIPSE, 0, 0, 50, 30);
    fill(255,255,255);
    eye1 = createShape(ELLIPSE, -5, -5, 10, 10);
    eye2 = createShape(ELLIPSE, 5, -5, 10, 10);
    wing1 = createShape(LINE, -20, -10, -40, -25);
    wing2 = createShape(LINE, 20, -10, 40, -25);
    enemy.addChild(body);
    enemy.addChild(eye1);
    enemy.addChild(eye2);
    enemy.addChild(wing1);
    enemy.addChild(wing2);
    
  }
  
  void render()
  {
    
    pushMatrix();
    translate(pos.x, pos.y);
    shape(enemy);
    popMatrix();
    
  }
  
  void update()
  {
    
    timeTolive--;
    if(timeTolive < 0)
    {
      gameObjects.remove(this);
    }
    for(int i = 0; i < gameObjects.size(); i++)
    {
      GameObject go = gameObjects.get(i);
      
      if(go instanceof Player)
      {
        Player p = (Player) go;
        angle = atan2(pos.y - p.pos.y, pos.x - p.pos.x)  / PI * 180;
        pos.x = pos.x - cos(angle/180 * PI) * speed;
        pos.y = pos.y - sin(angle/180 * PI) * speed;
      }
      
      if(go instanceof Bullet)
      {
        Bullet b = (Bullet) go;
        
        if(dist(this.pos.x, this.pos.y, go.pos.x, go.pos.y) < 50)
        {
          Blood bl = new Blood(pos.x, pos.y, 120);
          gameObjects.add(bl);
          gameObjects.remove(this);
          gameObjects.remove(go);
          scream.rewind();
          scream.play();
          score+=10;
           
        }
       
      }
    }
       
  }
 
}