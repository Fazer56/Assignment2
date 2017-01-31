class Player extends GameObject
{
  PVector jump;
  int lives;
  PVector pGravity;
  PVector acceleration;
  PVector pVelocity;
  float pMass;
  PVector pos;
  PShape pod;
  PShape ship;
  PShape head;
  PShape wheel1;
  PShape wheel2;
  PShape body;
  PShape leg;
  PShape gun;
  PShape lights;
  PShape box;
  char up, down, left, right, fire;
  
  Player(float x, float y, int lives, float mass, char up, char down, char left, char right, char fire)
  {
    this.pMass = mass;
    this.lives = lives;
    this.up = up;
    this.down = down;
    this.left = left;
    this.right = right;
    this.fire = fire;
    pos = new PVector(x, y);
    jump = new PVector(0, -5*mass); //powerup will multiply mass by 3!
    pGravity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    pVelocity = new PVector(0, 0);
    create();
  }
  
  void create()
  {
      ship = createShape(GROUP);
      fill(255, 0, 0);
      pod = createShape(ELLIPSE, 0, 0, 80, 80);
      fill(0);
      head = createShape(ARC, 5, - 5, 55, 55, radians(270), radians(360));
      box = createShape(RECT, -78, -10, 40, 10);
      noFill();
      wheel1 = createShape(ELLIPSE, -20,  40, 30, 30);
      wheel2 = createShape(ELLIPSE, 20,  40, 30, 30);
      ship.addChild(box);
      ship.addChild(pod);
      ship.addChild(head);
      ship.addChild(wheel1);
      ship.addChild(wheel2); 
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    shape(ship);
    
    popMatrix();
    
  }
  
  //Using newtons second law to apply force
  
  void update()
  {
    
    
  }
  
}