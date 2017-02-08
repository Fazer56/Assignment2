//blood class
class Blood extends GameObject
{
 
  PShape blood1;
  PShape blood2;
  PShape blood3;
  PShape blood4;
  PShape blood5;
  PShape blood6;
  PShape blood7;
  PShape blood9;
  PShape blood10;
  PShape stain;
  float timeTolive;
  
  Blood(float x, float y, float live)
  {
    this.timeTolive = live;
    pos = new PVector(x, y);
    create();
    
  }
  
  void create()
  {
      fill(255, 0, 0);
      noStroke();
      stain = createShape(GROUP);
      blood1 = createShape(ELLIPSE, 0, 0, 30, 30);
      blood2 = createShape(ELLIPSE, 15, 15, 30, 30);
      blood3 = createShape(ELLIPSE, -15, -15, 30, 30);
      blood4 = createShape(ELLIPSE, 0 , -15, 30, 30);
      blood5 = createShape(ELLIPSE, -15 , 0, 30, 30);
      blood6 = createShape(ELLIPSE, 15 , 0, 30, 30);
      blood7  = createShape(ELLIPSE,  30 , -30, 10, 10);
      blood9  = createShape(ELLIPSE, 40 , -20, 10, 10);
      blood10  = createShape(ELLIPSE,  15 , -40, 10, 10);
       
      stain.addChild(blood1);
      stain.addChild(blood2);
      stain.addChild(blood3);
      stain.addChild(blood4);
      stain.addChild(blood5);
      stain.addChild(blood6);
      stain.addChild(blood7);
      stain.addChild(blood9);
      stain.addChild(blood10);
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    shape(stain);
    popMatrix();
   
  }
  
  void update()
  {
    timeTolive--;
    if(timeTolive > 60)
    {
      fill(255, 255, 255);
      textSize(25);
      textFont(font2);
      text(" + 10", pos.x + 10 , pos.y + 30);
      
      
    }
    if(timeTolive < 0)
    {
      gameObjects.remove(this);
      
    }
    
  }
}