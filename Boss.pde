class Boss extends GameObject
{
  PShape bot;
  PShape head;
  PShape body;
  PShape gunner;
  PShape board;
  PShape eye1;
  PShape eye2;
  int health;
  float theta;
  float bMass;
  PVector pVelocity;
  PVector acceleration;
  Boolean upDown = false;
  
  Boss(float x, float y, int health, float theta)
  {
    this.health = health;
    this.theta = theta;
    this.bMass = mass;
    pos = new PVector(x, y);
    forward = new PVector(0, 4);
    acceleration = new PVector(0, 0);
    pVelocity = new PVector(0, 0);
    create();
    
  }
  
 /* Boss(float x, float y, float mass)
  {
    this(x, y, 1, 0, 0, mass, ' ', ' ', ' ', ' ', ' ' );
    create();
  } */
  
  void create()
  {
    bot = createShape(GROUP);
    fill(0);
    head = createShape(ELLIPSE, 0, 0, 70, 40);
    body = createShape(ELLIPSE, 0, 40, 70, 40);
    fill(255,0,0);
    gunner = createShape(RECT, -50, 20, 40, 15);
    fill(random(200, 255),0,0);
    eye1 = createShape(ELLIPSE, -10, -5, 10, 10);
    eye2 = createShape(ELLIPSE, 10, -5, 10, 10);
    fill(0, 0, 255);
    board = createShape(RECT, -35, 60, 80, 30);
    bot.addChild(head);
    bot.addChild(body);
    bot.addChild(gunner);
    bot.addChild(board);
    bot.addChild(eye1);
    bot.addChild(eye2);
    
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    noFill();
    rect(-50, -70, 100, 20);
    fill(255,0,0);
    rect(-50, -70, health, 20);
    shape(bot);
    popMatrix();
  }
  
  void update()
  {
    
    
    if(upDown == false)
    {
         
      pVelocity.add(acceleration);
      forward.add(pVelocity);
      pos.add(PVector.mult(forward, -1));
      theta+=.2f;
      
      if(pos.y < 50)
      {
        upDown = true;
      }
        
    }
    else
    {
      pVelocity.add(acceleration);
      forward.add(pVelocity);
      pos.add(forward);
      theta-=.2f;
      
      if(pos.y > height - 250)
      {
        upDown = false;
      }
      
    }
    
    for(int i = 0; i < gameObjects.size(); i++)
    {
      GameObject go = gameObjects.get(i);
      if(go instanceof Bullet)
      {
        if(dist(this.pos.x, this.pos.y, go.pos.x, go.pos.y) < 80)
        {
          gameObjects.remove(go);
          health-=20;
          
        }
      }
      
    }//end gameObjects for()
    
    if(health < 0)
    {
      Blood bl = new Blood(pos.x, pos.y, 120);
      Blood bl2 = new Blood(pos.x + 40, pos.y, 120);
      dead.rewind();
      dead.play();
      gameObjects.add(bl);
      gameObjects.add(bl2);
      gameObjects.remove(this);
      winning.rewind();
      winning.play();

      
      
    }

  }//end update
  
}