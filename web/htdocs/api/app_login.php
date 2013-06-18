<?php
	include "../setup.php";

	$email = $_REQUEST['email'];
	$password = $_REQUEST['password'];

	if( !$email || !$password )
	{
		$json = json_encode( 'fail' );
		echo $json;
		exit;
	}

	$query = "select * from users where email='$email' and password='$password'";

	$result = mysql_query( $query, $db );

	$row = mysql_fetch_array( $result );

	if( $row['email'] == $email && $row['password'] == $password )
		$json = json_encode( $row );
	else
		$json = json_encode( 'fail' );

	echo $json;
?>