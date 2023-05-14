//Emma Sun
//Capstone Duck Game

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//objects======================================================================================
ArrayList<GameObject> myObjects;
Player myPlayer;
Dialogue box;
Apple apple;
Obstacle log, stone;

//Sound Variables=========================================================================
Minim minim;
//AudioPlayer

//game varaibles===============================================================================
int mapX, mapY;//main bg
int portalX, portalY;
int speed = 5;

Gif duckup, duckd, duckr, duckl;
//buttons======================================================================================
boolean mouseReleased;
boolean hadPressed;
color bkg;
Button start, options, exit;
Button one, two, three, four, five, six, seven, eight, nine, zero, clear, enter;//end code buttons

//image========================================================================================
PImage rocky, papery, scissory, rpsBG;//rps
PImage lily, Lpad, Rpad, pongBG;//pong
PImage mushroom, breakoutBG;//breakout
PImage app, basket, catchBG;//catch
PImage mossifer, wizard, frog, koi;//npc
PImage stump, boulder;//obstacles
PImage dialogue;
PImage mainBG, portal;
PImage endBG, rock1, rock2, rock3, rock4;

PImage ducku, duckdown, duckright, duckleft;
//colour========================================================================================
color whiteish = #FFFCCD;
color creamish = #E4F090;
color cyan = #188266;
color lilac = #6727F2;
color lavendar = #4F26A6;
color dark = #151226;
color blue = #3552F2;
color red = #FF5039;
color orange = #FF9439;
color green = #3FD869;//rps
color dgreen = #0B9B32;//rps
color pink = #F43779;
color purple = #AD2BAD;
color ocean = #2F2BAD;

color brown = #935028;

//Mode Framework=====================================================================================
int mode;
final int INTRO = 0;
final int GAME = 1;
final int PONG = 2;
final int BREAKOUT = 3;
final int RPS = 4;
final int CATCH = 5;
final int END = 6;
final int PORTAL = 7;
final int MUSH = 8;

//keyboard========================================================================================
boolean wkey, akey, skey, dkey, ekey;

//diaogue=======================================================================================
//moss
int line;
final int m1 = 0;
final int m2 = 1;
final int m3 = 2;
int m4 = 8;
int m5 = 9;
final int Mrps = 3;//call rps

//frog
int fr1 = 4;
int fr2 = 5;
int fr3= 6;
int FRcatch = 7;

//wizard
int w1 = 8;
int w2 = 9;
int w3 = 10;
int wEnd = 11;

//mushroom
int mush1 = 12;
int mush2 = 13;
int mush3 = 14;
int mushBR = 15;

