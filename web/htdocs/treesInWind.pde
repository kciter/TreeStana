/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/5386*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
float transparency = 150;
//color leafColor = color(250,173,150,transparency);
color leafColor = color(5,113,3,transparency);
color veinColor = color(5,113,3,transparency/2);
color branchColor = color(66,39,0);
color skyColor = color(211,211,255);

int width = 900;
int height = 600;

//branch controls
int nTrees = 1; //the number of trees
int nSegments;
float totalBranchLength;
float maxBranchThickness;
float minBranchThickness; 
float minSpawnDistance; //this controls how far the branch will grow before splitting
float branchSpawnOdds;   //the odds of a branch growing there
float branchSpawnOddsOfSecond; //odds of a second branch growing from the same node
float mindThetaSplit;
float maxdThetaSplit;
float maxdThetaWander;
float dBranchSize; //the new branch may change by 1.0+/- this amount

//leaf controls
float minLength; //leaf length
float maxLength; //leaf length
float minWidth;  //leaf width as a factor of length
float maxWidth;  //leaf width as a factor of length
float maxBranchSizeForLeaves;
float leafSpawnOdds;

int count = 0;

branch[] branches;

boolean[] arr;

void setup(){
  size(1280, 800);
  frameRate(60);
  smooth();
  noStroke();

  initializeTreeValues();
  
  windDirection = 0;
  windVelocity = 0;
  defineLeafOutline();

  generateBranches();
  
  //redrawTrees();
}


