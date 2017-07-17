<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="<?php echo base_url().'manage/home'; ?>"><img class="img-responsive" src="<?php echo base_url('public') ?>/images/logo.png" alt="logo"><span>IntelliSpex</span></a>
		</div>
		<div id="navbar" class="navbar-collapse collapse" aria-expanded="false">
		<ul class="nav navbar-nav ">
			<li <?php if ( $active_option == "home" ) echo 'class="active"'; ?>><a href="<?php echo base_url().'manage/home'; ?>">Home</a></li>
			<li <?php if ( $active_option == "team" ) echo 'class="active"'; ?>><a href="<?php echo base_url().'manage/management_team'; ?>">Management Team</a></li>
			<li <?php if ( $active_option == "contact" ) echo 'class="active"'; ?>><a href="#contact">Contact Us</a></li>
			<li <?php if ( $active_option == "news" ) echo 'class="active"'; ?>><a href="#news">News</a></li>
			<li <?php if ( $active_option == "support" ) echo 'class="active"'; ?>><a href="<?php echo base_url().'manage/management_support'; ?>">Support</a></li>
			<li <?php if ( $active_option == "partners" ) echo 'class="active"'; ?>><a href="#partners">Partners</a></li>
			<li><a class="btn btn-md btn-success login-button" href="<?php echo base_url().'manage/console_menu'; ?>">Login</a></li>
		</ul>
		</div>
	</div>
</nav>