//Global Variables
Boolean nightMode=false, ahhh=false;
//
void setup() {}//End setup
//
void draw() {
  if ( nightMode==true ) println("I am nocturnal.");
  if ( nightMode==false ) println("");
  if ( ahhh == true ) println("Where is that mouse-wheel button");
}//End draw
//
void keyPressed() {}//End keyPressed
//
void mousePressed() {
  if ( mouseButton == LEFT ) nightMode=true;
  if ( mouseButton == RIGHT ) nightMode=false;
}//End mousePressed
//
//End Main Program
