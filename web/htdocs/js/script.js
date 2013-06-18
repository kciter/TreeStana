
$(document).ready( function() {

	$("#about").mCustomScrollbar({
		scrollButtons:{
			enable:true
		},
		autoHideScrollbar:true,
		theme:"dark-thick"
	});

	$("#timeline").mCustomScrollbar({
		scrollButtons:{
			enable:true
		},
		autoHideScrollbar:true,
		theme:"dark-thick",
		callbacks:{
			onTotalScroll:function(){
				appendTextOnTotalScroll();
			}
		}
	});
	function appendTextOnTotalScroll(){
		var c = $("#timelineContents").find(".itemLast");
		var h = '';
		
		$.ajax( '../ajaxGetTimeline.php?count='+count, {
			dataType: 'json',
			success: function(json) {

				var data = '';

				for( var i=0 ; i<json['count'] ; i++ ) {
					data = data + "<div style='width:90%;padding:7px;border:1px solid black;border-radius:3px;margin:10px auto;'>";
					data = data + json['data'][i]['datetime'] + "<br /><b>" + json['data'][i]['name'] + "</b> 님이 ";
					if( json['data'][i]['type'] == 0 )
						data = data + "자연을 위해 일회용 종이컵대신 머그컵을 사용하셨습니다. <br /><hr />";
					else
						data = data + "자신의 방을 공개 하셨습니다. <br />";
					data = data + "<a class='fancybox-thumbs' href=./'"+json['data'][i]['contents']+"' style='color:#f53;text-decoration:none;'>- 사진보기</a></div>";
				}
				
				c.before( data );
				count += 5;

				$("#timeline").mCustomScrollbar( "update" );
			}
		});
	}

	$("#flowerGallery").mCustomScrollbar({
		scrollButtons:{
			enable:true
		},
		autoHideScrollbar:true,
		theme:"dark-thick"
	});
	$("#mugGallery").mCustomScrollbar({
		scrollButtons:{
			enable:true
		},
		autoHideScrollbar:true,
		theme:"dark-thick"
	});

	allHide();

	$('#about').css( 'display', 'none' );
	$('#mugGllery').css( 'display', 'none' );
	$('#flowerGallery').css( 'display', 'none' );
	$('#timeline').css( 'display', 'none' );

	$('#toAbout').click( function() {

		if( $('#about').css( 'display' ) == 'none' ) {
			allHide();
			$('#about').css( 'display', 'block' );
			$('#about').css( 'opacity', 0.8 );
		} else {
			allHide();
		}
	});
	$('#toMugGallery').click( function() {

		if( $('#mugGallery').css( 'display' ) == 'none' ) {
			allHide();
			$('#mugGallery').css( 'display', 'block' );
			$('#mugGallery').css( 'opacity', 0.8 );
		} else {
			allHide();
		}
	});
	$('#toFlowerGallery').click( function() {

		if( $('#flowerGallery').css( 'display' ) == 'none' ) {
			allHide();
			$('#flowerGallery').css( 'display', 'block' );
			$('#flowerGallery').css( 'opacity', 0.8 );
		} else {
			allHide();
		}
	});
	$('#toTimeline').click( function() {

		if( $('#timeline').css( 'display' ) == 'none' ) {
			allHide();
			$('#timeline').css( 'display', 'block' );
			$('#timeline').css( 'opacity', 0.8 );
		} else {
			allHide();
		}
	});

	$('#about').hover( function() {
		$(this).css( 'opacity', 1 );
	}, function() {
		$(this).css( 'opacity', 0.8 );
	});

	$('#mugGallery').hover( function() {
		$(this).css( 'opacity', 1 );
	}, function() {
		$(this).css( 'opacity', 0.8 );
	});
	$('#flowerGallery').hover( function() {
		$(this).css( 'opacity', 1 );
	}, function() {
		$(this).css( 'opacity', 0.8 );
	});

	$('#timeline').hover( function() {
		$(this).css( 'opacity', 1 );
	}, function() {
		$(this).css( 'opacity', 0.8 );
	});

	function allHide() {

		$('#about').css( 'display', 'none' );
		$('#mugGallery').css( 'display', 'none' );
		$('#flowerGallery').css( 'display', 'none' );
		$('#timeline').css( 'display', 'none' );

		$('#about').css( 'opacity', 0 );
		$('#mugGallery').css( 'opacity', 0 );
		$('#flowerGallery').css( 'opacity', 0 );
		$('#timeline').css( 'opacity', 0 );
	}

});