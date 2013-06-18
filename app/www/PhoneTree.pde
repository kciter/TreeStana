PImage[] imgPhotoFrame = new PImage[5];
PImage[] imgWallpaper = new PImage[3];

PImage imgPhotoWindowNight;
PImage imgPhotoWindowMorning;
PImage imgPhotoWindowAfternoon;
PImage imgPhotoWindowSunset;
PImage imgWallpaper1;

int m = minute();
int h = hour();    // Values from 0 - 23®
//int h = 19;
int value = 0;
int i = m % 5;
float limit = 175 * sin(radians(frameCount));
int ResetLimit = 0;
int MugCount = 5;

void setup () {
  size (800, 480);
  
  imgPhotoFrame[0] = loadImage("./images/journey-game-screenshot.jpg");
  imgPhotoFrame[1] = loadImage("./images/PiggyCat.jpg");
  imgPhotoFrame[2] = loadImage("./images/muscleGuy.jpg");
  imgPhotoFrame[3] = loadImage("./images/raidSM9.jpg");
  imgPhotoFrame[4] = loadImage("./images/dogs.jpg");
  
  imgWallpaper[0] = loadImage("./images/brown-wallpaper0.jpg");

  imgPhotoWindowNight = loadImage("./images/night_sky.jpg");
  imgPhotoWindowMorning = loadImage("./images/MorningSky.jpg");
  imgPhotoWindowAfternoon = loadImage("./images/AfternoonSky.jpg");
  imgPhotoWindowSunset = loadImage("./images/SunsetSky.jpg");
  imgWallpaper1 = loadImage ("./images/brown-wallpaper11.jpg");
}

void draw () {
  background (255);
  backgroundSellect ();
  drawTable ();
  drawWindowFrame ();

  drawPhotoWindow ();
  drawLeftWindow ();
  drawOpenWindow ();
  
  drawFirstBook ();
  drawSecondBook ();
  drawThirdBook ();
  
  drawLamp ();
  
  drawPhotoFrame ();
  
  drawTrunk ();
  
  drawLeaf ();
  
  drawFirstFlowerLeaf ();
  drawSecondFlowerLeaf ();
  drawThirdFlowerLeaf ();
  drawFourthFlowerLeaf ();
  drawFifthFlowerLeaf ();
  
  drawFlowerEllipse ();
  
  drawFirstPot ();
  drawSecondFlowerGroth ();
  
  drawSecondFlowerGroth ();
  
  drawSecondPot ();
  
  SellectPhoto ();
  
  scalePhotoframeClick (); 
}

