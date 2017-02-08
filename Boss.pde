class Boss extends GameObject
{
  PShape bot;
  PShape head;
  PShape body;
  PShape gunner;
  PShape board;
  int health;
  float theta;
  float bMass;
  
  Boss(float x, float y, int health, float theta)
  {
    this.health = health;
    this.theta = theta;
    this.bMass = mass;
    pos = new PVector(x, y);
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
    gunner = createShape(RECT, -40, 20, 30, 10);
    fill(0, 0, 255);
    board = createShape(RECT, -35, 60, 80, 30);
    bot.addChild(head);
    bot.addChild(body);
    bot.addChild(gunner);
    bot.addChild(board);
    
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    shape(bot);
    popMatrix();
  }
  
  void update()
  {
    /*if(pos.x > 300)
    {
       
      pVelocity.add(acceleration);
      forward.add(pVelocity);
      pos.add(PVector.mult(forward, -1));
      theta+=.2f;
      
    }
    
    if(pos.x < 50)
    {
      pVelocity.add(acceleration);
      forward.add(pVelocity);
      pos.add(forward);
      theta-=.2f;
     
      
      
    }*/



    
  }
  
}