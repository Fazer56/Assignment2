class Gun extends GameObject
{
  
  float theta;
  
  Gun()
  {
  }
  
  void applyTo(Player p)
  {
    p.gun();
    
  }
  
  void render()
  {
    pushMatrix();
    translate();
    popMatrix();
   
  }
  
  void update()
  {
  }
  
}