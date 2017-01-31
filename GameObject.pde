
abstract class GameObject
{
  PVector pos;
  PVector gravity;
  PVector forward;
  PVector backward;
  
  abstract void render();
  
  abstract void update();
  
}