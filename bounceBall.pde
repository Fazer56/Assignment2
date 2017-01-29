float speed = 0;
float x = 0;
float y = height/4;
float mass = 100;
float gravity = 0.01 * mass;
float velocity = 0;
int count = 0;

void bounceBall()
{
  
  fill(random(255));
  ellipse(x, y, mass, mass);
  
  y = y + speed;
  x = x + velocity;
  
  speed = gravity + speed;
  velocity+=0.0001 * mass;
  
  if(y > height/2-(mass/2))
  {
    speed = speed * -0.87;
    y = height/2-(mass/2);
    count++;
    if(count > 7)
    {
      speed = speed * -0.70;
      gameState = 1;
      
    }
  }
  
  if(x > width/4-(mass/2))
  {
    x = width/4-(mass/2);
  } 
}