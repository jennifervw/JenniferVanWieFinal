class Text {
  color c;
  String message = "LOADING              LOADING";
  PFont f;
  float r;
  float theta_offset;

  Text(color tempC, float tempR, float tempTheta_offset) {
    c = color (200, 200, 100);
    r = 100;
    theta_offset = 0;
  }

  void display() {  
    f = createFont("Georgia", 40, true);
    textFont(f);
    // The text must be centered!
    textAlign(CENTER);
    smooth();
    background(0);
    translate(width / 2, height / 2);
    noFill();
    stroke(0);
    ellipse(0, 0, r*2, r*2);
    float arclength = 0;
    // For every box
    for (int i = 0; i < message.length(); i++)
    {
      // Instead of a constant width, we check the width of each character.
      char currentChar = message.charAt(i);
      float w = textWidth(currentChar);

      // Each box is centered so we move half the width
      arclength += w/2;
      // Angle in radians is the arclength divided by the radius
      // Starting on the left side of the circle by adding PI
      float theta = PI + arclength / r;    

      pushMatrix();
      // Polar to cartesian coordinate conversion
      translate(r*cos(theta+theta_offset), r*sin(theta+theta_offset));
      // Rotate the box
      rotate(theta+PI/2+theta_offset); // rotation is offset by 90 degrees
      // Display the character
      fill(255);
      text(currentChar, 0, 0);
      popMatrix();
      // Move halfway again
      arclength += w/2;
    }
    theta_offset = theta_offset + 0.03;
  }
}