
class MossMan extends GameObject {
  boolean go = true;//so initializign line only happens once

  MossMan(int _x, int _y, int r) {
    location.x = _x;
    location.y = _y;
    size = r;
  }

  void show() {
    //circle(location.x, location.y, size);
    image(mossifer, location.x, location.y);
    mossifer.resize(0, size);
  }

  void act() { //wise dude a lily pretnetious??? idk thinks theyre better than everyone else but turs around at the end
    super.act();

    if (location.x >= 870) location.x = 870;
    if (location.x <= 370) location.x = 370;
    if (location.y >= 450) location.y = 450;
    if (location.y <= 150) location.y = 150;

    // println(location.x, location.y);
    if (dist(location.x, location.y, myPlayer.location.x, myPlayer.location.y) <= myPlayer.size/2 + size) {
      print("moss--");
      if (ekey && go) {
        line = m1;
        go = false;
      }
      if (line == m1 && ekey) {
        ekey=false;
        myObjects.add(new Dialogue("Hello"));
        line = m2;
        print(line);
      } else if (line == m2 && ekey) {
        ekey=false;
        myObjects.add(new Dialogue("You will have to beat my mini game if you want to find your family"));
        line = Mrps;
      } else if (line == Mrps && ekey) {
        mode = RPS;
        ekey = false;
        if (awin >= 1) line = m3;
        if (aloss >= 1) line = m4;
        if (atie >= 1) line = m5;
      } else if (line == m3 && ekey) {//won
        ekey=false;
        myObjects.add(new Dialogue("A moss-merizing play. You have my respect youngling. \nGood luck with finding your family. The first digit of the code is 2."));//losing
      } else if (line == m4 && ekey) {//loss
        ekey=false;
        myObjects.add(new Dialogue("AHA! I have won, just like I predicted! You are welcome to try again,\nif you dare >:)"));//losing
        line = m1;
      } else if (line == m5 && ekey) {//tie
        ekey=false;
        myObjects.add(new Dialogue("tie :("));//losing
        line = m1;
      }
    }
  }
}


//=========================================================================================================================================
class Fish extends GameObject {
  boolean go = true;
  Fish(int _x, int _y, int r) {//  alex GIVE OBNOXIOUS FONT
    location.x = _x;
    location.y = _y;
    size = r;
  }

  void show() {
    //circle(x, y, size);
    image(koi, location.x, location.y);
    koi.resize(0, size);
  }
  void act() {
    super.act();

    if (dist(location.x, location.y, myPlayer.location.x, myPlayer.location.y) <= myPlayer.size/2 + size) {
      //print("moss--");
      if (ekey && go) {
        line = k1;
        go = false;
      }
      if (line == k1 && ekey) {
        ekey=false;
        myObjects.add(new Dialogue("YO C'MERE. I BETCHA CAN'T BEAT ME IN THIS GAME!"));
        line = k2;
      } else if (line == k2 && ekey) {
        ekey=false;
        myObjects.add(new Dialogue("IF YOU DO (unlikely), I WILL LET YOU THROUGH"));
        line = Kpong;
      } else if (line == Kpong && ekey) {
        mode = PONG;
        ekey = false;
        if (awin >= 1) line = k3;
        if (aloss >= 1) line = k4;
        if (atie >= 1) line = k5;
      } else if (line == k3 && ekey) {//won
        ekey=false;
        myObjects.add(new Dialogue("well its o-fish-al, you bet me in this game. But don't get \ncocky. This was just a fluke. The thrid digit for the code is 0."));//losing
      } else if (line == k4 && ekey) {//loss
        ekey=false;
        myObjects.add(new Dialogue("I TOLD YOU. YOU ARE WELCOME TO TRY AGAIN. BUT I WILL JUST WIN AGAIN"));//losing
        line = m1;
      } else if (line == k5 && ekey) {//tie
        ekey=false;
        myObjects.add(new Dialogue("tie :("));//losing
        line = m1;
      }
    }
  }
}

