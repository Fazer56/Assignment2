class Block extends GameObject
{
  
  float blockW;
  float blockH;
  
  Block()
  {
  }
  
  Block(float x, float y, float bW, float bH)
  {
    this.blockW = bW;
    this.blockH = bH;
    pos = new PVector(x, y);
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    fill(0,255,0);
    rect(0, 0, blockW, blockH);
    popMatrix();
    
  }
  
  void update()
  {
    
    for(int i = 0; i < gameObjects.size(); i++)
    {
      GameObject go = gameObjects.get(i);
      if(go instanceof Block)
      {
        
      }
       
    }
    
  }
  
  
}