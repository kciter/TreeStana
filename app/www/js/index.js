function onLoad() {
	//location.href = 'test.html';
	document.addEventListener("deviceready", onDeviceReady, false);
}

function onDeviceReady() {
	document.addEventListener("backbutton", onBackKeyDown, false);
	
	var screenOrientation = function() {}
	screenOrientation.prototype.set = function(str, success, fail) {
		cordova.exec(null, null, "ScreenOrientation", "set", [str]);
	};
	window.screenOrientation = new screenOrientation();

	//To change screen orientation use
	window.screenOrientation.set("portrait");
}

function onBackKeyDown() {
	navigator.notification.confirm('종료 하시겠습니까?', onBackKeyDownMsg, 'Treestana', '취소, 종료');
}

function onBackKeyDownMsg(button) {
	if(button == 2) {
		navigator.app.exitApp();
	}			
}

$(document).ready( function() {
	$('.wrapper').height( screen.availHeight/2 );
	
	$('.wrapper').transition({opacity:1}, 1000, 'linear' );
	$('.wrapper').transition({delay:1000}, 1000, 'linear' );
	$('.wrapper').transition({opacity:0}, 1000, 'linear', function() {
		if( window.localStorage.getItem( "email" ) != 'null' )
			location.href = 'main.html';
		else
			location.href = 'login.html';
	});
});