void drawSecondFlowerGroth () {
  if ( MugCount == 1 ) {
    drawSecondLeaf ();
    drawSecondTrunk ();
  }
  else if ( MugCount == 2 ) {
    drawSecondLeaf ();
    drawSecondTrunk ();
  }
  else if ( MugCount == 3 ) {
    drawSecondLeaf ();
    drawSecondTrunk ();
    drawSecondFlowerBud ();
  }
  
  else if ( MugCount == 4 ) {
    drawSecondLeaf ();
    drawSecondTrunk ();
    drawSecondFlowerFirstLeaf ();
    drawSecondFlowerSecondLeaf ();
    drawSecondFlowerThirdLeaf ();
    drawSecondFlowerFourthLeaf ();
    drawSecondFlowerFifthLeaf ();
    drawSecondFlowerSixthLeaf ();
    drawSecondFlowerSeventhLeaf ();
    drawSecondFlowerEigthLeaf ();
    drawSecondFlowerEllipse ();
  }

  else if ( MugCount == 5 ) {
    drawSecondLeaf ();
    drawSecondTrunk ();
    drawSecondFlowerFirstLeaf ();
    drawSecondFlowerSecondLeaf ();
    drawSecondFlowerThirdLeaf ();
    drawSecondFlowerFourthLeaf ();
    drawSecondFlowerFifthLeaf ();
    drawSecondFlowerSixthLeaf ();
    drawSecondFlowerSeventhLeaf ();
    drawSecondFlowerEigthLeaf ();
    drawSecondFlowerEllipse ();
  }
}
void grid()
{
  stroke( 0, 0, 0, 50 );
  for ( int i=0 ; i<480 ; i+=20 )
    line( 0, i, 800, i );
  for ( int i=0 ; i<800 ; i+=20 )
    line( i, 0, i, 480 );
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////


void drawFirstFlowerLeaf () {
  beginShape();
  fill (#FFF612);
  stroke(#FFF612);
  vertex (PathX(210, 240), PathY(210, 240));
  bezierVertex (200, 255, 200, 260, PathFirstFlowerLeafX(200, 300), PathFirstFlowerLeafY(200, 300));
  vertex (PathFirstFlowerLeafX(200, 300), PathFirstFlowerLeafY(200, 300));
  bezierVertex (230, 260, 220, 250, PathX(210, 240), PathY(210, 240));
  endShape (CLOSE); // first FolwerLeaf
}

void drawSecondFlowerLeaf () {
  beginShape();
  fill (#FFF612);
  stroke(#FFF612);
  vertex (PathX(210, 240), PathY(210, 240));
  bezierVertex (200, 255, 190, 250, PathSecondFlowerLeafX(150, 240),PathSecondFlowerLeafY(150, 240));
  vertex (PathSecondFlowerLeafX(150, 240),PathSecondFlowerLeafY(150, 240));
  bezierVertex (180, 230, 200, 230, PathX(210, 240), PathY(210, 240));
  endShape (CLOSE); // second FolwerLeaf
}

void drawThirdFlowerLeaf () {
  beginShape();
  fill (#FFCD12);
  stroke(#FFCD12);
  vertex (PathX(210, 240), PathY(210, 240));
  bezierVertex (185, 240, 190, 190, PathThirdFlowerLeafX(190, 180), PathThirdFlowerLeafY(190, 180));
  vertex (PathThirdFlowerLeafX(190, 180), PathThirdFlowerLeafY(190, 180));
  bezierVertex (220, 200, 215, 230, PathX(210, 240), PathY(210, 240));
  endShape (CLOSE); // third FolwerLeaf
}

void drawFourthFlowerLeaf () {
  beginShape();
  fill (#FFE400);
  stroke(#FFE400);
  vertex (PathX(210, 240), PathY(210, 240));
  bezierVertex (215, 220, 220, 210, PathFourthFlowerLeafX(250, 200), PathFourthFlowerLeafY(250, 200));
  vertex (PathFourthFlowerLeafX(250, 200), PathFourthFlowerLeafY(250, 200));
  bezierVertex (245, 230, 230, 240, PathX(210, 240), PathY(210, 240));
  endShape (CLOSE); // fourth FolwerLeaf
}

void drawFifthFlowerLeaf () {
  beginShape();
  fill (#FFCD12);
  stroke(#FFCD12);
  vertex (PathX(210, 240), PathY(210, 240));
  bezierVertex (220, 230, 260, 240, PathFifthFlowerLeafX(260, 270), PathFifthFlowerLeafY(260, 270));
  vertex (PathFifthFlowerLeafX(260, 270), PathFifthFlowerLeafY(260, 270));
  bezierVertex (250, 255, 210, 270, PathX(210, 240), PathY(210, 240));
  endShape (CLOSE); // fifth FlowerLeaf
}

void drawLightFlowerFirstLeaf () {
  pushMatrix ();
  translate(PathX(370, 260), PathY(370, 260));
  fill (#C6FFFF);
  stroke (#C6FFFF);
  
  rotate(radians(135.0));
  
  ellipse (50, 0, 30, 6);
  popMatrix ();
}

void drawLightFlowerSecondLeaf () {
  pushMatrix ();
  translate(PathX(370, 300), PathY(370, 300));
  fill (#C6FFFF);
  stroke (#C6FFFF);
  
  rotate(radians(45.0));
  
  ellipse (50, 0, 30, 6);
  popMatrix ();  
}

void drawLightFlowerThirdLeaf () {
  pushMatrix ();
  translate(PathX(390, 280), PathY(390, 280));
  fill (#C6FFFF);
  stroke (#C6FFFF);
  
  rotate(-radians(45.0));
  
  ellipse (50, 0, 30, 6);
  popMatrix ();  
}

void drawLightFlowerFourthLeaf () {
  pushMatrix ();
  translate(PathX(30, 300), PathY(370, 300));
  fill (#C6FFFF);
  stroke (#C6FFFF);
  
  rotate(-radians(135.0));
  
  ellipse (50, 0, 30, 6);
}

void drawFlowerEllipse () {
  fill (#FF2424);
  stroke (#FF7E7E);
  strokeWeight (3);
  ellipse(PathX(210, 240), PathY(210, 240), 15, 15); // flower ellipse
  strokeWeight (1);
}

void drawTrunk () {
  stroke (#0BC904);
  strokeWeight (3);
  noFill();
  
  bezier (185, 325, 185, 320, 190, 250, PathX(210, 240), PathY(210, 240)); //trunk
  strokeWeight (1);
}

void drawLeaf () {
  stroke (#0BC904);
  strokeWeight (5);
  noFill();
  bezier (185, 325, 195, 300, 200, 270, PathRightLeafX1(240, 280), PathRightLeafY1(240, 280)); //right leaf 1
  strokeWeight (1);
  
  stroke (#0BC904);
  strokeWeight (5);
  noFill();
  bezier (185, 325, 195, 300, 200, 270, PathRightLeafX2(240, 280), PathRightLeafY2(240, 280)); //right leaf 2
  strokeWeight (1);

  stroke (#0BC904);
  strokeWeight (7);
  noFill();
  bezier (185, 325, 185, 300, 180, 270, PathLeftLeafX1(140, 240), PathLeftLeafY1(140, 240)); //left leaf
  strokeWeight (1);
}
float PathX (int x, int y) {
  int CircleCenterX = 185;
  int CircleCenterY = 325;
  float CircleRadius = pow((pow((CircleCenterX-210.f),2.f)+pow((CircleCenterY-240.f),2.f)),0.5f);  
  float CircleAngle = -radians(68) + sin( radians(frameCount) ) / 10;
  
  float FlowerX = CircleCenterX + cos(CircleAngle) * CircleRadius;
  
  return FlowerX; 
}

float PathY (int x, int y) {
  int CircleCenterX = 185;
  int CircleCenterY = 325;
  float CircleRadius = pow((pow((CircleCenterX-210.f),2.f)+pow((CircleCenterY-240.f),2.f)),0.5f);  
  float CircleAngle = -radians(68) + sin( radians(frameCount) ) / 10;
  
  float FlowerY = CircleCenterY + sin(CircleAngle) * CircleRadius;
  
  return FlowerY;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////

float PathRightLeafX1 (int x, int y) {
  int CircleCenterX = 185;
  int CircleCenterY = 325;
  float CircleRadius = pow((pow((CircleCenterX-240.f),2.f)+pow((CircleCenterY-280.f),2.f)),0.5f);  
  float CircleAngle = -radians(30) + sin( radians(frameCount) ) / 10;
  
  float FlowerX = CircleCenterX + cos(CircleAngle) * CircleRadius;
  
  return FlowerX; 
}

float PathRightLeafY1 (int x, int y) {
  int CircleCenterX = 185;
  int CircleCenterY = 325;
  float CircleRadius = pow((pow((CircleCenterX-240.f),2.f)+pow((CircleCenterY-280.f),2.f)),0.5f);  
  float CircleAngle = -radians(30) + sin( radians(frameCount) ) / 10;
  
  float FlowerY = CircleCenterY + sin(CircleAngle) * CircleRadius;
  
  return FlowerY;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////

float PathRightLeafX2 (int x, int y) {
  int CircleCenterX = 185;
  int CircleCenterY = 325;
  float CircleRadius = pow((pow((CircleCenterX-240.f),2.f)+pow((CircleCenterY-280.f),2.f)),0.5f);  
  float CircleAngle = radians(0) + sin( radians(frameCount) ) / 10;
  
  float FlowerX = CircleCenterX + cos(CircleAngle) * CircleRadius;
  
  return FlowerX; 
}

float PathRightLeafY2 (int x, int y) {
  int CircleCenterX = 185;
  int CircleCenterY = 325;
  float CircleRadius = pow((pow((CircleCenterX-240.f),2.f)+pow((CircleCenterY-280.f),2.f)),0.5f);  
  float CircleAngle = radians(0) + sin( radians(frameCount) ) / 10;
  
  float FlowerY = CircleCenterY + sin(CircleAngle) * CircleRadius;
  
  return FlowerY;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////

float PathLeftLeafX1 (int x, int y) {
  int CircleCenterX = 185;
  int CircleCenterY = 325;
  float CircleRadius = pow((pow((CircleCenterX-140.f),2.f)+pow((CircleCenterY-240.f),2.f)),0.5f);  
  float CircleAngle = -radians(130) + sin( radians(frameCount) ) / 10;
  
  float FlowerX = CircleCenterX + cos(CircleAngle) * CircleRadius;
  
  return FlowerX; 
}

float PathLeftLeafY1 (int x, int y) {
  int CircleCenterX = 185;
  int CircleCenterY = 325;
  float CircleRadius = pow((pow((CircleCenterX-140.f),2.f)+pow((CircleCenterY-240.f),2.f)),0.5f);  
  float CircleAngle = -radians(130) + sin( radians(frameCount) ) / 10;
  
  float FlowerY = CircleCenterY + sin(CircleAngle) * CircleRadius;
  
  return FlowerY;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////

float PathFirstFlowerLeafX (int x, int y) {
  int CircleCenterX = 210;
  int CircleCenterY = 240;
  float CircleRadius = pow((pow((CircleCenterX-200.f),2.f)+pow((CircleCenterY-300.f),2.f)),0.5f);  
  float CircleAngle = -radians(270) + sin( radians(frameCount) ) / 10;
  
  float FlowerX = CircleCenterX + cos(CircleAngle) * CircleRadius;
  
  return FlowerX; 
}

float PathFirstFlowerLeafY (int x, int y) {
  int CircleCenterX = 210;
  int CircleCenterY = 240;
  float CircleRadius = pow((pow((CircleCenterX-200.f),2.f)+pow((CircleCenterY-300.f),2.f)),0.5f);  
  float CircleAngle = -radians(270) + sin( radians(frameCount) ) / 10;
  
  float FlowerY = CircleCenterY + sin(CircleAngle) * CircleRadius;
  
  return FlowerY;
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////

float PathSecondFlowerLeafX (int x, int y) {
  int CircleCenterX = 210;
  int CircleCenterY = 240;
  float CircleRadius = pow((pow((CircleCenterX-200.f),2.f)+pow((CircleCenterY-300.f),2.f)),0.5f);  
  float CircleAngle = -radians(180) + sin( radians(frameCount) ) / 10;
  
  float FlowerX = CircleCenterX + cos(CircleAngle) * CircleRadius;
  
  return FlowerX; 
}

float PathSecondFlowerLeafY (int x, int y) {
  int CircleCenterX = 210;
  int CircleCenterY = 240;
  float CircleRadius = pow((pow((CircleCenterX-200.f),2.f)+pow((CircleCenterY-300.f),2.f)),0.5f);  
  float CircleAngle = -radians(180) + sin( radians(frameCount) ) / 10;
  
  float FlowerY = CircleCenterY + sin(CircleAngle) * CircleRadius;
  
  return FlowerY;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////

float PathThirdFlowerLeafX (int x, int y) {
  int CircleCenterX = 210;
  int CircleCenterY = 240;
  float CircleRadius = pow((pow((CircleCenterX-200.f),2.f)+pow((CircleCenterY-300.f),2.f)),0.5f);  
  float CircleAngle = -radians(110) + sin( radians(frameCount) ) / 10;
  
  float FlowerX = CircleCenterX + cos(CircleAngle) * CircleRadius;
  
  return FlowerX; 
}

float PathThirdFlowerLeafY (int x, int y) {
  int CircleCenterX = 210;
  int CircleCenterY = 240;
  float CircleRadius = pow((pow((CircleCenterX-200.f),2.f)+pow((CircleCenterY-300.f),2.f)),0.5f);  
  float CircleAngle = -radians(110) + sin( radians(frameCount) ) / 10;
  
  float FlowerY = CircleCenterY + sin(CircleAngle) * CircleRadius;
  
  return FlowerY;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////

float PathFourthFlowerLeafX (int x, int y) {
  int CircleCenterX = 210;
  int CircleCenterY = 240;
  float CircleRadius = pow((pow((CircleCenterX-200.f),2.f)+pow((CircleCenterY-300.f),2.f)),0.5f);  
  float CircleAngle = -radians(60) + sin( radians(frameCount) ) / 10;
  
  float FlowerX = CircleCenterX + cos(CircleAngle) * CircleRadius;
  
  return FlowerX; 
}

float PathFourthFlowerLeafY (int x, int y) {
  int CircleCenterX = 210;
  int CircleCenterY = 240;
  float CircleRadius = pow((pow((CircleCenterX-200.f),2.f)+pow((CircleCenterY-300.f),2.f)),0.5f);  
  float CircleAngle = -radians(60) + sin( radians(frameCount) ) / 10;
  
  float FlowerY = CircleCenterY + sin(CircleAngle) * CircleRadius;
  
  return FlowerY;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////

float PathFifthFlowerLeafX (int x, int y) {
  int CircleCenterX = 210;
  int CircleCenterY = 240;
  float CircleRadius = pow((pow((CircleCenterX-200.f),2.f)+pow((CircleCenterY-300.f),2.f)),0.5f);  
  float CircleAngle = radians(20) + sin( radians(frameCount) ) / 10;
  
  float FlowerX = CircleCenterX + cos(CircleAngle) * CircleRadius;
  
  return FlowerX; 
}

float PathFifthFlowerLeafY (int x, int y) {
  int CircleCenterX = 210;
  int CircleCenterY = 240;
  float CircleRadius = pow((pow((CircleCenterX-200.f),2.f)+pow((CircleCenterY-300.f),2.f)),0.5f);  
  float CircleAngle = radians(20) + sin( radians(frameCount) ) / 10;
  
  float FlowerY = CircleCenterY + sin(CircleAngle) * CircleRadius;
  
  return FlowerY;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////

float PathSeocndRightLeafX (int x, int y) {
  int CircleCenterX = 360;
  int CircleCenterY = 345;
  float CircleRadius = pow((pow((CircleCenterX + MugCount*10 -400.f),2.f)+pow((CircleCenterY + MugCount*10 -340.f),2.f)),0.5f);  
  float CircleAngle = -radians(30) + sin( radians(frameCount + 50) ) / 5;
  
  float FlowerX = CircleCenterX + cos(CircleAngle) * CircleRadius;
  
  return FlowerX; 
}

float PathSeocndRightLeafY (int x, int y) {
  int CircleCenterX = 360;
  int CircleCenterY = 345;
  float CircleRadius = pow((pow((CircleCenterX + MugCount*10 -400.f),2.f)+pow((CircleCenterY + MugCount*10 -340.f),2.f)),0.5f);  
  float CircleAngle = -radians(30) + sin( radians(frameCount + 50) ) / 5;
  
  float FlowerY = CircleCenterY + sin(CircleAngle) * CircleRadius;
  
  return FlowerY;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////

float PathSecondLeftLeafX (int x, int y) {
  int CircleCenterX = 360;
  int CircleCenterY = 345;
  float CircleRadius = pow((pow((CircleCenterX + MugCount*10 - 400.f),2.f)+pow((CircleCenterY + MugCount*10 -340.f),2.f)),0.5f);  
  float CircleAngle = -radians(130) + sin( radians(frameCount + 50) ) / 5;
  
  float FlowerX = CircleCenterX + cos(CircleAngle) * CircleRadius;
  
  return FlowerX; 
}

float PathSecondLeftLeafY (int x, int y) {
  int CircleCenterX = 360;
  int CircleCenterY = 345;
  float CircleRadius = pow((pow((CircleCenterX + MugCount*10 -400.f),2.f)+pow((CircleCenterY + MugCount*10 - 340.f),2.f)),0.5f);  
  float CircleAngle = -radians(130) + sin( radians(frameCount + 50) ) / 5;
  
  float FlowerY = CircleCenterY + sin(CircleAngle) * CircleRadius;
  
  return FlowerY;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////

float PathSecondX (int x, int y) {
  int CircleCenterX = 360;
  int CircleCenterY = 345;
  float CircleRadius = pow((pow((CircleCenterX-370.f),2.f)+pow((CircleCenterY + MugCount*8 - 320.f),2.f)),0.5f);  
  float CircleAngle = -radians(90) + sin( radians(frameCount + 50) ) / 10;
  
  float FlowerX = CircleCenterX + cos(CircleAngle) * CircleRadius;
  
  return FlowerX; 
}

float PathSecondY (int x, int y) {
  int CircleCenterX = 360;
  int CircleCenterY = 345;
  float CircleRadius = pow((pow((CircleCenterX-370.f),2.f)+pow((CircleCenterY + MugCount*8 - 320.f),2.f)),0.5f);  
  float CircleAngle = -radians(90) + sin( radians(frameCount + 50) ) / 10;
  
  float FlowerY = CircleCenterY + sin(CircleAngle) * CircleRadius;
  
  return FlowerY;
}


void backgroundSellect () {
  if ( h >= 19 || 6 > h) {
    //tint (100, 255);
    image (imgWallpaper1, 0, 0, 800, 480);
    //noTint ();
  } else {
    image (imgWallpaper1, 0, 0, 800, 480);
  }
}

void drawPhotoWindow () {
  if ( h >= 19 || 6 > h) {
    image (imgPhotoWindowNight, 125, 50, 365, 300);
    //image (imgWallpaper[2], 0, 0, 800, 480);
    //image (imgWallpaper1, 0, 0, 800, 480);
    drawLampLightOn ();
  } else if ( h >= 6 && h < 7) {
    image (imgPhotoWindowMorning, 125, 50, 365, 300);
    //image (imgWallpaper[1], 0, 0, 800, 480);
    //image (imgWallpaper1, 0, 0, 800, 480);
  } else if ( h >= 7 && h < 18 ) {
    image (imgPhotoWindowAfternoon, 125, 50, 365, 300);
    //image (imgWallpaper[0], 0, 0, 800, 480);
    //image (imgWallpaper1, 0, 0, 800, 480);
  } else { 
    image (imgPhotoWindowSunset, 125, 50, 365, 300);
    //image (imgWallpaper[1], 0, 0, 800, 480);
    //image (imgWallpaper1, 0, 0, 800, 480);
  }
}

void SellectPhoto () {
  int i = m % 5;  
  image (imgPhotoFrame[i], 570, 30, 80, 110);
}

void mouseClicked() {
  if ( 570 < mouseX && mouseX < 650 && 30 < mouseY && mouseY < 140 && value == 0 ) {
    value = 1;
  } else if ( 570 < mouseX && mouseX < 730 && 30 < mouseY && mouseY < 250 && value == 1 ) {
    value = 0;
  }
}


void scalePhotoframeClick () {
  if ( value == 1) {
    image (imgPhotoFrame[i], 570, 30, 160, 220);
  } else if ( value == 0)
    image (imgPhotoFrame[i], 570, 30, 80, 110);
}

void drawTable () {
  fill (#9C5B36);
  stroke (#9C5B36);
  rect (50, 395, 700, 20);  //floor
  fill (#D2916C);
  stroke (#D2916C);
  rect (70, 415, 40, 110);  //left pillar
  fill (#D2916C);
  stroke (#D2916C);
  rect (690, 415, 40, 110); //right pillar
  fill (#AE6D48);
  stroke (#AE6D48);
  rect (110, 415, 580, 40); //front board
}

void drawWindowFrame () {
  fill (#5CD1E5);
  stroke (#5CD1E5);
  rect (70, 350, 450, 20); // window frame bottom
  fill (#3DB7CC);
  stroke (#3DB7CC);
  rect (70, 30, 450, 20); // window frame top
  fill (#5CD1E5);
  stroke (#5CD1E5);
  rect (80, 50, 20, 300); // window frame left
  fill (#3DB7CC);
  stroke (#3DB7CC);
  rect (490, 50, 20, 300); //window frame right
}

void drawLeftWindow () {
  fill (#C8FFFF);
  stroke (#C8FFFF);
  rect (100, 50, 200, 15);
  fill (#C8FFFF);
  stroke (#C8FFFF);
  rect (100, 335, 200, 15);  
  fill (#C8FFFF);
  stroke (#C8FFFF);
  rect (100, 50, 25, 300);
  fill (#C8FFFF);
  stroke (#C8FFFF);
  rect (120 + 170, 65, 10, 270);
  fill (#7C96C9);
  stroke (#7C96C9);
  rect (105, 180, 15, 40); // left hand grip
  /*fill (#B2EBF4);
  stroke (#B2EBF4);
  rect (100, 50, 215, 15);
  fill (#B2EBF4);
  stroke (#B2EBF4);
  rect (125, 65, 150, 270); // left window*/
  
}

void drawOpenWindow () {
  
  if ( limit >= 175 ) {
    limit = 175;
  }
  else {
    limit = 175 * sin(radians(frameCount));
  }
    fill (#B2EBF4);
    stroke (#B2EBF4);
    rect (272.5 - limit, 50, 220, 15);
    fill (#B2EBF4);
    stroke (#B2EBF4);
    rect (272.5 - limit, 335, 220, 15);
    fill (#B2EBF4);
    stroke (#B2EBF4);
    rect (272.5 - limit, 50, 30, 300);
    fill (#B2EBF4);
    stroke (#B2EBF4);
    rect (465 - limit, 50, 30, 300);
    fill (#FFFFFF,0);
    stroke (#FFFFFF);
    //rect (305 - limit, 65, 160, 270); // right window 
    fill (#6A84B7);
    stroke (#6A84B7);
    rect (470 - limit, 180, 15, 40); // right hand grip
}

void drawFirstPot () {
  beginShape ();
  fill (#8A4924);
  stroke (#8A4924);
  vertex (160, 395);
  vertex (220, 395);
  vertex (240, 325);
  vertex (140, 325);
  endShape (CLOSE);
}

void drawSecondPot () {
  beginShape ();
  fill (#512800);
  stroke (#512800);
  vertex (340, 395);
  vertex (380, 395);
  vertex (390, 345);
  vertex (330, 345);
  endShape (CLOSE);
}

void drawFirstBook () {
  fill (#FFBB00);
  noStroke ();
  strokeWeight (0.5);
  rect (600, 275, 20, 120);
  fill (#B77300);
  rect (600, 285, 20, 30);
  rect (600, 350, 20, 10);
  rect (600, 385, 20, 5);
}

void drawSecondBook () {
  fill (#993800);
  rect (585, 285, 15, 110);
  fill (#EDA900);
  rect (585, 295, 15, 45);
}

void drawThirdBook () {
  beginShape ();
  fill (#997000);
  vertex (585, 295);
  vertex (560, 395);
  vertex (550, 393);
  vertex (575, 292);
  endShape(CLOSE);

  beginShape ();
  fill(#785D12);
  vertex (574, 300);
  vertex (564, 337);
  vertex (575, 340);
  vertex (584, 303);
  endShape(CLOSE);
}

void drawLamp () {
  fill (#987107);
  stroke (#987107);
  rect (650, 385, 70, 10);

  beginShape ();
  fill (#744D00);
  stroke (#744D00);
  vertex (710, 200);
  vertex (680, 385);
  vertex (690, 385);
  vertex (720, 200);
  vertex (675, 148);
  vertex (640, 180);
  vertex (640, 190);
  vertex (675, 159);
  endShape (CLOSE);

  beginShape ();
  fill (#623B00);
  stroke (#623B00);
  vertex (620, 160);
  vertex (560, 180);
  vertex (640, 260);
  vertex (660, 200);
  endShape (CLOSE);
}

void drawLampLightOn () {
  beginShape ();
  fill (#FFFFB4, 100);
  noStroke ();
  
  vertex (640, 260);
  vertex (620, 395);
  vertex (240, 395);
  vertex (560, 180);
  endShape (CLOSE);
}

void drawPhotoFrame () {
  fill (#8B2424);
  stroke (#8B2424);
  rect (560, 20, 100, 130);
  fill (#FFFFFF);
  rect (570, 30, 80, 110);
}



void drawSecondTrunk () {
  stroke (#0BC904);
  strokeWeight (3);
  noFill();
  
  bezier (360, 345, 360, 340, 360, 330, PathSecondX(370, 280), PathSecondY(370, 280)); //trunk
  strokeWeight (1);
}

void drawSecondLeaf () {
  stroke (#0BC904);
  strokeWeight (5);
  noFill();
  bezier (360, 345, 370, 330, 370, 320, PathSeocndRightLeafX(400, 300), PathSeocndRightLeafY(400, 300)); //right leaf 1
  strokeWeight (1);

  stroke (#0BC904);
  strokeWeight (4);
  noFill();
  bezier (360, 345, 360, 335, 350, 320, PathSecondLeftLeafX(320, 320), PathSecondLeftLeafY(320, 320)); //left leaf
  strokeWeight (1);
}

void drawSecondFlowerEllipse () {
  fill (#FF2424);
  stroke (#FF90FF);
  strokeWeight (2);
  ellipse (PathSecondX(370, 280), PathSecondY(370, 280), 10, 10); // flower ellipse
  strokeWeight (1);
}

void drawSecondFlowerFirstLeaf () {
  fill (#FF9436);
  stroke (#FF9436);
  ellipse (PathSecondX(370, 260), PathSecondY(370, 260), 6, 25 + (MugCount-3)*5);
}

void drawSecondFlowerSecondLeaf () {
  fill (#FF9436);
  stroke(#FF9436);
  ellipse (PathSecondX(370, 300), PathSecondY(370, 300), 6, 25 + (MugCount-3)*5);  
}

void drawSecondFlowerThirdLeaf () {
  fill (#FFB85A);
  stroke(#FFB85A);
  ellipse (PathSecondX(390, 280), PathSecondY(390, 280), 25 + (MugCount-3)*5, 6);  
}

void drawSecondFlowerFourthLeaf () {
  fill (#FFB85A);
  stroke(#FFB85A);
  ellipse (PathSecondX(350, 280), PathSecondY(350, 280), 25 + (MugCount-3)*5, 6);  
}

void drawSecondFlowerFifthLeaf () {
  pushMatrix ();
  translate(PathSecondX(370, 280), PathSecondY(370, 280));
  fill (#FFFFA2);
  stroke (#FFFFA2);
  
  rotate(radians(45.0));
  
  ellipse (23, 0, 10, 6);
  popMatrix ();
}

void drawSecondFlowerSixthLeaf () {
  pushMatrix ();
  translate(PathSecondX(370, 280), PathSecondY(370, 280));
  fill (#FFFFA2);
  stroke (#FFFFA2);
  
  rotate(radians(135.0));
  
  ellipse (23, 0, 10, 6);
  popMatrix ();
}

void drawSecondFlowerSeventhLeaf () {
  pushMatrix ();
  translate(PathSecondX(370, 280), PathSecondY(370, 280));
  fill (#FFFFA2);
  stroke (#FFFFA2);
  
  rotate(-radians(45.0));
  
  ellipse (23, 0, 10, 6);
  popMatrix ();
}

void drawSecondFlowerEigthLeaf () {
  pushMatrix ();
  translate(PathSecondX(370, 280), PathSecondY(370, 280));
  fill (#FFFFA2);
  stroke (#FFFFA2);
  
  rotate(-radians(135.0));
  
  ellipse (23, 0, 10, 6);
  popMatrix ();
}

void drawSecondFlowerBud () {
  pushMatrix ();
  translate(PathSecondX(370, 280), PathSecondY(370, 280));

  fill (#ABF200);
  stroke (#ABF200);
  rotate(radians(270));
  ellipse (5, 0, 10, 3);
  rotate(radians(330));
  ellipse (5, 0, 10, 3);
  rotate(radians(430.0));
  ellipse (5, 0, 10, 3);
  
  popMatrix ();
}


