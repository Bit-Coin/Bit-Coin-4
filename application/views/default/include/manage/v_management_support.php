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
	<link rel="stylesheet" href="<?php echo base_url('public') ?>/css/support.css" />
	<body>
		<div class="container">
			<?php
			$data["active_option"] = "support";
			$this->load->view('default/nav/public_page.php', $data );
			?>
			</nav>
    		<h1 class="title text-center mgb-2em">Support Page</h1>
			<div class="support-wrapper bg-color1">
				<div id="main-menu">
					<h2 class="title text-center mgb-1em">How Do You Want To Proceed?</h2>
					<div class="description text-center mgb-2em">We're here to help. Please select one option</div>
					<div class="wrapper-box text-center">
						<div class="dp-inline-block">
							<div class="bg-blue fl-left box-property">
								<h3 class="title mgb-1em">
									<i class="fa fa-floppy-o" aria-hidden="true"></i>
									Help Desk
								</h3>
								<div class="description mgb-15em">
									Search or browse for help topics next to this page.
								</div>
								<button class="btn border-circle" onclick="show_faq()">
									Browse All Topics
								</button>
							</div>
							<div class="bg-green fl-left box-property">
								<h3 class="title mgb-1em">
									<i class="fa fa-envelope" aria-hidden="true"></i>
									Contact Us
								</h3>
								<div class="description mgb-15em">
									FAQ's didn't answer your question. Send us a message!
								</div>
								<a class="btn border-circle" href="mailto:support@vistechmgmt.zendesk.com">
									Support Email
								</a>
							</div>
							<div class="clearfix marginbottom100"></div>
						</div>
					</div>
				</div>
				<div id="faq-menu">
					<div class="container-fluid">
						<div class="row pull-right">
							<div class="back-button-wrapper">
								<button class="btn btn-default" onclick="show_menu()" role="button">Back to support menu</button>
							</div>
						</div>
					</div>
					<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingOne">
								<h4 class="panel-title">
									<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
										Signing Up and Getting Started
									</a>
								</h4>
							</div>
							<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
								<div class="panel-body">
							        <ol>
										<li>Creating an Account &amp; Username
											<ul>
												<li>How do I create an IntelliSpeX account?</li>
												IntelliSpeX is a mobile app that can be downloaded on iOS compatible phones and tablets.<br/>
												To create an account:
												<ol>
													<li>Download the IntelliSpeX app for iOS from the App Store.</li>
													<li>Once the app has been installed, tap <img src="<?php echo base_url('public') ?>/img/support-home.png" class="icon"/> to open it.</li>
													<li>Tap Sign Up, then enter your email address, desired Username and Password. Fill out your profile info and select a photo.</li>
													<li>You are also given the option to Sign Up by Connecting with Facebook or Google account.</li>
												</ol>
												<li>How do I change my profile information?</li>
												<ol>
													<li>Go to your profile by tapping the profile icon in the bottom right.</li>
													<li>Tap on the settings icon <img src="<?php echo base_url('public') ?>/img/support-settings.png" class="icon"/> on the top right corner.</li>
													<li>Select Profile and then Edit my account.Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.</li>
												</ol>
											</ul>
										</ol>
									</ol>
								</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingTwo">
								<h4 class="panel-title">
									<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
										Creating an Event on IntelliSpeX
									</a>
								</h4>
							</div>
							<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
								<div class="panel-body">
							        <ol>
										<li>Creating an Event and sharing the event
											<ul>
												<li>How do I create an event?<br/>
												<ol>
													<li>Tap on the <img src="<?php echo base_url('public') ?>/img/support-create.png" class="icon"/> icon and choose your event thumbnail (cover photo).</li>
													<li>Tap the checkmark button and then <b>Done.</b></li>
													<li>Name your event.</li>
													<li>Then Tap upload.</li>
												</ol>
												<li>How do I share the event with others?</li>
												<ol>
													<li>After you created the event, tap on the <img src="<?php echo base_url('public') ?>/img/support-label.png" class="icon"/> icon and choose them from your friend’s list.</li>
													<li>You can also tag them by Taping the <img src="<?php echo base_url('public') ?>/img/support-label.png" class="icon"/>icon when you first create your event.</li>
												</ol>
												<li>How do I become friends with someone?</li>
												<ol>
													<li>Tap on the <img src="<?php echo base_url('public') ?>/img/support-friends.png" class="icon"/> icon on the bottom menu bar.</li>
													<li>Search for the user you want to add using the <b>Search Bar</b>.</li>
													<li>Then add them by Taping the <img src="<?php echo base_url('public') ?>/img/support-plus.png" class="icon"/> icon.</li>
													<li>Make sure the friend you are adding also adds you back.</li>
												</ol>
											</ul>
										</ol>
									</ol>
								</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingThree">
								<h4 class="panel-title">
									<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
										Using features on IntelliSpeX
									</a>
								</h4>
							</div>
							<div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
								<div class="panel-body">
									<ol>
										<li>Using features on IntelliSpeX
											<ul>
												<li>How do I use the Toggle Feature?</li>
												<ol>
													<li>Tap on your event.</li>
													<li>Tap the <img src="<?php echo base_url('public') ?>/img/support-toggle.png" class="icon"/> feature.</li>
													<li>This will change the order of the postings in your event (oldest to newest or newest to oldest).</li>
												</ol>
												<li>How do I change the order of postings in an event?</li>
												<ol>
													<li>Tap on the event you would like to make the change.</li>
													<li>On the <b>Thumbnail</b> photo tap on the icon and scroll down.</li>
													<li>Tap on the <b>Move</b> and then scroll down to the posting you would like to move.</li>
													<li>Then press on <img src="<?php echo base_url('public') ?>/img/support-menu.png" class="icon"/> the icon to the right of the post and drag your photo up or down.</li>
												</ol>
											</ul>
										</ol>
									</ol>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br/>
		<br/>
		<br/>
		<br/>
		<?php $this->load->view('default/footer/public_page.php');?>
	</body>
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
	<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script>
	function show_faq()
	{
		$('#main-menu').hide();
		$('#faq-menu').show();
	}

	function show_menu()
	{
		$('#main-menu').show();
		$('#faq-menu').hide();
	}

	$( document ).ready(function()
	{
		$('#faq-menu').hide();

		$('#accordion').collapse({
	  		toggle: true
		})
	});
	</script>
</html>
