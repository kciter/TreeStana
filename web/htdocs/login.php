<?php
	session_start();
?>
<meta charset='UTF-8' />
<?php
	include "setup.php";
	$query = "SELECT * FROM users WHERE email = '$_POST[email]' and password = '$_POST[password]'";
	$result = mysql_query( $query, $db );
	$row = mysql_fetch_array( $result );

	if( $row[email] == $_POST[email] && $row[password] == $_POST[password] )
	{
		$_SESSION[email] = $row[email];
		$_SESSION[password] = $row[password];
		$_SESSION[name] = $row[name];
		echo "<script> alert('안녕하세요. $_SESSION[name] 님.');location.href='./main.php';</script>";
	}
	else
	{
		echo "<script> alert('로그인 실패.');history.back(-1);</script>";
		exit;
	}

?>