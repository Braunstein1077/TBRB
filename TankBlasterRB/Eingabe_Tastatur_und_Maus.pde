void keyPressed() {
  if (keyCode == 17) {
    if (debug == false) {
      debug = true;
    } else {
      debug = false;
    }
  }
   if (keyCode == 37) {
     dreheNachLinks();
  } 
  if (keyCode == 38) {
    dreheNachOben();
  }
   if (keyCode == 39) {
     dreheNachRechts();
  }
   if (keyCode == 40) {
     dreheNachUnten();
   }
  
}
