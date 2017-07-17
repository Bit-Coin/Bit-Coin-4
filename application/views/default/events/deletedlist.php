<!DOCTYPE html>
<html lang="en">
	<head>		
		<link href="<?php echo base_url('public') ?>/css/datatable.css" rel="stylesheet" />	

		<style>
			#DataTables_Table_0_wrapper{
				margin:auto;
			}
			#main-container{
				margin-top:10%;
			}
		</style>

	</head>
	<?php $this->load->view('default/head/console_page.php'); ?>
	<body class="login-layout admin-body">
	<?php $this->load->view('default/nav/console_page.php'); ?>
  	
	  <div class="container-fluid" id="main-container">
		<div id="main-content">
			<div class="row-fluid" style="margin-top:20px;">
				<div class="span1"></div>
				<div class="span10">
					<table class="table table-striped events-table" id="table_data">
						<thead>
							<tr>
								<th>User</th>
								<th>Event Title</th>
								<th>Date Created</th>
								<th>Date Deleted</th>
                                <th>Time Left</th>
							</tr>
						</thead>
						<tbody>
							<?php														
								foreach($info as $val){
									?>
									
                                    <tr>
                                        <td><?php echo $val['username'] ?></td>
                                        <td><?php echo $val['eventname'] ?></td>
                                        <td><?php echo $val['createdAt'] ?></td>
                                        <td><?php echo $val['deletedAt'] ?></td>
                                        <td><?php
                                        if($val['deletedAt'] !=""){
                                            $today = date("Y")*12+date('m');                                            
                                            $deleteday=explode('-',$val['deletedAt']);
                                            $deleteddate = intval($deleteday[0])*12+intval($deleteday[1]);
                                            $leftmonth = 12 - ($today-$deleteddate);
                                        }
                                        else{
                                            $leftmonth = "Unknown";
                                        }                                            
                                        echo $leftmonth." Months";
                                        ?></td>
                                    </tr>
									<?php
								}
							?>
						</tbody>
					</table>
				</div>
				
				<div style="text-align:center;margin-top:50px;">
					<a href="<?php echo base_url(); ?>manage/contentmanager" class="btn btn-small btn-primary menu-button">
						Content Manager
					</a>
				</div>				
			</div>
		</div>
	</div>



	<?php $this->load->view('default/footer/console_page.php'); ?>
	<script src="<?php echo base_url('public') ?>/js/datatable.js"></script>
	
	<script type="text/javascript">
		$('#table_data').DataTable();
	</script>
	</body>
</html>
