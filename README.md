# Marvel Mask Snap Filters
This project uses the OpenCV Library to establish a live feed, using the camera in one's computer. It uses a form of blob detection for facial recognition. Instead of simply recognizing faces, we decided to make mock snapchat filters, specifically five Masked Marvel Characters. 
## Difficulties or opportunities you encountered along the way.
Learning to navigate and successfully use the OpenCV library was the most difficult part of this project. After learning various data structures all year, the library seemed extremely foreign, and hard to conceptualize. 
## Most interesting piece of your code and explanation for what it does.
``` 
void mouseClicked(){
  PImage temp=masks.remove();
  masks.offer(temp);
 }
```
#### This code is a simple way to take advantage of both our knowledge of processing, and our understanding of a queue. To make multiple filters availible, we stored various png files in a queue (called masks). Rather than parsing through the queue, we simply called the head in draw(), and made the queue dynamic via mouseClicked(). Each time the user clicks, the head is stored and removed, and then placed at the tail.
