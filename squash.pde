import ddf.minim.*;
void setup() {
  size(400, 400);
  Minim minim = new Minim(this);
  ding = minim.loadSample("ding.mp3");
  ball = loadImage("ball.jpg");
}

int x = 200;
int y = 0;
int ellipseX = int(random(400));
int ellipseY = int(random(400));
int hizY = 3;
int hizX = 3;
int rectY = 350;
int sayac = 0;
AudioSample ding;
PImage ball;
int puan = 0;
int kirmiziellipseX = int(random(400));
int kirmiziellipseY = int(random(400));
int gameover = 0;

void draw() {
  background(150, 150, 150);
  image(ball, x, y);
  fill(255, 255, 255);
  rect(mouseX, 380, 70, 20);
  fill(0, 0, 0);
  text(sayac, 10, 30);
  textSize(32);
  text(puan, 350, 50);
  textSize(16);
  fill(0, 255, 0);
  ellipse(ellipseX, ellipseY, 20, 20);
  fill(255, 0, 0);
  ellipse(kirmiziellipseX, kirmiziellipseY, 20, 20);
  if (gameover == 0) {
    y = y + hizY;
    x = x + hizX;
    if (ellipseX- 10 < x && x < ellipseX + 10 && ellipseY - 10 < y && y < ellipseY + 10) {
      puan = puan + 5;
      ellipseX = int(random(400));
      ellipseY = int(random(400));
    }
    if (kirmiziellipseX- 10 < x && x < kirmiziellipseX + 10 &&  kirmiziellipseY- 10 < y && y < kirmiziellipseY + 10) {
      puan = puan -5;
      kirmiziellipseX = int(random(400));
      kirmiziellipseY = int(random(400));
    }
    if (y > 380 && mouseX < x && x < mouseX + 70) {
      if (gameover == 0) {  
        hizY =hizY + 1; 
        hizY = -1 * hizY;
        sayac = sayac + 1;
        puan = puan + 10;
      }
    }

    if (y < 0) {
      hizY = -1 * hizY;
    }
    if (x < 0) {
      hizX = -1 * hizX;
    }
    if (y > 390) {
      if (gameover == 0) {
        ding.trigger();
      }
      gameover = 1;
    }
    if (x > 390) {
      hizX = -1 * hizX;
    }
  } else {
    fill(0, 0, 0);
    text("tekrar denemelisin!", 50, 200);
    textSize(16);
  }
}
void mouseClicked() {
  if (mouseButton == LEFT && gameover == 1) {
    gameover = 0;
    x = 200;
    y = 0;
    puan = 0;
    sayac = 0;

    hizX = 3;
    hizY = 3;
    kirmiziellipseX = int(random(400));
    kirmiziellipseY = int(random(400));
    ellipseX = int(random(400));
    ellipseY = int(random(400));
  }
}
