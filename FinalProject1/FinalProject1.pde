import gab.opencv.*;
import java.awt.Rectangle;
import java.util.Stack;
import processing.video.*;
Capture video;

OpenCV opencv;
Rectangle[] faces;

void setup() {

  video = new Capture(this, 640, 360, 30);
  video.start();
  size(640, 360);
  printArray(Capture.list());
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
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
  }
}