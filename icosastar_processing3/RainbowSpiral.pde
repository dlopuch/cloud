float MAX_RADIUS = 130; // ring2 radius
float GAIN = 1;

public class RainbowSpiral {
  float theta = 0;
  float colour = 0;
  
  float rInc = 1;
  float thetaInc = 0.1;
  float colourInc = 1;
  float size = 65;
  
  float colorRotate = 0;
  float colorRotateInc = 5;
  
  
  RainbowSpiral(PApplet parent) {
    registerMethod("draw", this);
  }
  
  void draw() {
    float r = 0;
    
    float theta = this.theta;
    float colour = this.colour;
    
    noStroke();
    
    while (r < MAX_RADIUS) {
      colorMode(HSB, 100);
      fill(colour, 100, 50);
      float[] xy = polar2cart(r, theta);
      ellipse(
        xy[0], 
        xy[1],
        this.size,
        this.size
      );
      
      r += GAIN * this.rInc;
      theta += this.thetaInc;
      colour = (colour + this.colourInc + this.colorRotate) % 100;
    }
    
    this.theta += this.thetaInc;
    this.colorRotate = (this.colorRotate + this.colorRotateInc) % 100;
    
  }
}