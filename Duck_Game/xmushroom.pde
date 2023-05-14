//entities
float paddlex, paddley, paddled;//paddle
float ballx, bally, balld;//ball
float ballvx, ballvy;//velocity

//score
int score, atari_timer, lives;

//brick variables
int[] x;//x array
int[] y;//y array
int n;// pages
int brickd;//brick diameter
int tempx, tempy;
boolean[] alive;

void breakout() {
  //background(ocean);175
  image(breakoutBG, width/2, 200 );
  breakoutBG.resize(1000, 0);
  fill(255);
  atari_timer--;

  //bricks
  for (int i = 0; i < n; i++) {
    if (alive[i] == true) management(i);
  }

  //text
  fill(#FED300);
  textSize(50);
  text("score:" + score, 100, 600);
  text("lives:" + lives, 900, 600);

  breakoutPaddle();
  ball();

  //gameover 
  if (bally >= 700 + balld/2) {
    timer = 100;
    ballx = width/2;
    bally = width/2;
    lives = lives - 1;
  }

  if (score >= 25 || lives <= 0) {
    mode = GAME;
    print(mode);
  }
}

void breakoutPaddle() {

  //paddle
  fill(brown);
  rect(paddlex, paddley, paddled, 20);

  //move paddles
  if (akey == true) paddlex = paddlex - 7;
  if (dkey == true) paddlex = paddlex + 7;
  //border
  if (paddlex <= 40) paddlex = 40;
  if (paddlex > 960) paddlex = 960;
}

void ball() {
  //ball
  fill(brown);
  circle(ballx, bally, balld);

  //move ball
  if (atari_timer < 0) {
    ballx = ballx + ballvx;
    bally = bally + ballvy;
  }

  if (ballx >= width - balld/2) ballx = width - balld/2;
  if (ballx <= balld/2) ballx = balld/2;

  //ball bouncing 
  if (bally <= balld/2) ballvy = ballvy * -1;
  if (ballx <= balld/2 || ballx >= width - balld/2) ballvx = ballvx * -1;

  if (dist(paddlex, paddley, ballx, bally) <= 20 + balld/2) {
    ballvx = (ballx - paddlex)/10;
    ballvy = (bally - paddley)/10;
  }
}

void reset() {
  for (int i = 0; i < n; i++) {
    alive[i] = true;
  }

  timer = 100;
  score = 0;
  lives = 3;
  paddlex = width/2;
  ballx = width/2;
  bally = height/2 + 100;
  ballvx = random(3, -3);
  ballvy = random(-3, 3);
}

void management(int i) {
  if (y[i] == 75) fill(red);
  if (y[i] == 150) fill(orange);
  if (y[i] == 225) fill(green);
  if (y[i] == 300) fill(blue);
  if (y[i] == 375) fill(pink);
  noStroke();
 // circle(x[i], y[i], brickd);
  image(mushroom, x[i], y[i]);
  mushroom.resize(brickd, 0);
  if (dist(ballx, bally, x[i], y[i]) <= brickd/2 + balld/2) {
    ballvx = (ballx - x[i])/8;
    ballvy = (bally - y[i])/8;
    alive[i] = false;
    score++;
  }
}
