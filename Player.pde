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