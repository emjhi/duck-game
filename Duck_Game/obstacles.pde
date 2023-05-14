class Obstacle extends GameObject {
  PImage image;
  color fill;
  Obstacle(PImage pic, int x, int y, int s, color c) {
    location.x = x; 
    location.y = y;
    image = pic;
    size = s;
    fill = c;
  }

  void show() {
    fill(fill);
    square(location.x, location.y, size);
    //image(image, location.x, location.y);
    //image.resize(0, size);
  }

  void act() {
    super.act();
    //print(mode);
    color filled = get(int (myPlayer.location.x), int(myPlayer.location.y));
    if (ekey) {
      if (myPlayer.location.x >= location.x - size/2 && myPlayer.location.x <= location.x + size/2) {
        if (filled == blue && myPlayer.location.y <= 300 && myPlayer.location.y >= location.y - 85) {
          mode = MUSH;
        }  
        if (filled == lilac && myPlayer.location.y <= location.y - 85) {
          mode = PORTAL;
          print("whuy wont you work man");
        }
      }
    }
  }
}
