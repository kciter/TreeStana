
<?php
	include "./setup.php";

	$query = "select * from timeline order by idx limit $_REQUEST[count], 5";
	$result = mysql_query( $query );

	if( !$result )
	{
		echo json_encode( "fail" );
		exit;
	}

	$rows = array();

	$i = 0;
	while( $row = mysql_fetch_array( $result ) ) {
		$query = "select * from users where idx=$row[user_idx]";
		$sub_result = mysql_fetch_array( mysql_query( $query ) );

		$row['name'] = $sub_result['name'];

		$row['datetime'] = date( 'Y년 m월 d일', strtotime($row['datetime']));

		$rows['data'][] = $row;
		$i++;
	}

	$rows['count'] = $i;
	
	echo json_encode( $rows );
?>