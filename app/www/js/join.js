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
}

function onBackKeyDown() {
	$('#success').css( 'display', 'block' );
	$('#success').transition( { opacity: 1 }, 1000, 'linear', function() {
		location.href = './login.html';
	});
}

function onBackKeyDownMsg(button) {
	if(button == 2) {
		navigator.app.exitApp();
	}
}

function join() { 
	$.ajax( 'http://wlogin.hosting.bizfree.kr/z/api/app_join.php', {
		type: 'post',
		dataType: 'json',
		data: ({"email":$('#email').val(),"password":$('#password').val(),"name":$('#name').val()}),
		success: function(json) {
			if( json == 'success' )
			{
				navigator.notification.alert('회원가입 되었습니다.', function(){}, '회원가입 성공', '확인');
				$('#success').css( 'display', 'block' );
				$('#success').transition( { opacity: 1 }, 1000, 'linear', function() {
					location.href = './login.html';
				});
			}
			else
			{ 
				if( json == 'fail_empty' )
					navigator.notification.alert('비어있는 항목이 있습니다.', function(){}, '회원가입 실패', '확인');
				else if( json == 'fail_overlap' )
					navigator.notification.alert('중복된 아이디입니다.', function(){}, '회원가입 실패', '확인');
				else if( json == 'fail_insert' )
					navigator.notification.alert('서버 오류입니다.', function(){}, '회원가입 실패', '확인');
				else
					navigator.notification.alert('알수없는 오류', function(){}, '회원가입 실패', '확인');

				$('#email').focus();
			}
		}
	});
}

$(document).ready( function() {
	$('#wrapper').height( screen.availHeight/2 );
	$('#success').transition({opacity:0}, 1000, 'linear', function() {
		$('#success').css( 'display', 'none' );
	});
});