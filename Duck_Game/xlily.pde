int leftx, lefty, leftd, rightx, righty, rightd; //paddles
float puckx, pucky;
int puckd; //puck
float puckvx, puckvy; //puck velocity

int leftscore, rightscore, timer;

void pong() {
  image(pongBG, width/2, height/2);
  pongBG.resize(1000, 0);
  //scoreboard
  textSize(50);
  fill(lavendar);
  text(leftscore, 150, 100);
  fill(blue);
  text(rightscore, 850, 100);
  timer = timer - 1;

  paddle();
  puck();
  
  if (leftscore >= 1) mode = GAME;
  if (rightscore >= 3) mode = GAME;
}

void paddle() {
  fill(lavendar);
  circle(leftx, lefty, leftd);
  image(Lpad, leftx + 50, lefty);
  Lpad.resize(0, leftd);
  fill(blue);
  circle(rightx, righty, rightd);
  image(Rpad, rightx - 50, righty);
  Rpad.resize(0, leftd);

  //move paddles
  if (wkey == true) lefty = lefty - 8;
  if (skey == true) lefty = lefty + 8;

  //ai move paddles 
  if (pucky > righty) righty = righty + 3;
  if (pucky < righty) righty = righty - 3;
  println(pucky, righty);
  //border
  if (lefty >= 600) lefty = 600;
  if (lefty <= 100) lefty = 100;
  if (righty >= 600) righty = 600;
  if (righty <= 100) righty = 100;
}

void puck() {
  noStroke();
  fill(lilac);
  circle(puckx, pucky, puckd-5);
  image(lily, puckx, pucky);
  lily.resize(0, puckd);

  //move puck
  if (timer < 0) {
    puckx = puckx + puckvx;
    pucky = pucky + puckvy;
  }

  //borders
  if (pucky >= 663) pucky = 663;
  if (pucky <= 37) pucky = 37;

  //scoring
  if (puckx <= 0) {
    rightscore++; 
    puckx = width/2;
    pucky = height/2;
    timer = 100;
  }

  if (puckx >= 1000) {
    leftscore++; 
    puckx = width/2;
    pucky = height/2;
    timer = 100;
  }

  //bouncing
  if (pucky <= puckd/2 || pucky >= height - puckd/2) {
    puckvy = puckvy * -1;
  }
  if (dist(leftx, lefty, puckx, pucky) <= leftd/2 + puckd/2) {
    puckvx = (puckx - leftx)/12;
    puckvy = (pucky - lefty)/12;
  }
  if (dist(rightx, righty, puckx, pucky) <= rightd/2 + puckd/2) {
    puckvx = (puckx - rightx)/12;
    puckvy = (pucky - righty)/12;
  }
}
