<!DOCTYPE html>
<html lang="en">
	<head>
	<meta charset="utf-8" />
	<title>IntelliSpeX</title>
	<meta name="description" content="Support page" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
	<!-- <link rel="stylesheet" href="<?php echo base_url('public') ?>/assets/css/font-awesome.min.css" /> -->
	<script src="https://use.fontawesome.com/3d7f954615.js"></script>
	<link rel="stylesheet" href="<?php echo base_url('public') ?>/css/general.css" />
	<link rel="stylesheet" href="<?php echo base_url('public') ?>/css/login.css" />
	<body class="login-layout">
		<div class="container">
			<?php
			$data["active_option"] = "login";
			$this->load->view('default/nav/public_page.php', $data);
		    ?>
		</div>
		<div class="container mgt-12x mgb-4em">
			<div  id="login-modal" >
				<div class="modal-dialog">
					<div class="loginmodal-container">
						<h1>Login to Your Account</h1><br>
						<form action='<?php echo base_url(); ?>manage/console_menu' method='post'>
							<?php if ( validation_errors() != "" ) : ?>
							<div class="alert alert-danger" role="alert">
								<?php echo validation_errors(); ?>
							</div>
							<?php endif; ?>
							<div class="radio">
								<label>
									<input type="radio" checked="checked" value="3" name="role">
									Client console
								</label>
							</div>
							<div class="radio">
								<label>
									<input type="radio" checked="checked" value="1" name="role">
									Corporation Administrator
								</label>
							</div>
							<div class="radio">
								<label>
									<input type="radio" value="2" name="role">
									Application Administrator
								</label>
							</div>
							<input type="text" name="username" placeholder="Username">
							<input type="password" name="password" placeholder="Password">
							<input type="submit" name="submit" class="login loginmodal-submit" value="SUBMIT">
							<div class="login-help pull-right">
								<a href="<?php echo base_url(); ?>manage/reset_password">Reset Password</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<footer id="footer-v6" class="footer-v6">
			<div class="copyright">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<p class="color-white center">Copyright © 2016 IntelliSpeX - <span data-localize="copyright.all_rights">All Rights Reserved</span></p>
						</div>
					</div>
				</div>
			</div>
		</footer>
	</body>
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
	<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</html>
