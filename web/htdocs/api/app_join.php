<?php
	include "../setup.php";

	$name = $_REQUEST['name'];
	$email = $_REQUEST['email'];
	$password = $_REQUEST['password'];

	if( !$email || !$password || !$name )
	{
		$json = json_encode( 'fail_empty' );
		echo $json;
		exit;
	}

	$query = "select * from users where email='$email'";

	$result = mysql_query( $query, $db );

	$row = mysql_fetch_array( $result );

	if( $row['email'] != $email ) {
		$json = json_encode( $row );
		
		$query = "insert into users ( email, password, name ) values ( '$email', '$password', '$name' )";
		$result = mysql_query( $query, $db );

		if( $result )
			$json = json_encode( 'success' );
		else
			$json = json_encode( 'fail_insert' );
	}
	else
		$json = json_encode( 'fail_overlap' );

	echo $json;
?>