//koi
int k1 = 16;
int k2 = 17;
int k3 = 18;
int k4 = 19;
int k5 = 20;
int Kpong = 21;
void setup() {
  //setup========================================================================================
  size(1000, 700, FX2D);
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  wkey = akey = skey = dkey = ekey = false;

  mode = GAME;

  //npcs===================================================================================================
  mossifer = loadImage("npc/mossifer.png");
  wizard = loadImage("npc/wizard.png");
  frog = loadImage("npc/frog.png");
  koi = loadImage("npc/koi.png");

  //obstacles================================================================================================
  stump = loadImage("general/stump.jpg");
  boulder = loadImage("general/boulder.jpg");

  //initialize things==================================================================================

  dialogue = loadImage("general/dialogue.png");
  mainBG = loadImage("general/mainBG.jpg");
  portal = loadImage("general/portal.jpg");

  start = new Button("start", 200, 550, 200, 150, ocean, green);
  options = new Button("options", 500, 550, 200, 150, ocean, green);
  exit = new Button("exit", 800, 550, 200, 150, ocean, green);

  //end buttons 
  one = new Button(rock1, "1", 400, 315, 75, 75, lavendar, pink);
  two = new Button("2", 500, 315, 75, 75, lavendar, pink);
  three = new Button("3", 600, 315, 75, 75, lavendar, pink);
  four = new Button("4", 400, 415, 75, 75, lavendar, pink);
  five = new Button("5", 500, 415, 75, 75, lavendar, pink);
  six = new Button("6", 600, 415, 75, 75, lavendar, pink);
  seven = new Button("7", 400, 515, 75, 75, lavendar, pink);
  eight = new Button("8", 500, 515, 75, 75, lavendar, pink);
  nine = new Button("9", 600, 515, 75, 75, lavendar, pink);
  zero = new Button("0", 500, 615, 75, 75, lavendar, pink);
  clear = new Button("clear", 400, 615, 75, 75, lavendar, pink);
  enter = new Button("enter", 600, 615, 75, 75, lavendar, pink);

  //load duch gifsduck
  duckup = new Gif(5, "duck/up/f_", ".png", 15);
  duckd = new Gif(5, "duck/down/f_", ".png", 15);
  // duckl = new Gif(4, "duck/left/f_", ".png", 15);
  duckr = new Gif(4, "duck/right/f_", ".png", 15);

  ducku = loadImage("duck/up/f_1.png");
  duckdown = loadImage("duck/down/f_1.png");
  duckright = loadImage("duck/right/f_1.png");
  duckleft = loadImage("duck/left/f_1.png");
  
  //load end images
  endBG = loadImage("end/codeBG.png");
  rock1 = loadImage("end/rock1.png");
  rock2 = loadImage("end/rock2.png");
  rock3 = loadImage("end/rock3.png");
  rock4 = loadImage("end/rock4.png");

  //game varaibles================================================================
  mapX = width/2;
  mapY = 250;

  portalX = width/2;
  portalY = 250;
  //objects========================================================================================

  myPlayer = new Player();
  myObjects = new ArrayList<GameObject>();
  myObjects.add(myPlayer);
  myObjects.add(new MossMan(370, 200, 50));
  myObjects.add(new Frog(470, 530, 50));
  myObjects.add(new Fish(975, 200, 60));
  myObjects.add(new Wizard(550, 420, 60));
  myObjects.add(new Mushroom(860, 230, 60));

  //myObjects.add(new Obstacle(stump, 975, 650, 150, lilac));
  //myObjects.add(new Obstacle(boulder, 630, 0, 150, blue));//to go in mushroom top cave


  //RPS=======================================================================================================================
  rock = new Button(200, 575, 250, 150, green, dgreen);
  paper = new Button(500, 575, 250, 150, green, dgreen);
  scissor = new Button(800, 575, 250, 150, green, dgreen);

  comp = int (random(3));
  user = "";
  win = loss = tie = 0;

  rocky = loadImage("rps/rock.png");
  papery = loadImage("rps/paper.png");
  scissory = loadImage("rps/scissor.png");
  rpsBG = loadImage("rps/rpsBG.png");
  //PONG===================================================================================================
  //initialize paddles
  leftx = 0;
  lefty = height/2;
  leftd = 200;

  rightx = 1000;
  righty = height/2;
  rightd = 200;

  //initialize puck
  puckx = width/2;
  pucky = height/2;
  puckd = 75; 
  puckvx = 2;
  puckvy = -2;

  //initialize scores
  rightscore = leftscore = 0;
  timer = 100;

  lily = loadImage("pong/lily.png");//puck
  Rpad = loadImage("pong/Lpad.png");//right paddle
  Lpad = loadImage("pong/Rpad.png");//left paddle
  pongBG = loadImage("pong/pongBG.png");
  //Catch=========================================================================================================
  app = loadImage("catch/apple.png");
  basket = loadImage("catch/basket.png");
  catchBG = loadImage("catch/catchBG.png");
  myObjects.add(new Apple());

  //BERAKOUT======================================================================================================
  mushroom = loadImage("breakout/mushroom.png");
  breakoutBG = loadImage("breakout/breakoutBG.png");

  //initialze entites
  paddlex = width/2;
  paddley = 600;
  paddled = 80;

  //initialize ball
  ballx = width/2;
  bally = height/2 + 100;
  balld = 10; 
  ballvx = random(3, -3);
  ballvy = random(-3, 3);

  //initialize score
  score = 0;
  atari_timer = 100;
  lives = 3;

  //brick array setup
  n = 60;
  x = new int[n];
  y = new int[n];
  alive = new boolean[n];

  brickd = 35;
  tempx = 50;
  tempy = 75;

  int i = 0;
  while (i < n) {
    x[i] = tempx;
    y[i] = tempy;
    alive[i] = true;

    tempy = tempy + 75;
    if (tempy > 400) {
      tempx = tempx + 100;
      tempy = 75;
    }
    i++;
  }
}

void draw() {
  if (mode == INTRO) intro();
  else if (mode == GAME) game();
  else if (mode == BREAKOUT) breakout();
  else if (mode == PONG) pong();
  else if (mode == CATCH) basketCatch();
  else if (mode == RPS) rps();
  else if (mode == END) end();
  else if (mode == PORTAL) portal();
  else if (mode == MUSH) mushroom();
}

void cleanUp() {
  for (int i = 0; i < myObjects.size(); i++) {
    GameObject obj = myObjects.get(i);
    if (obj instanceof Apple || obj instanceof Dialogue) {
      myObjects.remove(i);
      i--;
    }
  }
}
