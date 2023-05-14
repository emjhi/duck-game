class GameObject {

  PVector location;
  PVector velocity;
  int size;
  int speed;

  GameObject() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
  }

  void show() {
  }

  void act() {
    location.add(velocity);

    int speed = 5;
    //if (wkey == true) location.y += speed;
    //if (akey == true) location.x += speed;
    //if (skey == true) location.y -= speed;
    //if (dkey == true) location.x -= speed;

    if (mapY <= 500 && wkey) location.y += speed;
    if (mapX >= 0 && akey) location.x += speed;
    if (mapY >= 200 && skey) location.y-= speed;
    if (mapX <= 1000 && dkey) location.x -= speed;
  }
}
