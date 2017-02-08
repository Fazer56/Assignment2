class Boss extends GameObject
{
  PShape bot;
  PShape head;
  PShape body;
  int health;
  float theta;
  float bMass;
  
  Boss(float x, float y, int health, float theta, float mass)
  {
    this.health = health;
    this.theta = theta;
    this.bMass = mass;
    pos = new PVector(x, y);
  }
  
 /* Boss(float x, float y, float mass)
  {
    this(x, y, 1, 0, 0, mass, ' ', ' ', ' ', ' ', ' ' );
    create();
  } */
  
  void create()
  {
    bot = createShape(GROUP);
    head = createShape(ELLIPSE, 0, 0, 40, 40);
    body = createShape(ELLIPSE, 0, 40, 40, 40);
    
    bot.addChild(head);
    bot.addChild(body);
    
    
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