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
  
  Blood(float x, float y)
  {
    this.timeTolive = 120;
    pos = new PVector(x, y);
    create();
    
  }
  
  void render()
  {
    
   
  }
  
  void update()
  {
    
    
  }
  
  void create()
  {
    fill(255, 0, 0);

      blood1 = createShape(ELLIPSE, x, y, 30, 30);
      blood2 = createShape(ELLIPSE, x + 15, y + 15, 30, 30);
      blood3 = createShape(ELLIPSE, x - 15, y -15, 30, 30);
      blood4 = createShape(ELLIPSE, x , y -15, 30, 30);
      blood5 = createShape(ELLIPSE, x -15 , y, 30, 30);
      blood6 = createShape(ELLIPSE, x +15 , y, 30, 30);
      blood7  = createShape(ELLIPSE, x +30 , y - 30, 10, 10);
      blood9  = createShape(ELLIPSE, x +40 , y - 20, 10, 10);
      blood10  = createShape(ELLIPSE, x +15 , y - 40, 10, 10);
       
      stain.addChild(blood1);
      stain.addChild(blood2);
      stain.addChild(blood3);
      stain.addChild(blood4);
      stain.addChild(blood5);
      stain.addChild(blood6);
      stain.addChild(blood7);
      stain.addChild(blood9);
      stain.addChild(blood10);
  
  shape(stain);
  
  }
  
}