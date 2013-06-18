<?php
	require './sdk/src/facebook.php';
	$facebook_appId = "384092135034196"; // App를 등록하고 나면 알수 있는 App ID
	$facebook_secret = "e7b1dd0f5e465e2404ca2f870e1b6eb3"; // App를 등록하고 나면 알수 있는 App Secret
	// Create our Application instance (replace this with your appId and secret).
	$facebook = new Facebook(array(
		'appId'  => $facebook_appId,
		'secret' => $facebook_secret,
		'cookie' => true, 
	));

	// Get User ID
	$user = $facebook->getUser(); // App에 로그인이 되어 있는지 확인하기 위해서 유저의 정보를 요청합니다.
	// Login or logout url will be needed depending on current user state.
	if ($user) { // 만일 유저정보가 있다면 해당정보 디비에 입력
		try {
		// Proceed knowing you have a logged in user who's authenticated.
			$user_profile = $facebook->api('/me'); // 유저 프로필을 가져 옵니다.
			$_mb_facebook_access_token = "fb_".$facebook_appId."_access_token"; // 토큰ID 
			$_mb_facebook_user_id = "fb_".$facebook_appId."_user_id"; // 유저ID
			// 페이스북에서는 로그인정보(access_token, user_id)가 fb_App ID_access_token 형식으로 세션에 저장됩니다.

			// 로그인정보(access_token, user_id)와 유저 프로필 디비에 저장 하고 창닫기
			/*$up = mysql_query("UPDATE `member` SET 
			mb_facebook_access_token='".trim($_SESSION[$_mb_facebook_access_token])."', 
			mb_facebook_user_id='".trim($_SESSION[$_mb_facebook_user_id])."', 
			mb_facebook_username='".mysql_real_escape_string($user_profile[username])."', 
			mb_facebook_name='".mysql_real_escape_string($user_profile[name])."',
			mb_facebook_link='".mysql_real_escape_string($user_profile[link])."'
			WHERE mb_id='".$mb[mb_id]."' ");*/
			echo "<script>window.opener.location.reload();window.close();</script>";
		} catch (FacebookApiException $e) {
		//error_log($e);
			$user = null;
			$loginUrl = $facebook->getLoginUrl( array(
				'scope' => 'email,offline_access,publish_stream,user_birthday,user_location,user_work_history,user_about_me,user_hometown,user_photos,publish_actions,read_stream,friends_likes'
			));
		}
	} else { // 만일 유저정보가 없다면 페이스북 로그인 URL을 생성
		$loginUrl = $facebook->getLoginUrl( array(
			'scope' => 'email,offline_access,publish_stream,user_birthday,user_location,user_work_history,user_about_me,user_hometown,user_photos,publish_actions,read_stream,friends_likes'
		)); 
	}

	// 로그인이동
	//header('Location: '.$loginUrl);
	echo "<script>location.href = '$loginUrl';</script>";
	exit;
?>