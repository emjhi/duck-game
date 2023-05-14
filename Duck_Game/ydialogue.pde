//call dialogue in npc or whateves when needed and then click to dissaper and then call again to make it seems like its a trail of dialogue??

class Dialogue extends GameObject {
  boolean diaon = true;//dialogue on/off
  String text ="";
  Dialogue(String t) {
    text = t;
  }

  void show() {
    if (diaon) {
      image(dialogue, width/2, 575);
      dialogue.resize(880, 0);
      textAlign(LEFT);
      textSize(24);
      fill(225);
      text(text, 125, 530);
    }
  }


  void act() {
    if (mousePressed) {
      diaon = false;
      cleanUp();
    }
  }
}
