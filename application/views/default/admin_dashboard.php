<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>IntelliSpeX</title>
    <meta name="description" content="User login page" />

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- basic styles -->
    <link href="<?php echo base_url('public') ?>/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="<?php echo base_url('public') ?>/assets/css/bootstrap-responsive.min.css" rel="stylesheet" />

    <link rel="stylesheet" href="<?php echo base_url('public') ?>/assets/css/font-awesome.min.css" />
    <link rel="stylesheet" href="<?php echo base_url('public') ?>/css/main.css" />
    <!--[if IE 7]>
      <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
    <![endif]-->


    <!-- page specific plugin styles -->


    <!-- ace styles -->
    <link rel="stylesheet" href="<?php echo base_url('public') ?>/assets/css/ace.min.css" />
    <link rel="stylesheet" href="<?php echo base_url('public') ?>/assets/css/ace-responsive.min.css" />
    <!--[if lt IE 9]>
      <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
    <![endif]-->

  </head>

  <body class="login-layout">
    <h2 class="col-sm-3"><img class="irc_mut iUyhD38Z_yik-HwpH6ZlgJaI" onload="google.aft&amp;&amp;google.aft(this)" src="<?php echo base_url('public') ?>/images/logo.JPG" width="60" height="60" style="margin-top: 0px;"></i> <span style="color : #00aaff;">IntelliSpeX</span></h2>
    <h2 class="col-sm-6"><span class="red"><?php echo $function_name; ?></span></h2>
    <h2 class="col-sm-3"></i> <span class="red"><?php echo $username; ?></span></h2>
  <div class="container-fluid" id="main-container">
    <div id="main-content">
      <div class="row-fluid">
        <div class="span12">

          <div class="login-container">

            <div class="row-fluid">
              <div class="center">

              </div>
            </div>

            <div class="space-6"></div>

            <div class="row-fluid">

              <div class="position-relative">


                <div id="login-box" class="visible widget-box no-border">

                  <div class="widget-body">
                    <div class="widget-main">

                      <div class="space-6"></div>

                      <form action='<?php echo base_url(); ?>manage/reset_password_form/<?php echo $pram; ?>' method='post'>

                        <fieldset> 
                        <?php foreach($links as $key => $link ): ?>
                          <div><a href="<?php echo base_url(); ?>manage/<?php echo $key ?>"><?php echo $link ?></a></div>
                        <?php endforeach; ?>

                        </fieldset>
                      </form>
                    </div><!--/widget-main-->
                  </div><!--/widget-body-->

                </div><!--/login-box-->

              </div><!--/position-relative-->

            </div>


          </div>


        </div><!--/span-->
      </div><!--/row-->
    </div>
  </div><!--/.fluid-container-->


  <!-- basic scripts -->
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  <script type="text/javascript">
    window.jQuery || document.write("<script src='assets/js/jquery-1.9.1.min.js'>\x3C/script>");
  </script>


  <!-- page specific plugin scripts -->


  <!-- inline scripts related to this page -->

  <script type="text/javascript">

    function show_box(id) {
        $('.widget-box.visible').removeClass('visible');
        $('#' + id).addClass('visible');
    }

  </script>

</body>
</html>
