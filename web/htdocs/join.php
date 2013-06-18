<?php
	session_start();

	include "setup.php";
	$query = "SELECT * FROM users WHERE email = '$_POST[email]'";
	$result = mysql_query( $query, $db );
	$row = mysql_fetch_array( $result );

	if( $row[email] )
		echo "<script> alert('이미 가입했습니다.');history.back(-1);</script>";
	else
	{
		$query = "insert into users ( email, password, name ) values ( '$_POST[email]', '$_POST[password]', '$_POST[name]' )";
		$result = mysql_query( $query, $db );
		if( $result )
			echo "<script> alert('가입 성공');location.href='./index.php';</script>";
		exit;
	}

?>