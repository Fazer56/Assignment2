class Menu extends GameObject
{
  
  Menu()
  {
  }
  
  void render()
  {
  
      fill(0);
      rect(width/4, height/2, width/2, height/4);
      /*fill(255,255,255);
      textSize(40);
     // text("Play Game", width/3, height/2, width/2, height/4);*/
      text("Scores", width/3, height/2 + 60, width/2, height/4);
      textFont(font);
      Button start = new Button(width/2.5, height/2, 300, 100, "Play Game", width/2.5 + 30, height/2 + 50, 40, color(0), color(0));
      
      start.drawButton();
      
      if((mouseX >= start.x && mouseX <= start.x + start.recW) && (mouseY >= start.y && mouseY <= start.y + start.recH))
      {
        fill(255,255,255);
        ellipse(width/2.5 - 10, height/2 + 40, 50, 50);
        fill(0);
        if(mousePressed == true)
        {
          gameObjects.remove(this);
          gameState = 2;
          
          
        }
        
      }
      
    
  }
  
  void update()
  {
  }
  

  
}
  