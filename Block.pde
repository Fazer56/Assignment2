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
    stroke(0);
    fill(0,255,0);
    rect(0, 0, blockW, blockH);
    fill(152,89,60);
    rect(0, blockH, blockW, blockH);
    popMatrix();
    
  }
  
  void update()
  {
        
  }
  
  
}