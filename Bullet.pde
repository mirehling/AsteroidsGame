class Bullet extends Floater
{
 public Bullet(Spaceship theShip){
   myPointDirection = theShip.getPointDirection();
   myCenterX = theShip.getCenterX();
   myCenterY = theShip.getCenterY();
   myXspeed = theShip.getXspeed() + 6*(Math.cos(Math.PI/180*myPointDirection));
   myYspeed = theShip.getYspeed() + 6*(Math.sin(Math.PI/180*myPointDirection));
  
   
 }
  public double getCenterX(){
   return myCenterX; 
  }
  public double getCenterY(){
   return myCenterY; 
  }
  public double getXspeed(){
   return myXspeed; 
  }
  public double getYspeed(){
   return myYspeed; 
  }
  public double getPointDirection(){
   return myPointDirection; 
  }
  void show(){
   noStroke();
   fill(255, 0, 0);
   ellipse((float)myCenterX, (float)myCenterY, 7, 7); 
     
}
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myXspeed and myYspeed       
    myCenterX += myXspeed;    
    myCenterY += myYspeed;     

     
   
  }   
  
  
}

