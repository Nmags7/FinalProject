import gab.opencv.*;
import java.awt.Rectangle;
import java.util.Queue;
import processing.video.*;
Capture video;
import java.util.LinkedList;

OpenCV opencv;
Rectangle[] faces;
Queue<PImage> masks;
PImage WarMachine;
PImage IronMan;
PImage SpiderMan;
PImage StarLord;
PImage BlackPanther;
void setup() {

  video = new Capture(this, 640, 360, 30);
  video.start();
  size(640, 360);
  printArray(Capture.list());
  masks=new LinkedList<PImage>();
  WarMachine=loadImage("WarMachine.png");
  BlackPanther=loadImage("BlackPanther.png");
  StarLord=loadImage("StarLord.png");
  IronMan=loadImage("IronMan.png");
  SpiderMan=loadImage("SpiderMan.png");
  masks.offer(WarMachine);
  masks.offer(BlackPanther);
  masks.offer(IronMan);
  masks.offer(StarLord);
  masks.offer(SpiderMan);
  //frameRate(12);
}

void captureEvent(Capture video){
  video.read();
}

void draw() {
  opencv = new OpenCV(this, video);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE); 
  
  faces = opencv.detect();
  
  image(opencv.getInput(), 0, 0);
  //image(video, 0, 0);

  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  for (int i = 0; i < faces.length; i++) {
    //rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
    image(masks.peek(), faces[i].x, faces[i].y);
    masks.peek().resize(faces[i].width, faces[i].height);
  }
}

void mouseClicked(){
  PImage temp=masks.remove();
  masks.offer(temp);
}