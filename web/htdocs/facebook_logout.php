<?php
	require './sdk/src/facebook.php';

	$facebook = new Facebook(array(
	  'appId'  => '384092135034196',
	  'secret' => 'e7b1dd0f5e465e2404ca2f870e1b6eb3',
	));

	$user = $facebook->getUser();

	if ($user) {
		try {
			$src = $facebook->getLogoutUrl();
		} catch (FacebookApiException $e) {
			echo "<script>alert( 'Facebook sdk error' );</script>";
			$user = null;
		}
	}
	else {
		echo "<script>location.href='./index.php';</script>";
		exit;
	}

	session_destroy();

//	echo "<script>location.href='./index.php';</script>";
	echo "<script>location.href='$src';</script>";
?>