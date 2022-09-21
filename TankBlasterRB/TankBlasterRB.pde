//TANK BLASTER: REBLASTERED
//Max Riedel, Bryan Reuter, 2022

//---LIBRARIES---

import java.util.HashSet;
import java.util.List;

//---CONSTANTS---

final float noise_scale = 0.0024f;

//---VARIABLES---

int index_activePlayer;

float offset;
float previousMillis = millis();

boolean debug = false;

PImage terrain;

//---GAME STATE---

enum gameState {
  aim, simulate
}
gameState state;

enum item {
  TraceShot("Trace Shot"),
    Grenade("Grenade"),
    AtomicBomb("Atomic Bomb"),
    HBomb("H-Bomb");

  public String name;
  private item(String name) {
    this.name = name;
  }
}
item selectedItem;

//---SETUP AND PROGRAM LOOP---

void setup() {
  size(1600, 900, P2D);
  offset = width / 100;
  frameRate(120);
  roundStart();
}

void draw() {
  float timeMillis = millis();
  float deltaMillis = timeMillis - previousMillis;
  float deltaSeconds = deltaMillis / 1000f;
  previousMillis = timeMillis;

switch (state) {
  case aim: {
  }
  case simulate: {
  }
}

  image(terrain, 0, 0);
  debug();
}

//---FUNCTIONS---

void roundStart() {
  generateTerrain();

  state = gameState.aim;
  index_activePlayer = int(random(0, 1));
  selectedItem = item.Grenade;
}

void generateTerrain() {
  noiseSeed(millis());

  terrain = createImage(width, height, ARGB);
  terrain.loadPixels();
  for (int x = 0; x < width; ++x) {
    float altitude = map(noise(x*noise_scale), 0, 1, 0.2f*height, 0.8f*height);
    setTerrainHeight(x, altitude);
  }
  terrain.updatePixels();
}

void setTerrainHeight(int x, float altitude) {
  for (int y = 0; y < (int)altitude; ++y) {
    terrain.pixels[x + y*terrain.width] = color(y/5, 15, y+50);
  }
  for (int y = (int)altitude; y < height; ++y) {
    terrain.pixels[x + y*terrain.width] = color(512-(y/2.5), 512-(y/2.25), 512-(y/1.3));
  }
}

void debug() {
  if (debug == true) {
    text("DEBUG", offset, offset);
    text(mouseX + " " + mouseY, offset, offset * 2);
    if (key == ' ') {
      text("SPACE", offset, offset * 3);
    }
    text(key, offset, offset * 3);
    text(timeManagement().x, offset, offset * 4);
    text(timeManagement().z, offset, offset * 5);
  }
}

//---KEYS---

void keyPressed() {
  if (keyCode == 17) {
    if (debug == false) {
      debug = true;
    } else {
      debug = false;
    }
  }
}
