var pictureSource;   // picture source
var destinationType;

var page = 0; // gallery page

function onLoad() {
	document.addEventListener("deviceready", onDeviceReady, false);
}

function onDeviceReady() {
	// Camera
	pictureSource=navigator.camera.PictureSourceType;
	destinationType=navigator.camera.DestinationType;
	
	// backbutton
	document.addEventListener("backbutton", onBackKeyDown, false);
	document.addEventListener("menubutton", function() { $('#menuTap').click() }, false);
	
	// orientaion
	var screenOrientation = function() {}
	screenOrientation.prototype.set = function(str, success, fail) {
		cordova.exec(null, null, "ScreenOrientation", "set", [str]);
	};
	window.screenOrientation = new screenOrientation();

	//To change screen orientation use
	window.screenOrientation.set("landscape");
	
	// facebook
	/*
	document.addEventListener('deviceready', function() {
	  FB.init({
		  appId: 'appid',
		  nativeInterface: CDV.FB,
		  useCachedDialogs: false
	  });
  
	  FB.getLoginStatus(handleStatusChange);
  
	  authUser();
	  updateAuthElements();
  });*/

	if( window.localStorage.getItem( "email" ) == 'null' ) {
		navigator.notification.alert('잘못된 접근입니다.', function(){}, 'Treestana', '확인');
		location.href = 'login.html';
	}
	

	var time = 1000;
	$('#textarea div').each( function() {
		$(this).transition({
			delay: time}, time, 'linear', function() {
				$(this).css( 'display', 'block' );
				$(this).lettering().animateLetters({opacity:0},null,{randomOrder:false,time:500,reset:false});
			}
		);

		time += 1000;
	});

	$('#textarea').transition({delay: time+2000}, time+2000, 'linear' );
	$('#textarea').transition({opacity: 0}, 1000, 'linear', function() {
//		$('#textarea div').css( 'display', 'none' );
	});
}

function mugCapture() {
	navigator.camera.getPicture(onMugCaptureSuccess, function(){}, { quality: 50,
		destinationType: destinationType.FILE_URL });
}

function onMugCaptureSuccess( imageURI ) {
	var date = new Date() - 1;
	var options = new FileUploadOptions();
	options.fileKey="mug";
	options.fileName=date.toString() + '.jpg';
	options.mimeType="image/jpeg";

	var params = {};
	params.value1 = "mug";
	params.value2 = "mug";

	options.params = params;

	var ft = new FileTransfer();

	ft.upload(imageURI, encodeURI("http://wlogin.hosting.paran.com/treestana/api/app_insert_mug_gallery.php?user_idx="+window.localStorage.getItem( 'idx' )), win, fail, options);
}

function win(r) {
	navigator.notification.alert('성공적으로 인증되었습니다.', function(){}, 'Treestana', '확인');
}

function fail(error) {
	navigator.notification.alert('인증 실패했습니다.', function(){}, 'Treestana', '확인');
}

function onBackKeyDown() {
	navigator.notification.confirm('종료 하시겠습니까?', onBackKeyDownMsg, 'Treestana', '취소, 종료');
}

function onBackKeyDownMsg(button) {
	if(button == 2) {
		navigator.app.exitApp();
	}			
}

function logout() {
	navigator.notification.confirm('로그아웃 하시겠습니까?', onLogout, '로그아웃', '아니요, 예');
}
function onLogout(button) {
	if( button == 2 ) {
		window.localStorage.setItem( "email", null );
		window.localStorage.setItem( "idx", null );
		window.localStorage.setItem( "password", null );
		window.localStorage.setItem( "name", null );
		$('#fade').css( 'display', 'block' );
		$('#fade').transition({delay:1400,opacity:1}, 1000, 'linear', function() {
			location.href = 'login.html';
		});
	}
}

function galleryOpen() {

	$.ajax( 'http://wlogin.hosting.paran.com/treestana/api/app_get_user_mug_gallery.php', {
		type: 'post',
		dataType: 'json',
		data: ({"user_idx":window.localStorage.getItem( "idx" ),"page":page*8}),
		success: function(json) {
			if( json != 'fail' )
			{
				$('#mugGalleryWrapper').html('');
				var len = 0;
				if( json['count']-page*8 >= 8 )
					len = 8;
				else
					len = json['count']-page*8;

				for( var i=0 ; i<len ; i++ )
					$('#mugGalleryWrapper').append( "<img src='http://wlogin.hosting.paran.com/treestana/"+json['mug'][i]['photo_path']+"' class='mugGalleryImg' />" );

				if( page > 0 ) {
					$('#mugGalleryPrev').css( 'display', 'block' );
					$('#mugGalleryPerv').attr( 'value', page-1 );
				}
				else
					$('#mugGalleryPrev').css( 'display', 'none' );

				if( json['count']-page*8 >= 8 )	{
					$('#mugGalleryNext').css( 'display', 'block' );
					$('#mugGalleryNext').attr( 'value', page+1 );
				} else
					$('#mugGalleryNext').css( 'display', 'none' );
			}
			else
			{
				navigator.notification.alert('갤러리를 가져오는데 실패했습니다.', function(){}, 'Treestana', '확인');
			}
		}
	});

	$('#blur').click();
	$('#mugGallery').css( 'display', 'block' );
	$('#mugGallery').transition({
	  opacity: 1
	}, 700, 
	  'linear'
	);
}

