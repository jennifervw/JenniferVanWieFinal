class Ball {
  color c;
  float x;
  float y;
  float r;
  //float lastx_pos;
  //float x_pos;

  Ball(color tempC, float tempX, float tempY, float tempR) {
    c =  color (255);
    x = tempX;
    y = tempY;
    r = tempR;
    //x_pos = lastx_pos + random(100,600);
  }

  void display() {
    fill(200, 100, 255);
    ellipse(x, y, r*2, r*2);
    if (keyPressed==true) {
      if (key=='a') {
        x=x-5;
      }
      if (key=='d') {
        x=x+5;
      }
      if (key=='w') {
        y=y-5;
      }
      if (key=='s') {
        y=y+5;
      }
    }
  }
}
