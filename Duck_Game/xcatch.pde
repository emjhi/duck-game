int basketW = 200;
int basketL = 75;
int basketX = width/2;
int basketY = 550;

int point = 0;
void basketCatch() {
  background(ocean);
  image(catchBG, width/2, height/2 + 150);
  catchBG.resize(1000, 0);
  text("points: " + point, 800, 100);

  for (int i = 0; i < myObjects.size(); i++) {
    GameObject obj = myObjects.get(i);
    if (obj instanceof Apple) {
      obj.show();
      obj.act();
    }
  }
  basket();
  
  if (point > 10) mode = GAME;
}

void basket() {
  if (akey == true) basketX = basketX - 7;
  if (dkey == true) basketX = basketX + 7;
  fill(255);
  rectMode(CENTER);
  // rect(basketX, basketY, basketW, basketL);
  image(basket, basketX, basketY - 20);
  basket.resize(basketW, 0);

  for (int i = 0; i < myObjects.size(); i++) {
    GameObject obj = myObjects.get(i);
    if (obj instanceof Apple) {
      if (obj.location.y > basketY) {
        cleanUp();
        myObjects.add(new Apple());
        if ((obj.location.x <= basketX + basketW/2) && (obj.location.x >= basketX - basketW/2)) point++;
      }
    }
  }
  textSize(50);
  //text(point, 800, 100);
}

class Apple extends GameObject {
  int appleD;
  int appleX; 
  float appleY;
  float appleS;

  Apple() {
    appleD = 75;
    location.x = int (random(1000));
    location.y = 0;
    appleS = random(0.05, 0.1);
  }

  void act() {
    for (int timer = 60; timer > 0; timer--) {
      location.y += appleS;
      //println(appleY);
    }
  }

  void show() {
    fill(255, 0, 0);
    //  circle(location.x, location.y, appleD);
    image(app, location.x, location.y);
    app.resize(0, appleD);
  }
}
