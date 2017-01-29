class Button
{
  float x ;
  float y ;
  float rectX;
  float rectY;
  float recW;
  float recH;
  String option;
  float txtSize;
  float txtX;
  float txtY;
  color c;
  color hover;
  
  //default constructors
  Button()
  {   
  }
  
  //paremeterised constructor  
  Button(float x, float y, float bWidth, float bHeight, String bName, float txX, float txY, float txt, color c, color hov)
  {
    this.x = x;
    this.y = y;
    this.recW = bWidth;
    this.recH = bHeight;
    this.option = bName;
    this.txtX = txX;
    this.txtY = txY;
    this.txtSize = txt;
    this.c = c;
    this.hover = hov;
    
    drawButton();
  }
  
  void drawButton()
  {
    noStroke();
    //stroke(0,255,255);
    fill(c);
    rect(x, y, recW, recH);
    textSize(txtSize);
    fill(255,255,255);
    text(option, txtX, txtY);
     
    if((mouseX >= x && mouseX <= x + recW) && (mouseY >= y && mouseY <= y + recH))
    {
      fill(hover);
      rect(x, y, recW, recH);
      textSize(txtSize);
      fill(255,255,255);
      text(option, txtX, txtY);
    }
        
  }
  
}