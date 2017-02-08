class Level extends GameObject
{

  PShape clouds;
  PShape cloud1;
  PShape cloud2;
  PShape cloud3;
  PShape cloud4;
  PShape cloud5;
  int timeTolive;
  int direction;
  
  Level()
  {
    timeTolive = 300;
    direction = (int) random(0, 1);
  }
  
  void render()
  {
     pushMatrix();
     translate(pos.x, pos.y);
     clouds = createShape(GROUP);
    fill(237,237,237);
    noStroke();
    cloud1 = createShape(ELLIPSE, 0, 0, 80, 80);
    cloud2 = createShape(ELLIPSE, 0, 40, 80, 80);
    cloud3 = createShape(ELLIPSE,  40, 0, 80, 80);
    cloud4 = createShape(ELLIPSE, 0, -40, 80, 80);
    cloud5 = createShape(ELLIPSE, -40, 0, 80, 80);
    clouds.addChild(cloud1);
    clouds.addChild(cloud2);
    clouds.addChild(cloud3);
    clouds.addChild(cloud4);
    clouds.addChild(cloud5);
     shape(clouds);
     stroke(0);
    popMatrix();
  }
  
  void update()
  {
    timeTolive--;
    if(timeTolive < 0)
    {
      gameObjects.remove(this);
    }

    pos.x-=1;
    
  }
  
}