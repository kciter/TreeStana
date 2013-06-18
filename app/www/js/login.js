function onLoad() {
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
	
	$('#wrapper').height( screen.availHeight/2 );
	$('#success').transition({opacity:0}, 1000, 'linear', function() {
		$('#success').css( 'display', 'none' );
	});
}

function onBackKeyDown() {
	$('#email').blur();
	$('#password').blur();
	navigator.notification.confirm('종료 하시겠습니까?', onBackKeyDownMsg, 'Treestana', '취소, 종료');
}

function onBackKeyDownMsg(button) {
	if(button == 2) {
		navigator.app.exitApp();
	}
}

function login() {
	//$.ajax( './api/app_login.php', {
	$.ajax( 'http://wlogin.hosting.paran.com/treestana/api/app_login.php', {
		type: 'post',
		dataType: 'json',
		data: ({"email":$('#email').val(),"password":$('#password').val()}),
		success: function(json) {
			if( json != 'fail' )
			{
				window.localStorage.setItem( "email", json['email'] );
				window.localStorage.setItem( "idx", json['idx'] );
				window.localStorage.setItem( "password", json['password'] );
				window.localStorage.setItem( "name", json['name'] );
				
				$('#success').css( 'display', 'block' );
				$('#success').transition( { opacity: 1 }, 1000, 'linear', function() {
					location.href = './main.html';
				});
			}
			else
			{
				navigator.notification.alert('아이디혹은 비밀번호가 틀렸습니다.', function(){}, 'Treestana', '확인');
				$('#email').focus();
			}
		}
	});
}

function join() {
	$('#success').css( 'display', 'block' );
	$('#success').transition( { opacity: 1 }, 1000, 'linear', function() {
		location.href = './join.html';
	});
}

function facebook() {
} 