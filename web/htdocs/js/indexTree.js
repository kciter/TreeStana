window.addEventListener('load', eventWindowLoaded, false);	

function eventWindowLoaded() {
	canvasApp();	
}

function canvasSupport () {
  	return Modernizr.canvas;
}

function canvasApp() {
    		
		if (!canvasSupport()) {
			 return;
  		}


function  drawCanvas() {
		
		context.fillStyle = 'white';
		context.fillRect(0, 0, theCanvas.width, theCanvas.height);
		//Box
		context.strokeStyle = '#000000'; 
		context.strokeRect(1,  1, theCanvas.width-2, theCanvas.height-2);		
} 
 

/*unction drawTextTree () {
	
		context.font = "30px";
		context.fillText("Tree", 500, 500);
}*/

function drawScreenGround() {
		
		var centerX = 250.;
		var centerY = 470.;
		var width = 350.;
		var height = 70.;

  		context.beginPath();
  
  		context.moveTo(centerX, centerY - height/2.); // A1
  
		context.bezierCurveTo(
    		centerX + width/2., centerY - height/2., // C1
    		centerX + width/2., centerY + height/2., // C2
    		centerX, centerY + height/2.); // A2

  		context.bezierCurveTo(
    		centerX - width/2., centerY + height/2., // C3
    		centerX - width/2., centerY - height/2, // C4
    		centerX, centerY - height/2.); // A1
 
  		context.fillStyle = "black";
  		context.fill();
  		context.closePath();
}

function drawWhiteShadow () {
		var xstartPos = 225.;
		var ystartPos = 470.;

		context.beginPath();

		context.moveTo(xstartPos, ystartPos);

		context.quadraticCurveTo(220., 466., 203., 430.);
		
		context.lineWidth = 20.;

		context.closePath();

		context.strokeStyle = 'white';
		context.stroke();

		context.beginPath();

		context.moveTo(225., 470.);
		context.rect(xstartPos - 10., ystartPos + 5., 20., 10.);
		

		context.closePath();

		context.strokeStyle = 'black';
		context.stroke();

}

function  drawFirstBranch () {
		var t = ball.t;
		
		var cx = 3 * (Firstp1.x - Firstp0.x)
		var bx = 3 * (Firstp2.x - Firstp1.x) - cx;
		var ax = Firstp3.x - Firstp0.x - cx - bx;

		var cy = 3 * (Firstp1.y - Firstp0.y);
		var by = 3 * (Firstp2.y - Firstp1.y) - cy;
		var ay = Firstp3.y - Firstp0.y - cy - by;
		
		var xt = ax*(t*t*t) + bx*(t*t) + cx*t + Firstp0.x;
		var yt = ay*(t*t*t) + by*(t*t) + cy*t + Firstp0.y;
		
		ball.t += ball.speed;
		
		if (ball.t > 1) {
			ball.t = 1;
		} 

		//Draw circle moving

		context.beginPath();
		context.arc(xt,yt,8.,0,Math.PI*2,true);
		context.closePath();

		context.fillStyle = 'black';
		context.fill();

		/*context.shadowOffsetX = 10;
		context.shadowOffsetY = 10;
		context.shadowColor = 'grey';
		context.shadowBlur = 5;*/	
}

function  drawSecondBranch () {
		var t = ball.t;
		
		var cx = 3 * (Secondp1.x - Secondp0.x)
		var bx = 3 * (Secondp2.x - Secondp1.x) - cx;
		var ax = Secondp3.x - Secondp0.x - cx - bx;

		var cy = 3 * (Secondp1.y - Secondp0.y);
		var by = 3 * (Secondp2.y - Secondp1.y) - cy;
		var ay = Secondp3.y - Secondp0.y - cy - by;
		
		var xt = ax*(t*t*t) + bx*(t*t) + cx*t + Secondp0.x;
		var yt = ay*(t*t*t) + by*(t*t) + cy*t + Secondp0.y;
		
		ball.t += ball.speed;
		
		if (ball.t > 1) {
			ball.t = 1;
		} 

		//Draw circle moving

		context.beginPath();
		context.arc(xt,yt,6,0,Math.PI*2,true);
		context.closePath();

		context.fillStyle = 'black';
		context.fill();

		/*context.shadowOffsetX = 10;
		context.shadowOffsetY = 10;
		context.shadowColor = 'grey';
		context.shadowBlur = 5;*/	
}

function  drawThirdBranch () {
		var t = ball.t;
		
		var cx = 3 * (Thirdp1.x - Thirdp0.x)
		var bx = 3 * (Thirdp2.x - Thirdp1.x) - cx;
		var ax = Thirdp3.x - Thirdp0.x - cx - bx;

		var cy = 3 * (Thirdp1.y - Thirdp0.y);
		var by = 3 * (Thirdp2.y - Thirdp1.y) - cy;
		var ay = Thirdp3.y - Thirdp0.y - cy - by;
		
		var xt = ax*(t*t*t) + bx*(t*t) + cx*t + Thirdp0.x;
		var yt = ay*(t*t*t) + by*(t*t) + cy*t + Thirdp0.y;
		
		ball.t += ball.speed;
		
		if (ball.t > 1) {
			ball.t = 1;
		} 

		//Draw circle moving

		context.beginPath();
		context.arc(xt,yt,6,0,Math.PI*2,true);
		context.closePath();

		context.fillStyle = 'black';
		context.fill();

		/*context.shadowOffsetX = 10;
		context.shadowOffsetY = 10;
		context.shadowColor = 'grey';
		context.shadowBlur = 5;*/	
}

function  drawScreenMain_1 () {	
		var t = ball.t;
		
		var cx = 3 * (p1.x - p0.x);
		var bx = 3 * (p2.x - p1.x) - cx;
		var ax = p3.x - p0.x - cx - bx;

		var cy = 3 * (p1.y - p0.y);
		var by = 3 * (p2.y - p1.y) - cy;
		var ay = p3.y - p0.y - cy - by;
		
		var xt = ax*(t*t*t) + bx*(t*t) + cx*t + p0.x;
		var yt = ay*(t*t*t) + by*(t*t) + cy*t + p0.y;
		
		ball.t += ball.speed;
		
		if (ball.t > 1) {
			ball.t = 1;
		} 
		
		//Draw circle moving

		context.beginPath();
		context.arc(xt,yt,6.5,0,Math.PI*2,true);
		context.closePath();

		context.fillStyle = 'black';
		context.fill();

		/*context.shadowOffsetX = 10;
		context.shadowOffsetY = 10;
		context.shadowColor = 'grey';
		context.shadowBlur = 5;*/
}

function  drawScreenMain_2 () {
	
		var t = ball.t;
		
		var cx = 3 * (p1.x - p0.x);
		var bx = 3 * (p2.x - p1.x) - cx;
		var ax = p3.x - p0.x - cx - bx;

		var cy = 3 * (p1.y - p0.y);
		var by = 3 * (p2.y - p1.y) - cy;
		var ay = p3.y - p0.y - cy - by;
		
		var xt = ax*(t*t*t) + bx*(t*t) + cx*t + p0.x + 10;
		var yt = ay*(t*t*t) + by*(t*t) + cy*t + p0.y - 10;
		
		ball.t += ball.speed;
		
		if (ball.t > 1) {
			ball.t = 1;
		} 
		
		//Draw circle moving

		context.beginPath();
		context.arc(xt,yt,8.5,0,Math.PI*2,true);
		context.closePath();

		context.fillStyle = 'black';
		context.fill();

		/*context.shadowOffsetX = 10;
		context.shadowOffsetY = 10;
		context.shadowColor = 'grey';
		context.shadowBlur = 5;*/
}

function drawFirstLeaf ( color ) {

		context.beginPath();

		context.moveTo(280, 290);
		context.bezierCurveTo(320, 250, 330, 250, 400, 250);
		context.bezierCurveTo(380, 310, 380, 340, 310, 360);
		context.bezierCurveTo(440, 350, 470, 360, 550, 150);
		context.bezierCurveTo(460, 150, 300, 150, 280, 290);

		context.closePath();

		context.lineWidth = 5;
		context.fillStyle = color;
		context.strokeStyle = color;
		context.stroke();
		context.fill();
}

function drawSecondLeaf ( color ) {

		context.beginPath();

		context.moveTo(115, 170);
		context.bezierCurveTo(150, 170, 180, 190, 200, 220);
		context.bezierCurveTo(190, 120, 180, 90, 60, 50);
		context.bezierCurveTo(30, 140, 10, 190, 130, 260);
		context.bezierCurveTo(120, 250, 100, 230, 115, 170);

		context.closePath();
		
		context.lineWidth = 5;
		context.fillStyle = color ;
		context.fill();
		context.strokeStyle = color ;
		context.stroke();
}

function drawThirdLeaf ( color ) {
		context.beginPath();

		context.moveTo(330, 80);
		context.bezierCurveTo(320, 70, 300, 80, 280, 100);
		context.bezierCurveTo(280, 30, 340, 20, 420, 5);
		context.bezierCurveTo(400, 100, 350, 120, 320, 130);
		context.bezierCurveTo(330, 120, 340, 100, 330, 80);

		context.closePath();
		
		context.lineWidth = 5;
		context.fillStyle = color;
		context.fill();
		context.strokeStyle = color;
		context.stroke();
}

function drawFourthLeaf ( color  ) {
		context.beginPath();

		context.moveTo(225, 60);
		context.bezierCurveTo(240, 70, 250, 80, 250, 100);
		context.bezierCurveTo(260, 60, 270, 40, 215, 5);
		context.bezierCurveTo(190, 30, 170, 60, 210, 100);
		context.bezierCurveTo(210, 85, 210, 70, 225, 60);
		
		context.closePath();
		
		context.lineWidth = 5;
		context.fillStyle = color;
		context.fill();
		context.strokeStyle = color;
		context.stroke();
}

var p0 = {x:240, y:460};
var p1 = {x:150, y:350};
var p2 = {x:250, y:170};
var p3 = {x:305, y:110};

var Firstp0 = {x:210, y:350};
var Firstp1 = {x:300, y:330};
var Firstp2 = {x:320, y:310};
var Firstp3 = {x:350, y:290};

var Secondp0 = {x:220, y:270};
var Secondp1 = {x:150, y:240};
var Secondp2 = {x:130, y:200};
var Secondp3 = {x:130, y:200};

var Thirdp0 = {x:260, y:170};
var Thirdp1 = {x:260, y:160};
var Thirdp2 = {x:240, y:150};
var Thirdp3 = {x:230, y:90};

var ball = {x:0, y:0, speed:.0025, t:0};


var theCanvas = document.getElementById('canvasOne');
var context = theCanvas.getContext('2d');
var date = new Date();
var preSecond = date.getSeconds();
var mouseX = 0;
var mouseY = 0;
var mouseButton = -1;

context.translate(.5, 0.5);

document.getElementById( 'canvasOne').onmousemove = function(e) {
	mouseX = e.offsetX;
	mouseY = e.offsetY;
	mouseButton = 0;
};
document.getElementById( 'canvasOne').onmousedown = function(e) {
	mouseButton = 1;
};

function draw() {
	var nowDate = new Date();
	var nowSecond = nowDate.getSeconds();

	theCanvas.style.cursor = 'default';

	drawScreenGround();
	//drawWhiteShadow();

	drawScreenMain_1();	
	drawScreenMain_2();

	if( nowSecond - preSecond >= 3.1 )
		if( mouseX > 270 && mouseX < 500 &&
		    mouseY > 130 && mouseY < 400 )
			{
				drawFirstLeaf( "#FF6600" );
		}
		else
			drawFirstLeaf( "#00A300" );

	if( nowSecond - preSecond >= 4.1 )
		if( mouseX > 5 && mouseX < 190 &&
		    mouseY > 50 && mouseY < 250 )
		{
			drawSecondLeaf( "#FF6666" );
		}
		
		else
			drawSecondLeaf( "#33CC33" );

	if( nowSecond - preSecond >= 5.1 )
		if( mouseX > 270 && mouseX < 400 &&
		    mouseY > 5 && mouseY < 130 )
		{
			drawThirdLeaf( "#FF6699" );
		}
		else
			drawThirdLeaf( "#00CC00" );

	if( nowSecond - preSecond >= 6.1 )
	{
		if( mouseX > 190 && mouseX < 250 &&
		    mouseY > 5 && mouseY < 120 )
		{
			drawFourthLeaf( "#FF66FF" );
		}
		
		else
			drawFourthLeaf( "#00E600" );
	}

	drawFirstBranch();
	drawSecondBranch();
	drawThirdBranch();
	drawThirdBranch();
}

setInterval(  draw, 33 );
clearInterval( draw , 1000 * 4 );
//​
}