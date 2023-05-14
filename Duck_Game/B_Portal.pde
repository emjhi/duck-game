void portal() {
  drawPortal();
  //  println(myPlayer.location.y);
  portal.resize(0, 1000);
  //drawGameObj();
  run();

  for (int i = 0; i < myObjects.size(); i++) {
    GameObject obj = myObjects.get(i);
    if (obj instanceof Wizard || obj instanceof Player) {
      obj.show();
      obj.act();
    }
  }
}

void drawPortal() {
  if (wkey) portalY += speed;
  if (skey) portalY -= speed;

  image(portal, portalX, portalY);

  if (portalX >= 500) portalX = 500;//right border
  if (portalY >= 500) portalY = 500; //top baorder
  if (portalX <= 500) portalX = 500;
  if (portalY <= 210) portalY = 210;

  //println("x" + portalX + "  Y" + portalY);
}

void run() {
  if (myPlayer.location.x >= 650 && myPlayer.location.y >= 530 && ekey) mode = END;
}
