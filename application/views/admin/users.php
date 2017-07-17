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
       <h1>User list</h1>

       <table class="table">
        <tr>
          <th>Id</th>
          <th>User Name</th>
          <th>Name</th>
          <th>Email</th>
          <th>Active</th>
          <th>Reset Password</th>

        </tr>
        <?php foreach ($list as $user_item): ?>
          <tr>
            <td><?php echo $user_item['id'] ?></td>
            <td><?php echo $user_item['username'] ?></td>
            <td><?php echo $user_item['name'] ?></td>
            <td><?php echo $user_item['email'] ?></td>
            <td><?php echo $user_item['active'] ?></td>
            <td><?php echo $user_item['reset_password'] ?></td>
          </tr>
        <?php endforeach; ?>
      </table>
      <a class="btn btn-default" href="adduser" role="button">Add User</a>
    </div>
  </body>
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
  <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</html>
