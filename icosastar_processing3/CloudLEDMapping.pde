import java.util.List;

// polar2cart() 
//   Defined in LEDMapping.java
//   Converts (r, theta) to [x, y]

int PX_PER_RADIAL = 64;
int NUM_RADIALS = 8;

// bass are so close they overlap
int NUM_BASS = 1;

// Theta between radials
float RADIAL_OFFSET_THETA = 2 * PI / NUM_RADIALS;

public class CloudVertex {
  float x;
  float y;
  float[] xy;
  
  List<CloudVertex> adjacents = new ArrayList();
  
  CloudVertex(float[] xy) {
    this.x = xy[0];
    this.y = xy[1];
    this.xy = xy;
  }
  
  public void addAdjacent(CloudVertex adjacent) {
    this.adjacents.add(adjacent);
    adjacent.adjacents.add(this);
  }
}

public class CloudLEDMapping {
  
  OPC opc;
  IcosaVertex kicks[] = new IcosaVertex[NUM_BASS];
  IcosaVertex snares[] = new IcosaVertex[NUM_RADIALS];
  IcosaVertex hihats[] = new IcosaVertex[NUM_RADIALS];
  
    

  // Call this after all other classes have registerDraw()'d
  void registerDraw(PApplet parent) {
    //registerMethod("draw", this);
    
    // Initialize pixel mappings
    opc = new OPC(parent, "127.0.0.1", 7890);
    
    float stripLengthPx = width*4/9;
    
    PVector center = new PVector(0, 0);
    PVector radialCenter = new PVector(width/4,0);
    PVector bassCenter = new PVector(0,0);
    PVector hihatCenter = new PVector(width*4/9 + 30, 0);
    
    float theta = 0;
    int ledI = 0;
    for (int i = 0; i < NUM_RADIALS; i++) {
      
      opc.ledStrip(ledI, PX_PER_RADIAL, width/2.0 + radialCenter.x, height/2.0 + radialCenter.y, stripLengthPx / PX_PER_RADIAL, theta, false);
      
      PVector bass = PVector.add(center, bassCenter);
      if (i < NUM_BASS) {
        kicks[i] = new IcosaVertex(new float[] {bass.x, bass.y});
      }
      
      PVector snare = PVector.add(center, radialCenter);
      snares[i] = new IcosaVertex(new float[] {snare.x, snare.y});
      
      PVector hihat = PVector.add(center, hihatCenter);
      hihats[i] = new IcosaVertex(new float[] {hihat.x, hihat.y});
      
      ledI += PX_PER_RADIAL;
      
      theta += RADIAL_OFFSET_THETA;
      
      radialCenter.rotate(RADIAL_OFFSET_THETA);
      bassCenter.rotate(RADIAL_OFFSET_THETA);
      hihatCenter.rotate(RADIAL_OFFSET_THETA);
    }
      
  }
  
}