function galleryClose() {
	$('#mugGallery').transition({
	  opacity: 0
	}, 700, 
	  'linear', function() {
		  $('#mugGalleryWrapper').html('');
		  $('#mugGallery').css( 'display', 'none' );
	  }
	);
}

$(window).load( function() {
	var state = 0;
	
	$('#fade').transition({delay:1400,opacity:0}, 1000, 'linear', function() {
		$('#fade').css( 'display', 'none' );
	});
	
	$('#mugMenu').click( function() {
		if( state == 1 ) mugCapture();
	});
	$('#galleryMenu').click( function() {
		if( state == 1 ) galleryOpen();
	});
	$('#exitMenu').click( function() {
		if( state == 1 ) logout();
	});
	
	$('#mugText').click( function() {
		if( state == 1 ) mugCapture();
	});
	$('#galleryText').click( function() {
		if( state == 1 ) galleryOpen();
	});
	$('#exitText').click( function() {
		if( state == 1 ) logout();
	});

	$('#mugGalleryPrev').click( function() {
		page--;
		galleryOpen();
	});
	$('#mugGalleryNext').click( function() {
		page++;
		galleryOpen();
	});

	$('#mugGalleryExitButton').click( function() {
		galleryClose();
	});
	
	$( '#blur' ).click( function() {
		if( state == 1 ) {
			state = 0;
			
			$('#mugText').transition({
				delay: 100,
				x: '-=150',
				opacity: '0'}, 400,
				'linear' 
			);
			$('#galleryText').transition({
				delay: 200,
				x: '-=160',
				opacity: '0'}, 400,
				'linear' 
			);
			$('#exitText').transition({
				delay: 300,
				x: '-=120',
				opacity: '0'}, 400,
				'linear' 
			);
			
			$('#menuTap').transition({
			  rotate: '-=45deg'
			}, 200, 
			  'easeOutQuad'
			);
			
			$('#mugMenu').transition({
			  rotate: '-=20deg',
			  x: '+=490',
			  y: '+=60',
			  opacity: 0,
			  delay: 200
			}, 700, 
			  'easeOutQuad'
			);

			$('#galleryMenu').transition({
			  rotate: '-=15deg', 
			  x: '+=360',
			  y: '+=45',
			  opacity: 0,
			  delay: 100}, 700, 
			  'easeOutQuad'
			);

			$('#exitMenu').transition({
			  rotate: '-=10deg',
			  x: '+=230',
			  y: '+=30',
			  opacity: 0
			  }, 700, 
			  'easeOutQuad'
			);
			
			$('#blur').transition({
			  opacity: '0'}, 700, 
			  'linear'
			);
		}
	});
	
	$( '#menuTap' ).click( function() {
		if( state == 0 ) {
			state = 1;
			$('#menuTap').transition({
			  rotate: '+=45deg'
			}, 200, 
			  'easeOutQuad'
			);
			
			$('#mugText').transition({
				delay: 300,
				x: '+=150',
				opacity: '1'}, 400,
				'linear' 
			);
			$('#galleryText').transition({
				delay: 200,
				x: '+=160',
				opacity: '1'}, 400,
				'linear' 
			);
			$('#exitText').transition({
				delay: 100,
				x: '+=120',
				opacity: '1'}, 400,
				'linear' 
			);
			
			$('#mugMenu').transition({
			  rotate: '+=20deg',
			  x: '-=490',
			  y: '-=60',
			  opacity: 1
			}, 700, 
			  'easeOutQuad'
			);
			
			$('#galleryMenu').transition({
			  rotate: '+=15deg',
			  x: '-=360',
			  y: '-=45',
			  opacity: 1,
			  delay: 100}, 700, 
			  'easeOutQuad'
			);
			
			$('#exitMenu').transition({
			  rotate: '+=10deg',
			  x: '-=230',
			  y: '-=30',
			  opacity: 1,
			  delay: 200}, 700, 
			  'easeOutQuad'
			);
			
			$('#blur').transition({
			  opacity: '0.5'}, 700, 
			  'linear'
			);
		} else {
			state = 0;
			
			$('#mugText').transition({
				delay: 100,
				x: '-=150',
				opacity: '0'}, 400,
				'linear' 
			);
			$('#galleryText').transition({
				delay: 200,
				x: '-=160',
				opacity: '0'}, 400,
				'linear' 
			);
			$('#exitText').transition({
				delay: 300,
				x: '-=120',
				opacity: '0'}, 400,
				'linear' 
			);
			
			$('#menuTap').transition({
			  rotate: '-=45deg'
			}, 700, 
			  'easeOutQuad'
			);
			
			
			$('#mugMenu').transition({
			  rotate: '-=20deg',
			  x: '+=490',
			  y: '+=60',
			  opacity: 0,
			  delay: 200
			}, 700, 
			  'easeOutQuad'
			);

			
			$('#galleryMenu').transition({
			  rotate: '-=15deg',
			  x: '+=360',
			  y: '+=45',
			  opacity: 0,
			  delay: 100}, 700, 
			  'easeOutQuad'
			);
			
			
			$('#exitMenu').transition({
			  rotate: '-=10deg',
			  x: '+=230',
			  y: '+=30',
			  opacity: 0
			  }, 700, 
			  'easeOutQuad'
			);
			
			$('#blur').transition({
			  opacity: '0'}, 700, 
			  'linear'
			);
		}
	});
});