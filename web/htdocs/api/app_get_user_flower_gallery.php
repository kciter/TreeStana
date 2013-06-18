<?php
	include "../setup.php";

	$user_idx = $_REQUEST['user_idx'];

	$query = "select * from flower_gallery where user_idx='$user_idx'";
	$result = mysql_query( $query );

	if( $result )
	{
		$rows = array();

		$rows['count'] = mysql_num_rows( $result );
		while( $row = mysql_fetch_row( $result ) )
			$rows['flower'][] = $row;

		$json = json_encode( $rows );
	}
	else
		$json = 'fail';

	echo $json;
?>