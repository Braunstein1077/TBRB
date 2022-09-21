class Tank {
  final float minAngle = -PI;
  final float maxAngle = 0;

  PVector pos;

  color col;

  float angle;

  int power;
  int energy;

  public Tank(PVector pos, color col) {
    this.pos = pos;
    this.col = col;
    this.angle = -PI/2;
  }
}
