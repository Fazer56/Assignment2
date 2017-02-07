class Menu extends GameObject
{
  
  Menu(float x, float y)
  {
    pos = new PVector(x, y);
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    fill(0);
    rect(0, 0, width/2, height/4);
    //text("Scores", width/3, height/2 + 60, width/2, height/4);
    textFont(font);
    Button start = new Button(200, 0, 300, 100, "Play Game",  230, 50, 40, color(0), color(0));
    
    if((mouseX >= start.x && mouseX <= start.x + start.recW) && (mouseY >= start.y && mouseY <= start.y + start.recH))
    {
      println("piss");
      fill(255,255,255);
      ellipse(220, 40, 50, 50);
      fill(0);
      gameObjects.remove(this);
      if(mousePressed == true)
      {
        gameState = 2; 
      }
      
    }
    popMatrix();
  }
  
  void update()
  {
  }
  

  
}
  