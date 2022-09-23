//Describes the PLAYER class.

class Player {

  //---VARIABLES---

  int index;
  int cpuLevel; //Ranging from 0 to 5. 0 means that it is a human player.

  String name;
  
  color col;

  //---CONSTRUCTOR---

  public Player(int index, int cpuLevel, String name, color col) {
    this.index = index;
    this.cpuLevel = cpuLevel;
    this.name = name;
    this.col = col;
  }

  //---FUNCTIONS---

  public color getColor() {
    return this.col;
  }
  
   public int getcpuLevel() {
    return this.cpuLevel;
  }
}
