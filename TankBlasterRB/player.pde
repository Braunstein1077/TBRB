//Describes the PLAYER class.

class Player {

  //---VARIABLES---

  int index;
  int cpuLevel; //Ranging from 0 to 5. 0 means that it is a human player.
  int money;

  String name;
  
  color col;
  
  Item[] itemList;

  //---CONSTRUCTOR---

  public Player(int index, int cpuLevel, String name, color col, Item[] itemList) {
    this.index = index;
    this.cpuLevel = cpuLevel;
    this.name = name;
    this.col = col;
    this.itemList = itemList;
  }

  //---FUNCTIONS---

  public color getColor() {
    return this.col;
  }
  
   public int getcpuLevel() {
    return this.cpuLevel;
  }
}