//============================================================================================================================================
class Frog extends GameObject {
  boolean speak = true;
  Frog(int _x, int _y, int r) {//bubbly dude! fun bestie child :O
    location.x = _x;
    location.y = _y;
    size = r;
  }

  void show() {
    //  circle(x, y, size);
    image(frog, location.x, location.y);
    frog.resize(0, size);
  }

  void act() {
    super.act();

    if (location.x >= 970) location.x = 970;
    if (location.x <= 470) location.x = 470;
    if (location.y >= 780) location.y = 780;
    if (location.y <= 480) location.y = 480;

    if (dist(location.x, location.y, myPlayer.location.x, myPlayer.location.y) <= myPlayer.size/2 + size) {
      //print("frogg");
      // print(ekey, speak);
      if (ekey && speak) {
        line = fr1;
        print("slay");
        speak = false;
      }
      if (line == fr1 && ekey) {
        ekey = false;
        myObjects.add(new Dialogue("HEY!!! Wanna play my game??"));
        line = fr2;
        print(line);
      } else if (line == fr2 && ekey) {
        ekey = false;
        myObjects.add(new Dialogue("Please play! if you do I'll give you a hint to get back to your fam!"));
        line = FRcatch;
      } else if (line == FRcatch && ekey) {
        mode = CATCH;
        line = fr3;
      } else if (line == fr3 && ekey) {
        ekey = false;
        myObjects.add(new Dialogue("awww man, that was a good game! Thanks for playing with me, \n I am a lot hoppier! The second number of the code is 0. Good luck \non your journey!!"));//losing
      }
    }
  }
}
//================================================================================================================================================
class Mushroom extends GameObject {
  boolean speak = true;
  Mushroom(int _x, int _y, int r) {//elegant
    location.x = _x;
    location.y = _y;
    size = r;
  }
  void show() {
    circle(location.x, location.y, size);
  }
  void act() {
    super.act();

    if (dist(location.x, location.y, myPlayer.location.x, myPlayer.location.y) <= myPlayer.size/2 + size) {

      if (ekey && speak) {
        line = mush1;
        print("slay");
        speak = false;
      }
      if (line == mush1 && ekey) {
        ekey = false;
        myObjects.add(new Dialogue("Hello there"));
        line = mush2;
        print(line);
      } else if (line == mush2 && ekey) {
        ekey = false;
        myObjects.add(new Dialogue("You seem lost little one. Here, if you \nhelp me gather my friends I can help you find your family."));
        line = mushBR;
      } else if (line == mushBR && ekey) {
        mode = BREAKOUT;
        line = mush3;
      } else if (line == mush3 && ekey) {
        ekey = false;
        myObjects.add(new Dialogue("Thank you kindly. You have helped out me \ntremedously, the last number of the code is 3"));//losing
      }
    }
  }
}

//========================================================================================================================================================
class Wizard extends GameObject {
  boolean go = true;
  Wizard(int _x, int _y, int r) {
    location.x = _x;
    location.y = _y;
    size = r;
  }
  void show() {
    image(wizard, location.x, location.y);
    wizard.resize(size, 0);
  }

  void act() { 
    super.act();

    if (dist(location.x, location.y, myPlayer.location.x, myPlayer.location.y) <= myPlayer.size/2 + size) {
      if (ekey && go) {
        line = w1;
        go = false;
      }
      if (line == w1 && ekey) {
        ekey=false;
        myObjects.add(new Dialogue("Hello young one, you have been on a long journey. Good job."));
        line = w2;
      } else if (line == w2 && ekey) {
        ekey=false;
        myObjects.add(new Dialogue("You must be tired. So let's get to it. You will need to use the knowlege \nyou have gained on this journey and input it into this keypad"));
        line = wEnd;
      } else if (line == wEnd && ekey) {
        mode = END;
        ekey = false;
        line = w3;
      } else if (line == w3 && ekey) {
        ekey=false;
        myObjects.add(new Dialogue("Excellent work! You have done it! I am impressed. \nOff into the portal you go. You will now finally be able to see your family"));//losing
        line = w1;
      }
    }
  }
}
