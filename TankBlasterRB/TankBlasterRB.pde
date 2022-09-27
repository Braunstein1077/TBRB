//TANK BLASTER: REBLASTERED
//Max Riedel, Bryan Reuter, 2022

//---LIBRARIES---

import java.util.HashSet;
import java.util.List;

//---CONSTANTS---

final float noise_scale = 0.0024f;

final int tankSize = 6;

//---VARIABLES---

int index_activePlayer;
int playerCount = 50;

float offset;
float previousMillis = millis();

boolean debug = false;

PImage terrain;

Tank[] tanks;
Player[] players = new Player[playerCount];

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

  for (int i=1; i < playerCount; i++) {
    players[i] = new Player(i, 0, "Baum " + i, color(int(random(0, 255)), int(random(0, 255)), int(random(0, 255))));
  }

  roundStart(players.length);
}

void draw() {
  float timeMillis = millis();
  float deltaMillis = timeMillis - previousMillis;
  float deltaSeconds = deltaMillis / 1000f;
  previousMillis = timeMillis;

  switch (state) {
  case aim:
    {
    }
  case simulate:
    {
    }
  }

  image(terrain, 0, 0);
  for (int i=1; i<tanks.length; i++) {
    tanks[i].draw();
  }
  debug();
}

//---FUNCTIONS---

void roundStart(int playerCount) {
  generateTerrain();

  tanks = new Tank[playerCount];

  for (int i = 1; i<players.length; i++) {
    tanks[i] = spawnTank((width/(players.length)) * i, players[i].getcpuLevel(), players[i].getColor());
  }

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
    float Baum=y+(height-altitude);
  terrain.pixels[x + y*terrain.width] = color(950-(Baum/2.6), 950-(Baum/2.25), 920-(Baum/1.35));
}
}

public Tank spawnTank(int spawnX, int cpuLevel, color col) {
  float altitude = map(noise(spawnX*noise_scale), 0, 1, 0.2f*height, 0.8f*height);

  terrain.loadPixels();
  for (int x=spawnX-tankSize/2; x<spawnX+tankSize/2; ++x) {
    setTerrainHeight(x, altitude);
  }

  terrain.updatePixels();

  return new Tank(new PVector(spawnX, altitude), cpuLevel, col);
}

void debug() {
  if (debug == true) {
    text("DEBUG", offset, offset);
    text(mouseX + " " + mouseY, offset, offset * 2);
    if (key == ' ') {
      text("SPACE", offset, offset * 3);
    }
    text(key, offset, offset * 3);
    //text(timeManagement().x, offset, offset * 4);
    //text(timeManagement().z, offset, offset * 5);
  }
}

//---KEYS---
