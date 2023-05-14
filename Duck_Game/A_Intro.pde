void intro() {
  start.showText();
  options.showText();
  exit.showText();
}

void introClicks() {
  if (mouseX >= 100 && mouseX <= 300 && mouseY >= 450 && mouseY <= 750) {
    mode = GAME;
  }
  if (mouseX >= 400 && mouseX <= 600 && mouseY >= 450 && mouseY <= 750) {
    
  }
  if (mouseX >= 700 && mouseX <= 900 && mouseY >= 450 && mouseY <= 750) {
    exit();
  }
}
