import processing.sound.*;
SoundFile file;
import processing.video.*;
boolean showCamResolution = true;
Capture cam;
Block myBlock; 
Text myText;
Timer myTimer;
Ball myBall;
Block[] blockList = new Block [15];
int x = 100;
int y = 100;
float updown;
float leftright;
int a;
int mode = 1;
boolean buttonClicked = true;
PImage photo;
PImage photo2;
PImage photo3;


void setup() {
  size(1280, 720);
  background(0);
  //for (int i = 0; i < blockList.length; i ++ ) {
  blockList[0] = new Block(color(255), width/2, height/2, 30, 500);
  blockList[1] = new Block(color(255), width/2-40, height+400, 30, 200);
  blockList[2] = new Block(color(255), width/2+190, height/2+60, 30, 90);
  blockList[3] = new Block(color(255), width/2-200, height/2, 30, 100);
  blockList[4] = new Block(color(255), width/2-100, height/2-50, 30, 100);
  blockList[5] = new Block(color(255), width/2-150, height/2-300, 30, 200);
  blockList[6] = new Block(color(255), width/2-300, height/2-50, 30, 400);
  blockList[7] = new Block(color(255), width/2+300, height/2, 30, 300);
  blockList[8] = new Block(color(255), width/2+150, height/2-100, 30, 100);
  blockList[9] = new Block(color(255), width/2+300, 0, 30, 400);
  blockList[10] = new Block(color(255), width/2+100, height/2-300, 100, 30);
  blockList[11] = new Block(color(255), width/2-400, height/2-300, 100, 30);
  blockList[12] = new Block(color(255), width/2, height/2-200, 100, 30);
  blockList[13] = new Block(color(255), width/2-400, height/2-100, 100, 30);
  blockList[14] = new Block(color(255), width/2-300, height/2-150, 100, 30);
  println(blockList.length);
  //myBlock = new Block(color(255), 10, 10, 10, 10);
  myText = new Text(color(200, 200, 100), 10, 10);
  myTimer = new Timer(7000);
  myBall = new Ball(100, 10, 10, 15);
  myTimer.start();
  updown=10;
      size(1280,720);
    String[] cameras = Capture.list();
     if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  }  
  else {
    println("Available cameras:");    
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
   cam = new Capture(this, cameras[1]);
   cam.start();
  }
  //for (int i = 0; i < balloonList.length; i ++) {
  //  balloonList[i] = new Balloon(color(i*10 % 50, 0, 50), i*110, 100, random(2, 6));
photo = loadImage("confetti.gif");
photo.resize(1280,720);
photo2 = loadImage("balloons.png");
photo.resize(1280,720);
photo3 = loadImage("TEXT.png");
file = new SoundFile(this, "nye.mp3");
  }
  // populate the array of blocks


void draw() {
  if (mode == 1) {
    background(0);
    // This is where all the title screen stuff happens
    if (buttonClicked) {
      myText.display();
      if (myTimer.isFinished()) {
        mode = 2;
        myTimer.start();
      }
      // buttonClicked is not true
      else {
      }
    }
  }
  // About page
  else if (mode == 2) {
    background(102, 100, 151);
    image(photo3, 0, 0);
    //textSize(100);
    //text("press 3 to start", width/2, height/2); 
    //fill(255);
    // This is where all the about page stuff like the
    // text or even an image of the creator
  }
  //for (int i=0; i!=5; ++i){
  //drawMaze((int) random(width,1000), (int) random(height,600));
  //} 
  else if (mode == 3) {
    background(0);

    for (int i = 0; i < blockList.length; i ++ ) {
      blockList[i].display();
    }
    myBall.display();
   

    // do a for loop through your array of blocks
    // check for collision
    //boolean collided = false;

    //for(int i = 0; i < blockList.length; i ++){
    //  if(blockList[i].collided(myBall.x, myBall.y, myBall.r){
    //    mode = 1;  
    //  }
    //}

    // "won the game" by getting to the end
    if ( myBall.x > width ) {
      mode = 4; 
      println("WE SHOULD BE IN MODE 4");
    }
  } 
  
  else if (mode == 4) {
   if (cam.available() == true) {
    cam.read();
  }
  noLoop();
  image(cam, 0, 0);
  cam.stop();
  image(photo, 0, 0);
  image(photo2,100,-100);
  file.play();

  }
  }


void keyPressed() {
  if (key == '1') {
    mode = 1;
  } else if (key == '2') {
    mode = 2;
  } else if (key == '3') {
    mode = 3;
  } else if (key == '4') {
    mode = 4;
  }
}
