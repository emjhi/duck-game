void keyPressed() {
  if ((key == 'w' || key == 'W')) wkey = true;
  if ((key == 'a' || key == 'A')) akey = true;

  //if (isTouchingLeft()) akey = false;
  if ((key == 's' || key == 'S')) skey = true;
  if ((key == 'd' || key == 'D')) dkey = true;
  if ((key == 'e' || key == 'E')) ekey = true;
  //println("touching left " + isTouchingLeft() + ", a key " + akey + ", both " + );
}

void keyReleased() {
  if (key == 'w' || key == 'W') wkey = false;
  if (key == 'a' || key == 'A') akey = false;
  if (key == 's' || key == 'S') skey = false;
  if (key == 'd' || key == 'D') dkey = false;
  if (key == 'e' || key == 'E') ekey = false;
}

void mouseReleased() {
  if (mode == INTRO) {
    introClicks();
  } else if (mode == GAME) {
    gameClicks();
  } else if (mode == RPS) {
    rpsClicks();
  } else if (mode == END) {
    endClicks();
  }
}

//boolean isTouchingLeft() {
//  boolean touch = false;
//  for (int i = 0; i < myObjects.size(); i++) {
//    float ox = myObjects.get(i).location.x;
//    float oy = myObjects.get(i).location.y;
//    float os = myObjects.get(i).size;
//    float x = myPlayer.location.x;
//    float y = myPlayer.location.y;
//    float s = myPlayer.size;
//    //println("x: " + ((ox + os/2) >= (x - s/2)));
//    //println("y1: " + ((oy - os/2) <= (y + s/2)));
//    //println("y2: " + ((oy + os/2) >= (y + s/2)));
//    if ((myObjects.get(i) instanceof Obstacle)) {
//      if (((ox + os/2) >= (x - s/2)) && (((oy - os/2) <= (y + s/2)) && ((oy + os/2) >= (y - s/2)))) {
//        println("MORNINGGGGGGG");
//        touch = true;
//      }
//    }
//  }
//  if (touch)
//    return true;
//  return false;
//}
