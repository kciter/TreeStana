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

	if( $_SESSION['name'] )
		echo "<script>location.href='./main.php';</script>";
?>
<!doctype html>
<html lang="ko">
	<head>
		<title> Treestana </title>
		<meta charset='UTF-8' />
 
		<link href='http://fonts.googleapis.com/css?family=PT+Sans:400,700,400italic|PT+Serif:400,700' rel='stylesheet' type='text/css'>
		<link rel="stylesheet" type="text/css" href="./css/indexLayout.css" />

		<script src="js/modernizr-2.0.6-min.js"></script>
		<script type="text/javascript" src="./fencybox/lib/jquery-1.9.0.min.js"></script>
		<script type="text/javascript" src='./js/indexTree.js'></script>

		<script>
			function facebookLogin() {
				window.open( './facebook_redirect.php', 'Facebook', 'resizable=no, scrollbars=no, menubar=no, toolbar=no, width=650, height=320, left='+(screen.width/2-325)+', top='+(screen.height/2-160) );
			}

			$(document).ready( function() {
				$('#wrapper').css( 'margin-top', ($(window).height()/2-270)+'px' );
				$(window).resize( function() {
					$('#wrapper').css( 'margin-top', ($(window).height()/2-270)+'px' );
				});
			});
		</script>
	</head>
	<body>
		<div id="wrapper">
			<header class="header">
				
			</header>

			<canvas id="canvasOne" width="600" height="530"></canvas>
					
			<section class="section">
				<div class="title">
					TreeStana
				</div>
				<article id="login" class="article">
					<form action="./login.php" method="post" class="form">
						<input id="email" name="email" placeholder="이메일" type="email" value="" required /><br />
						<input id="password" name="password" placeholder="패스워드" type="password" value="" required />
						<input id="submit" name="submit" type="submit" value="로그인" class='button submit' />
						<input type='checkbox' /> <span>ID 저장</span> | <span>비밀번호 찾기</span>
					</form>
				</article>

				<article id="join" class="article">
					지금 트리스타나에 가입하세요!
					<hr />
					<form action="./join.php" method="post" class="form">
						<input id="text" name="name" placeholder="이름" type="text" value="" required /><br />
						<input id="email" name="email" placeholder="이메일"type="email" value="" required /><br />
						<input id="password" name="password" placeholder="패스워드" type="password" value="" style='width:290px' required />
						<div class='submit facebookJoin' onClick='facebookLogin();'>페이스북으로 로그인하기</div>
						<input id="submit" name="submit" type="submit" value="지금 가입하기" class='button submit joinSubmit' />
					</form>
				</article>
			</section>
			<div style="clear:both;"></div>
		</div>

		<footer class="footer">
			<span><a>Treestana</a></span>
			<span style="float:right;margin-right:20px;">희희락락 - 장문익, 이선협, 천성환</span>
		</footer><!-- FOOTER -->
	</body>
</html>



