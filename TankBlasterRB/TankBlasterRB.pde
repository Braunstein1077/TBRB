//TANK BLASTER: REBLASTERED

import java.util.HashSet;
import java.util.List;

final float noise_scale = 0.003f;

PImage terrain;

void generateTerrain() {
  noiseSeed(millis());
  
  terrain = createImage(width, height, ARGB);
  terrain.loadPixels();
  for (int x=0; x<width; ++x) {
    // Determine terrain height at this point
    float altitude = map(noise(x*noise_scale), 0, 1, 0.2f*height, 0.8f*height);
    // Fill in terrain up to this height
    setTerrainHeight(x, altitude);
  }
  terrain.updatePixels();
}

void setTerrainHeight(int x, float altitude) {
  // Fill pixels above with empty space
  for (int y=0; y<(int)altitude; ++y) {
    terrain.pixels[x + y*terrain.width] = #7877C1;
  }
  
  // Fill pixels below with ground
  for (int y=(int)altitude; y<height; ++y) {
    terrain.pixels[x + y*terrain.width] = #869360;
  }
}


void setup() {
 size(1920, 1080);
 generateTerrain();
}

void draw() {
  image(terrain, 0, 0);
}
