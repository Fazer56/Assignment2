class Winning extends GameObject
{
  float timeTolive;
  
  Winning(float x, float y, float live)
  {
    this.timeTolive = live;
    pos = new PVector(x, y);
  }
   
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    fill(255,255,255);
    rect( 200, -200, 500, 500);
    textFont(font);
    textSize(40);
    fill(random(255),random(255),random(255));
    text("WELL DONE\n\nYOU DEFEATED\n\nTHE BOSS!!", 300, -100);
    text("SCORE : " + score2, 300, 100);
    popMatrix();
    
  }
  
  void update()
  {
    timeTolive--;
    gameOver--;
    
    if(timeTolive < 0)
    {
      gameObjects.remove(this);
    }
    
  }
}