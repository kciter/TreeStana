<?php
	include "../setup.php";

	ini_set('gd.jpeg_ignore_warning', 1);

	function img_resize( $dest_path, $resize ) {
		if (file_exists($dest_path)) 
		{ 
			$size = getimagesize($dest_path); 
			// 이미지의 폭 또는 높이가 설정값 보다 크다면 이미 업로드 된 이미지 리사이즈 
			if ($size[0] > $resize || $size[1] > $resize) { 

						  //가로,세로에 맞춰 사이즈 제한 
				if ($size[0] < $resize){          
				  if ($size[1] > $resize){      
					  $height = $resize;
					  $width = ceil( $size[0] * ( $resize / $size[1] ) );    
					} else {                    
					  $height = $size[1];      
					  $width = $size[0];      
					} 
				}else{                                                      
				  if (( $size[1] / $size[0] ) > 1){ 
					  $height = $resize ;                                        
					  $width = ceil( $size[0] * ( $resize / $size[1] ) );    
					  }else{                                                        
					  $width = $resize ;                                              
					  $height = ceil( $size[1] * ( $resize / $size[0] ) );    
				  } 
			} 
				  
			$cfile = imagecreatefromjpeg($dest_path); 
			$dest = imagecreatetruecolor($width, $height); 
			imagecopyresampled($dest, $cfile, 0, 0, 0, 0, $width, $height, $size[0], $size[1]); 
			imagejpeg($dest, $dest_path, 90); } 
		}
	}

	$user_idx = $_REQUEST['user_idx'];

	$upload_dir = 'upload/mug/';
	$upload_file = $upload_dir . time() . $_FILES['mug']['name'];

	if( move_uploaded_file( $_FILES['mug']['tmp_name'], '../'.$upload_file ) ) {

		img_resize( '../'.$upload_file, 500 );

		$query = "insert into mug_gallery ( user_idx, photo_path ) values ( $user_idx, '$upload_file' )";
		$result = mysql_query( $query, $db );

		$query = "insert into timeline ( user_idx, contents, datetime, type ) values ( $user_idx, '$upload_file', now(), 0 )";
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