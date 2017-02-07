class Menu extends GameObject
{
  
  Menu(float x, float y)
  {
    pos = new PVector(x, y);
  }
  
  void render()
  {
    pushMatrix();
    noStroke();
    fill(0,255,0);
    rect(0,0, width, height/4);
    fill(255,255,0);
    rect(0, height/4, width, height/4);
    fill(0, 0, 255);
    rect(0, height/2, width, height/4);
    fill(255, 0, 0);
    rect(0, height/4*3, width, height/4);
  
    image(img, width/4, imgY, width/2, height/4); 
    
    translate(pos.x, pos.y);
    fill(0);
    rect(0, 0, width/2, height/4);
    //text("Scores", width/3, height/2 + 60, width/2, height/4);
    textFont(font);
    //Button start = new Button(200, 0, 300, 100, "Play Game",  230, 50, 40, color(0), color(0));
    fill(255,255,255);
    textSize(40);
    text("Play Game", 180, 50);
    
    if((mouseX >= pos.x + 180 && mouseX <= pos.x + 380) && (mouseY >= pos.y + 20 && mouseY <= pos.y + 110))
    {
      
      fill(255,255,255);
      ellipse(150, 40, 50, 50);
      fill(0);
      gameObjects.remove(this);
      if(mousePressed == true)
      {
        gameObjects.remove(this);
        gameState = 2;
        
      }
      
    }
    popMatrix();
  }
  
  void update()
  {
  }
  

  
}
  