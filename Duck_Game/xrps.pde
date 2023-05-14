int rpsScore;
String computer, user;
int comp;
Button rock, paper, scissor;
int win, loss, tie;
int awin, aloss, atie;

void rps() {
  //background(cyan);
  image(rpsBG, width/2, height/2);
  rpsBG.resize(1000, 0);
  
  rock.show();
  paper.show();
  scissor.show();

  if (comp == 0)computer = "rock";
  else if (comp == 1) computer = "paper";
  else computer = "scissor";

  compute();
  images();
  awin = win;
  aloss = loss;
  atie = tie;
  if (win >= 1 || loss >= 1 ||tie >= 1) rpsReset();
}    

void images() {
  imageMode(CENTER);
  image(rocky, 200, 585);
  rocky.resize(250, 0);
  image(papery, 500, 580);
  papery.resize(155, 0);
  image(scissory, 830, 575);
  scissory.resize(200, 0);
}

void compute() {

  textSize(100);
  fill(0);
  if (computer.equals(user)) {
    text("Tie!", width/2, 300);
    tie++;
  } else if (computer.equals("rock")) {
    if (user.equals("scissor")) {
      text("You lose!", width/2, 300);
      loss++;
    } else if (user.equals("paper")) {
      text("You Win!! :D", width/2, 300);
      win++;
    }
  } else if (computer.equals("scissor")) {
    if (user.equals("rock")) {
      text("You Win!! :D", width/2, 300);
      win++;
    } else if (user.equals("paper")) {
      text("You lose!", width/2, 300);
      loss++;
    }
  } else if (computer.equals("paper")) {
    if (user.equals("rock")) {
      text("You lose!", width/2, 300);
      loss++;
    } else if (user.equals("scissor")) {
      text("you win!! :D", width/2, 300);
      win++;
    }
  }
}

void rpsClicks() {
  if (mouseX >= 100 && mouseX <= 300 && mouseY >= 500 && mouseY <= 650) user = "rock";
  if (mouseX >= 400 && mouseX <= 600 && mouseY >= 500 && mouseY <= 650) user = "paper";
  if (mouseX >= 700 && mouseX <= 900 && mouseY >= 500 && mouseY <= 650) user = "scissor";
}

void rpsReset() {
  win = loss = tie = 0;
  mode = GAME;

  if (comp == 0)computer = "rock";
  else if (comp == 1) computer = "paper";
  else computer = "scissor";
  user = "";
}
