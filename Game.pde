int leftwall;
int leftwally;
int rightwall;
int rightwally;
int score;
int player;
int wallspeed;
int gamemode;
PImage gameimage;
int gamepagetext;
int gamepageimage;
int gamepagetext2;
int highscore;
int highscoretext;
int highscoretext2;

void setup() {

  size(500, 500);
  
  player=width/2-10;
  
  wallset();
  
  wallspeed = 2;
  
  gamemode = 0;
  
  gameimage = loadImage("hole.jpg");
  
  highscore = max(score,highscore);
  
  gamepageimage = 110;
  gamepagetext = 400;
  gamepagetext2 = 440;
  highscoretext = 485;
  highscoretext2 = 485;
  
}

void mousePressed() {
  
  gamemode = gamemode+1;
  
}

void draw() {
  
  fill(0);
  rect(0,0,width,height);
  
  image(gameimage, gamepageimage, 50);
  textSize(50);
  fill(255);
  text("HOLE IN THE WALL",20,gamepagetext);
  textSize(25);
  fill(255);
  text("Click to start game",40,gamepagetext2);
  text("HIGHSCORE=",40,highscoretext);
  text(highscore,205,highscoretext2);
  
  
  if(gamemode == 1){
  
    gamepageimage = 1000;
    gamepagetext = 1000;
    gamepagetext2 = 1000;
    highscoretext = 1000;
    highscoretext2 = 1000;
    
  fill(255);//player
  rect(player,350,20,20);
  
  wallmovement();
  scoring();
  wallreset();
  gameover();
  
  fill(255, 0, 0);
  textSize(50);
  text("Score", 190, 425);
  text(score, 240, 475); //score count
  
  }
  
}
  
  void keyPressed(){ //controls
    if(key == '.') {
      player = player + 5;
    } else if(key == ',') {
      player = player -5;
    }
    if(key == 'k') {
      setup();} //press to try again
    
}
  
  void wallmovement() {
    
    fill(225);//leftwall
  rect(0, leftwally, leftwall, 25);
  
  fill(225);//rightwall
  rect(rightwall, rightwally, 1000, 25);
  
  leftwally=leftwally+wallspeed;
  rightwally=rightwally+wallspeed; //wall movement
    
  }
  void scoring() {
    
    if (leftwally > 500) {
    score = score + 1; //the score counter
    }
    
}
  void wallset() {
  
   leftwall=int(random(1,449));
   leftwally=0;
  
   rightwall=leftwall+50;
   rightwally=0; //setting up the wall
    
  }
  
  void wallreset() {
    
    if(leftwally > 500)
    wallset();//creating more walls
    
  }
  
  void gameover() {
    
    if(leftwally+25 > 350 && leftwally < 350 && player < leftwall) {
      textSize(50);
    text("GAME OVER",110,100);
    wallspeed = 0;
    textSize(25);
    text("PRESS K",200,150);
    text("TO RESTART",180,180);
    
    } else if(rightwally+25 > 350 && rightwally < 350 && player > rightwall) {
      textSize(50);
    text("GAME OVER",110,100);
    wallspeed = 0;
    textSize(25);
    text("PRESS K",200,150);
    text("TO RESTART",180,180);
    }
    
  }
