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
            <h1>Reset Client Password</h1><br>
            <div class="alert alert-warning" role="alert">
              SUCCESS!!! The Password Reset link has been sent to the administrator Email
            </div>
          </div>
        </div>
      </div>
    </div>
    <?php $this->load->view('default/footer/public_page.php');?>
  </body>
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
  <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</html>