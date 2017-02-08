class GameOver extends GameObject
{
  float timeTolive;
 
  GameOver(float x, float y, float live)
  {
    this.timeTolive = live;
    pos = new PVector(x, y);
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    fill(0);
    rect(0, 0, width, height);
    textSize(40);
    fill(255,255,255);
    text("GAME OVER!", 300, 300);
    popMatrix();
  }
  
  void update()
  {
    timeTolive--;
    
    if(timeTolive < 0)
    {
      gameObjects.remove(this);
    }
    
  }
}