Particle[] particle;
UFO[] Ship; 

public int myColor;
void setup(){
  size(1000,1000);
  particle = new Particle[1000];
  Ship = new UFO[16];
  for(int i=0;i<particle.length;i++){
    particle[i] = new Particle();
  }
  for(int i=0;i<Ship.length;i++){
    Ship[i] = new UFO();
  }
}
void draw(){
    fill(16);
    rect(0,0,1000,1000);
  for(int i=0;i<particle.length;i++){
    particle[i].move();
    particle[i].show();
    particle[i].Color();
}
  for(int i=0;i<Ship.length;i++){
    Ship[i].Color();
    Ship[i].Smove();
    Ship[i].show();
  }
}
class Particle{
  double myX, myY, mySpeed, myAngle, mySize;
  Particle(){  
    myX = 500;
    myY = 500;
    mySpeed = (Math.random()*100)+2;
    myAngle = Math.random()*TWO_PI;
    mySize = 1.6161616;
  }
  void Color(){
   myColor = color ((int)(Math.random()*235)+20, (int)
   (Math.random()*235)+20, (int)(Math.random()*235)+20);
  }
  void move(){
    myX += mySpeed * Math.cos(myAngle);
    myY += mySpeed * Math.sin(myAngle);
    if((myX >= width-30 || myX <= 0) || myY >= height-30){
    myX = width/2; 
    myY = height/2; 
    mySpeed = (Math.random()*100)+3;
    myAngle = Math.random()*TWO_PI;  
    }
  }
  void show(){
    fill(myColor);
    noStroke();
    ellipse((float)myX,(float)myY, (float)mySize,(float)mySize);
  }
}

class UFO extends Particle{
  double mySize2;
  UFO(){
    myX = (Math.random()*800)+100;
    myY = (Math.random()*800)+100;
    mySpeed = Math.random()*10;
    myAngle = Math.random()*TWO_PI;
    mySize = 30;
    mySize2 = 55;
  }
  void show(){
    noStroke();
    fill(40, 200, 16);
    ellipse((float)myX,(float)myY - 7, (float)mySize,(float)mySize);
    fill(169,169,169);
    ellipse((float)myX,(float)myY, (float)mySize2,(float)mySize);
  }
  void Smove(){
    myX += mySpeed * Math.cos(myAngle);
    myY += mySpeed * Math.sin(myAngle);
    if((myX >= width || myX <= 0) || myY >= height){
    myX = (Math.random()*750)+150; 
    myY = (Math.random()*750)+150; 
    mySpeed = (Math.random()*20)+5;
    myAngle = Math.random()*TWO_PI;
  } 
}
}
