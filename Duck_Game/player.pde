class Player extends GameObject {
  Gif currentAction;
  boolean show = true;
  Player() {
    super();
    size = 30;
    speed = 1;
    currentAction = duckr;
  }

  void show() {
    // fill(blue);
    //square(location.x, location.y, size);
    // currentAction.show(myPlayer.location.x, myPlayer.location.y, size, size);

 if (wkey) image(ducku, location.x, location.y);
else if (akey) image(duckleft, location.x, location.y);
else if (skey) image(duckdown, location.x, location.y);
else if (dkey) image(duckright, location.x, location.y);
else if (show) image(duckright, location.x, location.y);
ducku.resize(0, 50);
duckdown.resize(0, 50);
duckright.resize(0, 50);
duckleft.resize(0, 50);
}

void act() {
  println(mode, location.y);

  if (mapX >= 1000 || portalX >= 500) {
    if (wkey == true) location.y = location.y - speed;
    if (akey == true) location.x = location.x - speed;
    if (skey == true) location.y = location.y + speed;
    if (dkey == true) location.x = location.x + speed;
  }
  if (mapY >= 500 || portalY >= 400) {
    if (wkey == true) location.y = location.y - speed;
    if (akey == true) location.x = location.x - speed;
    if (skey == true) location.y = location.y + speed;
    if (dkey == true) location.x = location.x + speed;
  }
  if (mapX <= 0 || portalX <= 500) {
    if (wkey == true) location.y = location.y - speed;
    if (akey == true) location.x = location.x - speed;
    if (skey == true) location.y = location.y + speed;
    if (dkey == true) location.x = location.x + speed;
  }
  if (mapY <= 200 || portalY <= 150) {
    if (wkey == true) location.y = location.y - speed;
    if (akey == true) location.x = location.x - speed;
    if (skey == true) location.y = location.y + speed;
    if (dkey == true) location.x = location.x + speed;
  }

  if (location.x >= 1000 - size/2) location.x = 1000 - size/2;//right border
  if (location.y >= 700 - size/2) location.y = 700 - size/2; //top baorder
  if (location.x <= size/2) location.x = size/2;//left border
  if (location.y <= size/2) location.y = size/2;//bottom boarder0;
}
} 