var cloud1X = -50;
var cloud2X = -400;
var cloud3X = -1300;
void draw(){

  background(178,235,244);

/*  if( count < 600 )
  {
    count++;
    initializeTreeValues();
  }*/
  pushMatrix();
  translate( cloud1X, 50 );
  scale( 1.5 );
  ellipseMode( CENTER );
  fill( 255 );
  ellipse( 800, 100, 100, 100 );
  ellipse( 850, 130, 100, 100 );
  ellipse( 830, 70, 100, 100 );
  ellipse( 890, 50, 100, 100 );
  ellipse( 910, 100, 100, 100 );
  ellipse( 940, 80, 100, 100 );
  ellipse( 970, 110, 100, 100 );
  ellipse( 930, 120, 100, 100 );
  popMatrix();

  pushMatrix();
  translate( cloud2X, 50 );
  scale( 1.2 );
  ellipseMode( CENTER );
  fill( 255 );
  ellipse( 800, 100, 100, 100 );
  ellipse( 850, 130, 100, 100 );
  ellipse( 830, 70, 100, 100 );
  ellipse( 890, 50, 100, 100 );
  ellipse( 910, 100, 100, 100 );
  ellipse( 940, 80, 100, 100 );
  ellipse( 970, 110, 100, 100 );
  ellipse( 930, 120, 100, 100 );
  popMatrix();

  pushMatrix();
  translate( cloud3X, 80 );
  scale( 1.6 );
  ellipseMode( CENTER );
  fill( 255 );
  ellipse( 800, 100, 100, 100 );
  ellipse( 850, 130, 100, 100 );
  ellipse( 830, 70, 100, 100 );
  ellipse( 890, 50, 100, 100 );
  ellipse( 910, 100, 100, 100 );
  ellipse( 940, 80, 100, 100 );
  ellipse( 970, 110, 100, 100 );
  ellipse( 930, 120, 100, 100 );
  popMatrix();

  cloud1X -= 0.45;
  cloud2X -= 0.6;
  cloud3X -= 0.3;

  if( cloud1X < -1400 )
	cloud1X = 300;
  if( cloud2X < -1400 )
	cloud2X = 300;
  if( cloud3X < -1800 )
	cloud3X = -200;

  fill( 47, 127, 39 );
  ellipse( 400, 830, 1280, 600 );
  
  fill( 47, 157, 39 );
  ellipse( 400, 850, 1280, 600 );

  fill( 47, 127, 39 );
  ellipse( 900, 830, 1280, 700 );
  fill( 47, 157, 39 );
  ellipse( 900, 850, 1280, 700 );
  

  drawFlower( 500, 600, #c6ff89-100 );
  drawFlower( 100, 640, #c6ff89-10 );
  drawFlower( 380, 580, #c6ff89-70 );
  drawFlower( 600, 660, #c6ff89-30 );
  drawFlower( 700, 580, #c6ff89-50 );
  drawFlower( 780, 620, #c6ff89+20 );
  drawFlower( 900, 550, #c6ff89-40 );
  drawFlower( 1000, 650, #c6ff89-20 );
  drawFlower( 1200, 600, #c6ff89-90 );

  updateWind();

  for(int i = 0; i<nTrees; i++)
    branches[i].rotateDueToWind();

  redrawTrees();
}

function drawFlower( int x, int y, color c )
{
  pushMatrix();
  stroke(#e6ffc9)
  strokeWeight(2);
  translate( x, y );
  scale( 0.2 );
  rotate(radians(frameCount));
  fill(c);
  for (int i = 0; i < 5; i++) {
	ellipse(0, -40, 50, 50);
	rotate(radians(72));
  }
  fill(#fff9bb);
  ellipse(0, 0, 50, 50);
  popMatrix();
}

void redrawTrees(){
  //background(skyColor);
  drawBranches();
 // if(drawLeaves)
    drawLeaves();
}

void drawBranches(){
  stroke(branchColor);
  for(int i = 0; i<nTrees; i++)
    branches[i].drawBranch(new float[]{(1+i)*(width/(1+nTrees))-200, height+100});
}

void drawLeaves(){
  noStroke();
    fill(leafColor);
  //draw leaves
  for(int i = 0; i<nTrees; i++)
  {
    fill(leafColor);
    branches[i].drawLeaves(new float[]{(1+i)*(width/(1+nTrees)), height});
  }
}

void initializeTreeValues(){
  //branch
  nSegments = 12;//12;
  totalBranchLength = count >= 600 ? 600 : count;//600;
  maxBranchThickness = count >= 600 ? 10 : count/60;//10;
  maxBranchSizeForLeaves = count >= 600 ? 10 : count/60;//10;
  minBranchThickness = 2;//2; 
  minSpawnDistance = .2;//.2;
  branchSpawnOdds = .8;//.8; 
  branchSpawnOddsOfSecond = 0;
  mindThetaSplit = PI*.1;
  maxdThetaSplit = PI*.3;
  maxdThetaWander = PI/20;
  dBranchSize = .2;
  //leaves
  minLength = 40;
  maxLength = 60;
  minWidth = .4;
  maxWidth = .5;
  if( count <= 200 )
	maxBranchSizeForLeaves = 1;
  else if( count > 200 && count <= 400 )
	maxBranchSizeForLeaves = 2;
  else if( count > 400 && count <= 500 )
	maxBranchSizeForLeaves = 3;
  else if( count > 500 )
	maxBranchSizeForLeaves = 5;
  leafSpawnOdds = .7;
  
  for( int i=0 ; i<8 ; i++ )
  {
	maxBranchThickness = maxBranchThickness*1.2;
	maxBranchSizeForLeaves = maxBranchSizeForLeaves*1.2;
	minBranchThickness = minBranchThickness*1.2;
  }
  generateBranches();
}

void generateBranches(){
  branches = new branch[nTrees];
  for(int i = 0; i<nTrees; i++)
    branches[i] = new branch(-1,3*PI/2, totalBranchLength, maxBranchThickness);
}


class branch{
  float x, y, theta, startingThickness;
  float theta0;
  float[] thetas;
  int index = -1; //this tells what segment the branch has spawned at.
              // if it's -1, it's the root.
  float segmentLength;
  ArrayList myChildren;
  ArrayList myLeaves;
  
  //this one's to generate a parent branch!
  branch(int index0, float thetaI, float totalLength, 
             float startingThickness0){
    index = index0;
    myChildren = new ArrayList();
    myLeaves = new ArrayList();
    segmentLength = totalLength/nSegments;
    startingThickness = startingThickness0;
    
    theta0 = thetaI;
    thetas = new float[nSegments]; //r,theta
    thetas[0] = theta0;

    
    for(int i=1; i<nSegments; i++){
      thetas[i] = thetas[i-1]+(-maxdThetaWander+maxdThetaWander)/2 + ((i > nSegments/2) ? random(-0.15,0.15) : 0);//random(-maxdThetaWander,maxdThetaWander);
    }
    
    for(int i=1; i<nSegments; i++){
      if(startingThickness*(1-(float)i/nSegments)> minBranchThickness &&
         (float)i/nSegments > minSpawnDistance &&
          0 <= branchSpawnOdds){//add a baby!
            float dThetaSign = i%2 == 0 ? -1 : 1;//randomSign();
            myChildren.add(new branch(i, thetas[i]+dThetaSign*(mindThetaSplit+maxdThetaSplit)/2,//random(mindThetaSplit, maxdThetaSplit),
                                      totalLength*(1-(float)i/nSegments)*(1-dBranchSize+1+dBranchSize)/2,//random(1-dBranchSize,1+dBranchSize),
                                      startingThickness*(1-(float)i/nSegments)));
            if(1<=branchSpawnOddsOfSecond)
              myChildren.add(new branch(i, thetas[i]-dThetaSign*(mindThetaSplit+maxdThetaSplit)/2,//random(mindThetaSplit, maxdThetaSplit),
                                        totalLength*(1-(float)i/nSegments)*(1-dBranchSize+1+dBranchSize)/2,//random(1-dBranchSize,1+dBranchSize),
                                        startingThickness*(1-(float)i/nSegments)));
          }
    }
    
    //this'll add leaves!
    for(int i=1; i<nSegments; i++){
      if(startingThickness*(1-(float)i/nSegments)< maxBranchSizeForLeaves &&
         random(0,1)<leafSpawnOdds)
         myLeaves.add(new leaf(thetas[i],i));
    }
  }

  //gives the location of the nth node
  float[] getCoordsOf(int n){
    float x2 = x;
    float y2 = y;
    for(int i=0; i<n; i++){
      x2 += segmentLength*cos(thetas[i]);
      y2 += segmentLength*sin(thetas[i]);
    }
    return new float[]{x2,y2};
  }
  
  void rotate(float dTheta){
    //rotate myself
    for(int i=0; i<nSegments; i++)
      thetas[i]+=dTheta;
    //rotate my leaves
    for(int i=0; i<myLeaves.size(); i++)
      ((leaf)myLeaves.get(i)).rotate(dTheta);
    //rotate my children
    for(int i=0; i<myChildren.size(); i++)
      ((branch)myChildren.get(i)).rotate(dTheta);
  }
  
  void rotateDueToWind(){
    float dThetaWind = (thetas[0]-windDirection);
    float dThetaBranch = (thetas[0]-theta0);
    
    if(dThetaWind>PI)
      dThetaWind = -(TWO_PI-dThetaWind);
    else if(dThetaWind<-PI)
      dThetaWind = TWO_PI+dThetaWind;

    if(dThetaBranch>PI)
      dThetaBranch = -(TWO_PI-dThetaBranch);
    else if(dThetaBranch<-PI)
      dThetaBranch = TWO_PI+dThetaBranch;
    
    float forceOfBranch = -(thetas[0]-theta0)*startingThickness/maxBranchThickness;
    float forceOfWind = -windVelocity*sin(dThetaWind)/10;
    //this moves the branch
    rotate((forceOfBranch+forceOfWind)/20);

    //this moves the leaves!
    for(int i=0; i<myLeaves.size(); i++)
      ((leaf)myLeaves.get(i)).moveFromWind();

    //this'll rotate the children
    for(int i=0; i<myChildren.size(); i++)
      ((branch)myChildren.get(i)).rotateDueToWind();
  }
  
  void drawBranch(float[] coords){
    x = coords[0];
    y = coords[1];
    float x1 = x;
    float y1 = y;
    float x2,y2;
    for(int i=0; i<nSegments; i++){
      x2 = x1+segmentLength*cos(thetas[i]);
      y2 = y1+segmentLength*sin(thetas[i]);
      strokeWeight(startingThickness*(1-(float)i/nSegments));
      line(x1,y1,x2,y2);
      x1 = x2;
      y1 = y2;
    }
    //draw children
    for(int i=0; i<myChildren.size(); i++)
      ((branch)myChildren.get(i)).drawBranch(getCoordsOf(((branch)myChildren.get(i)).index));
  }
  
  void drawLeaves(float[] coords){
    
    for(int i=0; i<myLeaves.size(); i++)
    {
      ((leaf)myLeaves.get(i)).draw(getCoordsOf(((leaf)myLeaves.get(i)).index));
    }
    //draw children's leaves
    for(int i=0; i<myChildren.size(); i++)
      ((branch)myChildren.get(i)).drawLeaves(coords);
  }
}


int randomSign(){ //returns +1 or -1
  float num = random(-1,1);
  if(num==0)
    return -1;
  else
    return (int)(num/abs(num));
}
int nLeafPoints = 8;
float[] xOutline;
float[] yOutline;
void defineLeafOutline(){
  xOutline = new float[nLeafPoints];
  yOutline = new float[nLeafPoints];
  for(int i=0; i<=nLeafPoints/2;i++){
    xOutline[i] = 2*i/(float)(nLeafPoints);
    yOutline[i] = (-pow((xOutline[i]-.5),2)+.25)*2;
    
    if(i>0 && i<=nLeafPoints/2){
      xOutline[nLeafPoints-i] = xOutline[i];
      yOutline[nLeafPoints-i] = -yOutline[i];
    }
  }
}


float tempx;
float tempy;
//leafWidth is a fraction of leafLength
void drawLeaf(float x, float y, float leafLength, float leafWidth, float direction){
  beginShape();
  for(int i=0; i<xOutline.length;i++){
    tempx = xOutline[i]*cos(direction)*leafLength-yOutline[i]*sin(direction)*leafWidth*leafLength;
    tempy = xOutline[i]*sin(direction)*leafLength+yOutline[i]*cos(direction)*leafWidth*leafLength;
    vertex(x+tempx,y+tempy);
  }
  endShape(CLOSE);
}


class leaf{
  float theta0,dTheta,myWidth,myLength;
  int index;
  color leafColor;
  
  leaf(float thetaBranch, int index0){
    theta0 = thetaBranch+randomSign()*random(PI/6,PI/3);
    dTheta = 0;
    myWidth = random(minWidth,maxWidth);
    myLength = random(minLength,maxLength);
    index = index0;
    
    leafColor = color(5,153+random(-70,20),3,transparency); // default
  }

  void moveFromWind(){
    float dThetaWind = (((theta0+dTheta)-windDirection)%TWO_PI);
    if(dThetaWind>PI)
      dThetaWind = -(TWO_PI-dThetaWind);
    else if(dThetaWind<-PI)
      dThetaWind = TWO_PI+dThetaWind;

    theta0 = (theta0+TWO_PI)%TWO_PI;

    float forceOfLeaf = -(dTheta)/PI;
    float forceOfWind = -windVelocity*sin(dThetaWind);

    dTheta += (forceOfLeaf+forceOfWind)/15;
  }
  
  void rotate(float deltaTheta){
    dTheta+=deltaTheta;
  }

  void draw(float x, float y){
    drawLeaf(x, y, myLength, myWidth, theta0+dTheta);
  }

  
  void draw(float[] coord){
    fill( leafColor );
    draw(coord[0],coord[1]);
  }
}

float windDirection;
float windVelocity;
float velIncrement = 0.04;
float velOff = 0;
void updateWind(){
  velOff+= velIncrement;
  windDirection = (windDirection+random(-1,-1)*.001+TWO_PI)%TWO_PI;
  windVelocity = 2*noise(velOff)-1;
}


void setCount( int _count ) {
  count = _count;
  count *= 60;
  count = count % 600;
  initializeTreeValues();
}