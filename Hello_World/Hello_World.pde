//Global Variables
ArrayList<PVector> mountain1 = new ArrayList<PVector>();
ArrayList<PVector> mountain2 = new ArrayList<PVector>();
ArrayList<PVector> mountain3 = new ArrayList<PVector>();
float m1y;
float m2y;
float m3y;
float m1s = 100;
float m2s = 50;
float m3s = 25;
int appWidth, appHeight;
float centerX, centerY, xStart, yStart, widthRect, heightRect;
color blackNightMode=#000000, green=#56E510, yellow=#FAFF03, white=#FFFFFF; 
color greenNightMode=#044801, yellowNightMode=#D4D66A;//Hexidecimal
float thin, normal, thick;
Boolean grayScale=false, backgroundColour=false, nightMode=false;
//
void setup() {
   size(1080, 720);
  m1y = height/2;
  m2y = height/4;
  m3y = height/6;
  generate(mountain1, m1y, m1s);
  generate(mountain2, m2y, m2s);
  generate(mountain3, m3y, m3s);
  noStroke();
  //Declaring Display Geometry: landscape, square, portrait
  size(700, 400); //Able to deploy with fullScreen();
  //fullScreen();
  appWidth = width;
  appHeight = height;
  //Concatenation: , or + (i.e space)
  println("\t\t\tWidth="+width, "\tHeight="+height);
  println("Display Monitor:", "\twidth:"+displayWidth, "\theight:"+displayHeight);
  //
  String ls="Landscape or Square", p="portrait", DO="Display Orientation", instruct="Bru, turn your phun";
  //
  if ( appWidth < appHeight ) { //Declaring Landscape & square
    println(instruct);
  } else {
    println("Display: Good to Go");
    if ( appWidth > displayWidth ) { //Fitting CANVAS into Monitor Display
      appWidth=0;
      appHeight=0;
      println("STOP, is broken");
    } else {
      //Empty ELSE
    }
  }
  //Population
  centerX = appWidth * 1/2;
  centerY = height * 1/2;
  xStart = centerX - ( appWidth * 1/4 );
  yStart  = centerY - ( height * 1/4 );
  widthRect = appWidth * 1/2;
  heightRect = height * 1/2;
  thin = appWidth / appWidth; //1
  normal = appWidth * 1/70;
  thick = appWidth * 1/35;
} //End setup
//
void draw() {
   background(100, 200, 255);
  move(mountain1, 4, m1y, m1s);
  move(mountain2, 2, m2y, m2s);
  move(mountain3, 1, m3y, m3s);
  
  fill(0, 100, 50);
  show(mountain3);
  fill(0, 125, 25);
  show(mountain2);
  fill(0, 155, 0);
  show(mountain1);
  // New Background Function "covers" old gray scale background()
  // Night Mode means background cannot have blue // change randome for night mode, hard code "0"
  if ( grayScale == true ) background(100); //Gray Scale (0-255) & Blue Issue for night mode
  //
  //Casting Reminder
  if ( backgroundColour == true ) background( color( random(0 , 255), random(0 , 255), random(0 , 255) ) ); // Colour without blue
  //
  strokeWeight( thick );
  if ( nightMode == true )
  {
    background( blackNightMode );
    stroke( greenNightMode ); 
    fill( yellowNightMode ); 
  } else
  {
    stroke( green ); 
    fill( yellow ); 
  }
  rect(xStart, yStart, widthRect, heightRect);
  fill( white ); //default reset
  stroke( blackNightMode ); //default reset
  strokeWeight(1); //default reset
} //End draw
//
void keyPressed() {
  grayScale = false;
  backgroundColour = false;
  if ( key == 'W' || key == 'w' ) grayScale = true;
  if ( key == 'A' || key == 'a' ) backgroundColour = true;
} //End keyPressed
//
void mousePressed() {
  if ( mouseButton == LEFT ) nightMode = true;
  if ( mouseButton == RIGHT ) nightMode = false;
} //End mousePressed
//
void move(ArrayList<PVector> mountain, float speed, float y, float size) {
  for(int i = 0; i < mountain.size(); i ++) {
    mountain.get(i).x -= speed;
  }
  if(mountain.get(1).x < 0) {
    mountain.remove(0);
  }
  while(mountain.get(mountain.size() - 1).x < width + 2 * size) {
    mountain.add(new PVector(mountain.get(mountain.size() - 1).x + size + random(-size/2, size/2), y + random(-size, size)));
  }
}
void generate(ArrayList<PVector> mountain, float y, float size) {
  mountain.add(new PVector(0, y + random(-size, size)));
  while(mountain.get(mountain.size() - 1).x < width) {
    mountain.add(new PVector(mountain.get(mountain.size() - 1).x + size + random(-size/2, size/2), y + random(-size, size)));
  }
}

void show(ArrayList<PVector> mountain) {
  beginShape();
  vertex(width, height);
  vertex(0, height);
  for(int i = 0; i < mountain.size(); i ++) {
    vertex(mountain.get(i).x, mountain.get(i).y);
  }
  endShape(CLOSE);
}
// End Main Program
