<?php
	include "../setup.php";

	$user_idx = $_REQUEST['user_idx'];
	$page = $_REQUEST['page'];

	$query = "select * from mug_gallery where user_idx='$user_idx' limit $page, 8";
	$result = mysql_query( $query );

	if( $result )
	{
		$rows = array();

		$query = "select * from mug_gallery where user_idx='$user_idx'";
		$result_count = mysql_query( $query );

		$rows['count'] = mysql_num_rows( $result_count );
		while( $row = mysql_fetch_array( $result ) )
			$rows['mug'][] = $row;

		$json = json_encode( $rows );
	}
	else
		$json = 'fail';

	echo $json;
?>