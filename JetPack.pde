class JetPack extends GameObject
{
  PShape gun;
  PShape back;
  PShape middle;
  PShape front;
  PShape tail;
  PShape tail1;
  
  void render()
  {

  }
  
  void update()
  {
    strokeWeight(6);
    stroke(255, 150, 0);
    line(pos.x -10, pos.y + 15, pos.x-10, pos.y + 20);
    line(pos.x +10, pos.y + 15, pos.x + 10, pos.y + 20);
    stroke(0);
    strokeWeight(3);
  }
  
}