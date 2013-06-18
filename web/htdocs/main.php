<?php
	require './sdk/src/facebook.php';

	$facebook = new Facebook(array(
	  'appId'  => '384092135034196',
	  'secret' => 'e7b1dd0f5e465e2404ca2f870e1b6eb3',
	));

	$user = $facebook->getUser();

	if ($user) {
		try {
			$user_profile = $facebook->api('/me');
			$_SESSION['name'] = $user_profile['name'];
		} catch (FacebookApiException $e) {
			echo "<script>alert( 'Facebook sdk error' );</script>";
			$user = null;
		}
	}

	if( !$_SESSION['name'] )
		echo "<script>location.href='./index.php';</script>";

	include "./setup.php";
?>
<!DOCTYPE html>
<html lang='ko'>
	<head>
		<title>TreeStana</title>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">

			<link href='http://fonts.googleapis.com/css?family=PT+Sans:400,700,400italic|PT+Serif:400,700' rel='stylesheet' type='text/css'>
			<link rel="stylesheet" type="text/css" href="css/layout.css" />

			<style>
				#background { width: 100%; height: 110%; }
			</style>
			
			<script src="./js/processing.js" type="text/javascript"></script>
			<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script> -->
			<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>

			<script type="text/javascript" src="./fencybox/lib/jquery.mousewheel-3.0.6.pack.js"></script>
			<script type="text/javascript" src="./fencybox/source/jquery.fancybox.js?v=2.1.4"></script>
			<link rel="stylesheet" type="text/css" href="./fencybox/source/jquery.fancybox.css?v=2.1.4" media="screen" />
			<link rel="stylesheet" type="text/css" href="./fencybox/source/helpers/jquery.fancybox-buttons.css?v=1.0.5" />
			<script type="text/javascript" src="./fencybox/source/helpers/jquery.fancybox-buttons.js?v=1.0.5"></script>
			<link rel="stylesheet" type="text/css" href="./fencybox/source/helpers/jquery.fancybox-thumbs.css?v=1.0.7" />
			<script type="text/javascript" src="./fencybox/source/helpers/jquery.fancybox-thumbs.js?v=1.0.7"></script>
			<script type="text/javascript" src="./fencybox/source/helpers/jquery.fancybox-media.js?v=1.0.5"></script>
			<script type="text/javascript" src='./js/fencybox.js'></script>

			<link href="./css/jquery.mCustomScrollbar.css" rel="stylesheet" />
			<script src="./js/jquery.mCustomScrollbar.min.js"></script>

			<script src='http://airbnb.github.io/infinity/build/infinity.min.js'></script>

			<script src="./js/script.js"></script>
	</head>
	<body>
		<div class="wrapper">
			<span class="logout">
				<?php if( !$user ) : ?>
				<a href='./logout.php'>Logout</a>
				<?php else : ?>
				<a href='./facebook_logout.php'>Logout</a>
				<?php endif ?>
			</span>
			<header class="header">
				<h1 class="title">TreeStana</h1>
				<nav class="nav">
					<ul>
						<li id="toAbout">About</li><br />
						<li id="toTimeline">Timeline</li><br />
						<!-- <li id="toFlowerGallery">Flower Gallery</li><br /> -->
						<li id="toMugGallery">Mug Gallery</li><br />
					</ul>
				</nav>
			</header>

			<div class="section">
				<article id="timeline" class='article'>
					<div id="timelineContents">
						<?php
							$query = "select count(*) from timeline";
							$result = mysql_fetch_row(mysql_query( $query, $db ));
						?>
							총 <span style="color: red;font-size:1.5em;"><?=$result[0]?></span>명이 환경을 위해 머그컵을 사용했습니다.<br /><hr />
						
						<?php
							$query = "select * from timeline order by idx limit 10";
							$result = mysql_query( $query, $db );
							while( $row = mysql_fetch_array( $result ) ) {
								$query = "select * from users where idx=$row[user_idx]";
								$sub_result = mysql_fetch_array( mysql_query( $query, $db ) );

						?>
								<div style="width:90%;padding:7px;border:1px solid black;border-radius:3px;margin:10px auto;">
									<?=date('Y년 m월 d일', strtotime($row['datetime']))?><br />
									<b><?=$sub_result['name']?></b>
									<?php if( $row['type'] == 0 ) : ?>
										님이 자연을 위해 일회용 종이컵대신 머그컵을 사용하셨습니다. <br />
									<?php else : ?>
										님이 자신의 방을 공개 하셨습니다. <br />
									<?php endif ?>
										<a class="fancybox-thumbs" href="./<?=$row['contents']?>" style="color:#f53;text-decoration:none;">- 사진보기</a>
								</div>
						<?php
							}
						?>
						<div class='itemLast'></div>
					</div>
				</article>

				<article id="about" class='article'>
					<div align ="center"> 
						<br />
						<img src = "./images/mugcup.jpg" width = 300 height = 300><br />
						Cafe에서 머그컵을 사용하고, 스마트폰을 머그컵의 사진을 찍으세요
						<br />
						<br />
						<div align ="center"> 
						<img src = "./images/mobilehome.jpeg" width = 300 height = 300><br />
						스마트폰으로 자신만의 꽃을 키워보세요
						<br />
						<br/>
						<div align ="center"> 
						<img src = "./images/tree.jpg" width = 300 height = 300><br />
						웹에서 모두를 위한 나무를 함께 키워보세요
						<br />
						<br />
						<div align ="center"> 
						<img src = "./images/flowerpot.jpg" width = 300 height = 300><br />
						Flower Gallery에서 자신의 꽃을 공유하세요
						<br />
						<br />
						<div align ="center"> 
						<img src = "./images/mugcups.jpg" width = 300 height = 300><br />
						Mug Gallery에서 머그컵 사용 경험을 공유하세요
						<br />
						<br />
					</div>

				</article>

				<article id="flowerGallery" class='article'>
				</article>

				<article id="mugGallery" class='article'>
					<?php
						$query = "select * from mug_gallery";
						$result = mysql_query( $query );

						while( $row = mysql_fetch_array( $result ) ) {
					?>
							<a class="fancybox-thumbs" data-fancybox-group="mug" href="./<?=$row['photo_path']?>"><img src="<?=$row['photo_path']?>" alt="" width="150", height="150" /></a>
					<?php
						}
					?>
				</article>
			</div>
		</div>

		<footer class="footer">
			<span><a>Treestana</a></span>
			<span style="float:right;margin-right:20px;">희희락락 - 장문익, 이선협, 천성환</span>
		</footer><!-- FOOTER -->

		<canvas id="background" data-processing-sources="treesInWind.pde"></canvas>

		<?php
			$count = 0;

			$query = "select count(*) from mug_gallery";
			$result_count = mysql_query( $query );
			$count = mysql_fetch_row( $result_count );
		?>
		<script>
			var pjs;

			$(window).load(function() {
				getPjsInstance();
			});

			// obtain a reference to the processing sketch
			function getPjsInstance() {
				pjs = Processing.getInstanceById('background');
				pjs.setCount( <?=$count[0]?> );
			} 
	  </script>
	</body>
</html>