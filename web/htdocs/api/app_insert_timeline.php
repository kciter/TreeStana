<?php
	include "../setup.php";

	$user_idx = $_REQUEST['user_idx'];
	$contents = $_REQUEST['contents'];
	$type = $_REQUEST['type'];

	$query = "insert into timeline ( user_idx, contents, datetime, type ) values ( $user_idx, '$contents', now(), $type )";

	$result = mysql_query( $query, $db );

	if( $result )
		$json = 'success';
	else
		$json = 'fail';

	echo $json;
?>