void mushroom() {
  drawMushroom();
  //portal.resize(0, 1000);
  drawGameObj();
}

void drawMushroom() {
  if (portalY <= 400 && wkey) portalY += speed;
  //if (portalX >= 0 && akey) portalX += speed;
  if (portalY >= 350 && skey) portalY -= speed;
  //if (portalX <= 1000 && dkey) portalX -= speed;

  image(portal, portalX, portalY);

  if (portalX >= 500) portalX = 500;//right border
  if (portalY >= 400) portalY = 400; //top baorder
  if (portalX <= 500) portalX = 500;
  if (portalY <= 150) portalY = 150;

  //println("x" + portalX + "  Y" + portalY);
}
