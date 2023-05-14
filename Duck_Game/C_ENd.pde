ArrayList<String> code = new ArrayList<String>();

//String[] code = {"0", "0", "0", "0"};

String password = "2023";
String num1, num2, num3, num4;

void end() {
  //background(blue);
  image(endBG, width/2, height/2);
  endBG.resize(1000, 0);
  showNums();
  showNumPad();
  //print(code);
  // print(num1, num2, num3, num4);
}
         
void showNumPad() {
  //one.showText();
  image(rock1, 400, 315);//1
  image(rock3, 500, 315);//2
  image(rock2, 600, 315);//3
  image(rock2, 400, 415);//4
  image(rock1, 500, 415);//5
  image(rock2, 600, 415);//6
  image(rock3, 400, 515);//7
  image(rock2, 500, 515);//8
  image(rock1, 600, 515);//9
  image(rock1, 500, 615);//0
  image(rock2, 400, 615);//clear
  image(rock1, 600, 615);//enter

fill(#2E363E);
textAlign(CENTER, BOTTOM);
text("1", 400, 300);
text("2", 500, 300);
text("3", 600, 300);
text("4", 400, 400);
text("5", 500, 400);
text("6", 600, 400);
text("7", 400, 500);
text("8", 500, 500);
text("9", 600, 500);
text("0", 500, 600);
text("⌫", 400, 600);
text("⇤", 610, 600);

  rock1.resize(0, 125);
  rock2.resize(0, 125);
  rock3.resize(0, 125);
  rock4.resize(0, 125);
  //two.showText();
  //three.showText();
  //four.showText();
  //five.showText();
  //six.showText();
  //seven.showText();
  //eight.showText();
  //nine.showText();
  //zero.showText();
  //clear.showText();
  //enter.showText();
}

void showNums() {
  num1 = num2 = num3 = num4 = " ";

  strokeWeight(10);
  line(185, 200, 285, 200);
  line(360, 200, 460, 200);
  line(535, 200, 635, 200);
  line(710, 200, 810, 200);

  if (code.size() >= 1) num1 = code.get(0);
  if (code.size() >= 2) num2 = code.get(1);
  if (code.size() >= 3) num3 = code.get(2);
  if (code.size() >= 4) num4 = code.get(3);

  textSize(50);
  text(num1, 235, 160);
  text(num2, 410, 160);
  text(num3, 585, 160);
  text(num4, 760, 160);
}

void endClicks() {
  //nums
  if (mouseX >= 362.5 && mouseX <= 437.5 && mouseY >= 277.75 && mouseY <= 352.5) code.add("1");
  if (mouseX >= 462.5 && mouseX <= 537.5 && mouseY >= 277.75 && mouseY <= 352.5) code.add("2");
  if (mouseX >= 562.5 && mouseX <= 637.5 && mouseY >= 277.75 && mouseY <= 352.5) code.add("3");
  if (mouseX >= 362.5 && mouseX <= 437.5 && mouseY >= 377.75 && mouseY <= 452.5) code.add("4");
  if (mouseX >= 462.5 && mouseX <= 537.5 && mouseY >= 377.75 && mouseY <= 452.5) code.add("5");
  if (mouseX >= 562.5 && mouseX <= 637.5 && mouseY >= 377.75 && mouseY <= 452.5) code.add("6");
  if (mouseX >= 362.5 && mouseX <= 437.5 && mouseY >= 477.75 && mouseY <= 552.5) code.add("7");
  if (mouseX >= 462.5 && mouseX <= 537.5 && mouseY >= 477.75 && mouseY <= 552.5) code.add("8");
  if (mouseX >= 562.5 && mouseX <= 637.5 && mouseY >= 477.75 && mouseY <= 552.5) code.add("9");
  if (mouseX >= 462.5 && mouseX <= 537.5 && mouseY >= 577.75 && mouseY <= 652.5) code.add("0");

  //clear
  if (mouseX >= 362.5 && mouseX <= 437.5 && mouseY >= 577.75 && mouseY <= 652.5) {
    num1 = num2 = num3 = num4 = " ";
    code.clear();
  }

//  enter
  //textSize(1000);
  //strokeWeight(20);
 // fill(255, 0, 0);
  if (mouseX >= 562.5 && mouseX <= 637.5 && mouseY >= 577.75 && mouseY <= 652.5) {
    if (code.get(0).equals(password.substring(0, 1)) && code.get(1).equals(password.substring(1, 2)) && code.get(2).equals(password.substring(2, 3))&& code.get(3).equals(password.substring(3, 4))) mode = PORTAL;
    //else text("X", width/2, height/2);
  }
}
