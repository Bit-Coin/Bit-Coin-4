<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>IntelliSpeX</title>
    <meta name="description" content="Support page" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/3d7f954615.js"></script>
    <link rel="stylesheet" href="<?php echo base_url('public') ?>/css/general.css" />
    <link rel="stylesheet" href="<?php echo base_url('public') ?>/css/home.css" />
  </head>
  <body>
    <div class="container">
      <h1>Add user</h1>

      <?php if (isset($message)) : ?>
      <div class="alert alert-success" role="alert">
        <?php echo $message ?>
      </div>
      <?php endif; ?>
      <?php if ( validation_errors() != "" ) : ?>
      <div class="alert alert-danger" role="alert">
        <?php echo validation_errors(); ?>
      </div>
      <?php endif; ?>

      <form class="form-horizontal" method="post" accept-charset="utf-8" action="save" >
        <div class="form-group">
          <label class="col-sm-2 control-label">User Name</label>
          <div class="col-sm-5">
            <input type="text" class="form-control" name="username" placeholder="User Name" value="<?php echo set_value('username'); ?>">
          </div>
        </div>
        <div class="form-group">
          <label for="inputPassword" class="col-sm-2 control-label">Name</label>
          <div class="col-sm-5">
            <input type="text" class="form-control" name="name" placeholder="Name" value="<?php echo set_value('name'); ?>">
          </div>
        </div>
        <div class="form-group">
          <label for="inputPassword" class="col-sm-2 control-label">Phone number</label>
          <div class="col-sm-5">
            <input type="text" class="form-control" name="phone" placeholder="Phone number" value="<?php echo set_value('phone'); ?>">
          </div>
        </div>
        <div class="form-group">
          <label for="inputPassword" class="col-sm-2 control-label">Email</label>
          <div class="col-sm-5">
            <input type="text" class="form-control" name="email" placeholder="Phone Email" value="<?php echo set_value('email'); ?>">
          </div>
        </div>
        <div class="form-group">
          <label for="inputPassword" class="col-sm-2 control-label">Temporary Password</label>
          <div class="col-sm-5">
            <input type="text" class="form-control" name="tempass" placeholder="Temporary Password" value="<?php echo set_value('tempass'); ?>" >
          </div>
        </div>

        <div class="form-group">
          <div class="col-sm-5 col-sm-offset-2">
            <input type="submit" class="btn btn-primary" name="submit">
            <input type="reset" class="btn btn-warning" name="cancel">
          </div>
        </div>
      </form>
      <a class="btn btn-default" href="users" role="button">Back to list</a>
    </div>
  </body>
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
  <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</html>
