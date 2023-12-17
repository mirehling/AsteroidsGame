Spaceship m = new Spaceship();
ArrayList <Asteroid> asteroids = new ArrayList <Asteroid>();
ArrayList <Bullet> bullets = new ArrayList <Bullet>();


public void setup() 
{
  for(int i = 0; i < 8; i++){
    asteroids.add(new Asteroid());
  }
  size(500, 500);
  background(150);
}
public void draw() 
{
  background(0);
  m.show();
  m.myCenterX = m.myCenterX + m.myXspeed;
  m.myCenterY = m.myCenterY + m.myYspeed;
  if(m.myCenterX > 500){
    m.myCenterX = 0;
  }
  if(m.myCenterX < 0){
   m.myCenterX = 500; 
  }
  if(m.myCenterY > 500){
   m.myCenterY = 0; 
  }
  if(m.myCenterY < 0){
   m.myCenterY = 500; 
  }
  for(int i = 0; i < asteroids.size(); i++){
   Asteroid a = asteroids.get(i); 
   a.show();
   a.move();
   if(dist((float)a.getCenterX(), (float)a.getCenterY(), (float)m.myCenterX, (float)m.myCenterY) < 20){
     asteroids.remove(i);
   }
  }
  for(int i = 0; i < bullets.size(); i++){
   Bullet b = bullets.get(i); 
   b.show();
   if(b.getCenterX() > 500 || b.getCenterX()<0 || b.getCenterY() > 500 || b.getCenterY() < 0){     
      bullets.remove(i);    
    }  
    b.move();
   for(int j = 0; j < asteroids.size(); j++){
     Asteroid a = asteroids.get(j);
     if(dist((float)b.getCenterX(), (float)b.getCenterY(), (float)a.getCenterX(), (float)a.getCenterY()) < 20){
       asteroids.remove(j);
       bullets.remove(i);
   }
   }
  }
}
public void keyPressed(){
  if(key == 'a'){
   m.myPointDirection = m.myPointDirection - 15; 
  }
  if(key == 'd'){
   m.myPointDirection = m.myPointDirection + 15; 
  }
  if(key == 'w'){
   m.myXspeed = m.myXspeed + 0.3*Math.cos(m.myPointDirection*Math.PI/180);
   m.myYspeed = m.myYspeed + 0.3*Math.sin(m.myPointDirection*Math.PI/180);
  }
  if(key == 'f'){
   m.myXspeed = 0;
   m.myYspeed = 0;
   m.myCenterX = (Math.random()*500);
   m.myCenterY = (Math.random()*500);
  }
  if(key == ' '){
   bullets.add(new Bullet(m)); 
  }
  
}
