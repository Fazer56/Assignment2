class Instructions
{
  String jump;
  String right;
  String left;
  String shoot;
  //String aim;
  
  
  Instructions(String line)
  {
    String[] parts = line.split("\t");
    jump = parts[0];
    right = parts[1];
    left = parts[2];
    shoot = parts[3];
   // aim = parts[4];
  }
  
  Instructions()
  {
    
  }
  
  Instructions(String j, String r, String l, String s, String aim/*, float x, float y*/)
  {
    this.jump = j;
    this.right = r;
    this.left = l;
    this.shoot = s;
   // this.aim = aim;
   // pos = new PVector(x, y);
    
    instruction();
  }
  
  void instruction()
  {
    fill(255,255,255);
    textFont(font);
    textSize(35);
    text("Game Instructions", 0, 0);
    textSize(25);
    text("\nTo Jump: " + jump, 0, 100);
    text("\nTo move Forward: " + right, 0, 200);
    text("\nTo move Left: " + left, 0, 300);
   // text("\nAim with: " + aim, 0, 400);
    
  }
  
 /* void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    popMatrix();
  }
  
  void update()
  {
    
  }
  */
  String toString()
  {
   
    return jump + "\t"
          + right
          + "\t"
          + left
          + "\t"
          + shoot
          + "\t" ;
         // + aim;
    
  }
  
}


void loadInstructions()
{
  for(TableRow row : table.rows())
  {
    println("yo");
    Instructions i = new Instructions();
    
    i.jump = row.getString("jump");
    i.right = row.getString("right");
    i.left = row.getString("left");
    i.shoot = row.getString("shoot");
    //i.aim = row.getString("aim");
    
    insts.add(i);
   
    
  }
  
}