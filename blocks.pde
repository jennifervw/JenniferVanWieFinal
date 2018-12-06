class Block {
  color c;
  float x;
  float y;
  float blockWidth;
  float blockHeight;
  //float lastx_pos;
  //float x_pos;

  Block(color tempC, float tempX, float tempY, float bWidth, float bHeight) {
    c =  color (255);
    x = tempX;
    y = tempY;
    blockWidth = bWidth;
    blockHeight = bHeight;
    //x_pos = lastx_pos + random(100,600);
  }

  void display() {  
    fill(255);
    rect(x, y, blockWidth, blockHeight);
    //rect(x-40, y-400, 30, 200);
    //rect(x+190, y+60, 30, 90);
    //rect(x-200, y, 30, 100);
    //rect(x-100, y-50, 30, 100);
    //rect(x-150, y-300, 30, 200);
    //rect(x-300, y-50, 30, 300);
  }

  boolean collided(float ballx, float bally, float ballradius) {
    // compare the ball's current position and its radius to
    // the boundaries of your block to see if collided

    //if(the thing is collided)
    //{
    //  return true;
    //}
    //else{
    //  return false; 
    //}

    // placeholder
    return false;
  }
}