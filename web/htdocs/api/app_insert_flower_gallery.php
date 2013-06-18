<?php
	include "../setup.php";

	$user_idx = $_REQUEST['user_idx'];

	$upload_dir = '../upload/flower/';
	$upload_file = $upload_dir . time() . $_FILES['flower']['name'];

	if( move_uploaded_file( $_FILES['flower']['tmp_name'], $upload_file ) ) {

		$query = "insert into flower_gallery ( user_idx, photo_path ) values ( $user_idx, '$upload_file' )";
		$result = mysql_query( $query, $db );

		$query = "insert into timeline ( user_idx, contents, datetime, type ) values ( $user_idx, '$upload_file', now(), 1 )";
		$sub_result = mysql_query( $query, $db );

		if( $result &&  $sub_result )
			$json = 'success';
		else
			$json = 'fail';
	} else {
		$json = 'fail';
	}

	echo $json;
?>