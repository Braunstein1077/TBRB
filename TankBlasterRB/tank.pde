//Describes the TANK class.

class Tank {

  //---CONSTANTS---

  final float minAngle = -PI;
  final float maxAngle = 0;


  //---VARIABLES---

  PVector pos;

  color col;

  float angle;

  int power;
  int energy;
  int cpuLevel;

  //---CONSTRUCTOR---

  public Tank(PVector pos, int cpuLevel, color col) {
    this.pos = pos;
    this.cpuLevel = cpuLevel;
    this.col = col;
    this.angle = -PI/2;
  }

  //---FUNCTIONS---

  void aimCannon(float deltaAngle) {
    angle = constrain(angle + deltaAngle, minAngle, maxAngle);
  }

  void draw() {
    pushMatrix();
    translate(pos.x, pos.y);

    noStroke();
    fill(col);
    beginShape();
    vertex(-tankSize/2, 0);
    vertex(-tankSize/2, -2);
    vertex(-tankSize/2 + 1, -3);
    vertex(tankSize/2 - 1, -3);
    vertex(tankSize/2, -2);
    vertex(tankSize/2, 0);
    endShape(CLOSE);

    stroke(col);
    strokeWeight(1);
    noFill();
    rotate(angle);
    line(2, 0, 7, 0);

    popMatrix();
  }
}
