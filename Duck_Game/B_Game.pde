void game() {
  // println(myObjects.size());
  mainBG.resize(0, 1000);
  drawMap();
  //  drawGameObj();
  next();
  if (ekey) println("Player loc: (" + myPlayer.location.x +","+ myPlayer.location.y + ")  Map loc: (" + mapX +"," + mapY + ")");

  for (int i = 0; i < myObjects.size(); i++) {
    GameObject obj = myObjects.get(i);
    if (obj instanceof MossMan || obj instanceof Fish || obj instanceof Frog || obj instanceof Player || obj instanceof Dialogue) {
      obj.show();
      obj.act();
    }
  }
}

void drawMap() {
  if (mapY <= 500 && wkey) mapY += speed;
  if (mapX >= 0 && akey) mapX += speed;
  if (mapY >= 200 && skey) mapY -= speed;
  if (mapX <= 1000 && dkey) mapX -= speed;

  image(mainBG, mapX, mapY);

  if (mapX >= 1000) mapX = 1000;//right border
  if (mapY >= 500) mapY = 500; //top baorder
  if (mapX <= 0) mapX = 0;//left border
  if (mapY <= 200) mapY = 200;//bottom boarder0;

  //println("x" + mapX + "  Y" + mapY);
}

void next() {
  if (ekey) {
    if (myPlayer.location.x >= 505 && myPlayer.location.x <= 562 && myPlayer.location.y >= 300 && mapX <= 455 && mapX >= 360 && mapY <= 500) {
      // mode = PORTAL;
      print("YEAHHH!!");
    }
  }
}

void  drawGameObj() {//can make it have varaibles to add and then the vrabiles are what i want to show and then instance of theat vraibles 
  for (int i = 0; i < myObjects.size(); i++) {
    GameObject obj = myObjects.get(i);
    obj.show();
    obj.act();
  }
}

void gameClicks() {
}
