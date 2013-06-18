<!doctype html>
<html lang="ko">
	<head>
		<title> Treestana </title>
		<meta charset='UTF-8' />
 
		<link rel="stylesheet" type="text/css" href="./css/layout.css" />

		<script src="js/modernizr-2.0.6-min.js"></script>
		<script type="text/javascript" src="./fencybox/lib/jquery-1.9.0.min.js"></script>
		<script type="text/javascript" src='./js/indexTree.js'></script>

		<script>
			$(document).ready(function(){
				if(!Modernizr.input.placeholder) {
					$("input[placeholder]").each(function() {
						var placeholder = $(this).attr("placeholder");

						$(this).val(placeholder).focus(function() {
							if($(this).val() == placeholder) {
								$(this).val("")
							}
						}).blur(function() {
							if($(this).val() == "") {
								$(this).val(placeholder)
							}
						});
					});
				} // Modernizr placeholder
			});
		</script>
	</head>
	<body>
		<h1 style="margin-top:0px;margin-bottom:10px;font-size:40pt;text-align:center;" class='title'>Treestana</h1>

		<canvas id="canvasOne" width="600" height="530" style="display:block;margin: 0 auto;"></canvas>
                
		<div id="content">
			<form id="login" action="./login.php" method="post">
				<ul>
					<li>
						<input id="email" name="email" placeholder="Your Email" title="Your Email" type="email" value="" required />
						<label for="email">Your Email</label>
					</li>
					<li>
						<input id="password" name="password" placeholder="Your Password" title="Your Password" type="password" value="" required />
						<label for="password">Your Password</label>
					</li>
					<li>
						<input id="submit" name="submit" type="submit" value="Login">
					</li>
				</ul>
			</form>
		</div>
	</body>
</html>



