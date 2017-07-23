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
	    .button {
                background-color: #4CAF50; / Green /
                border: none;
                color: white;
				width:240px;
				text-align: left;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                cursor: pointer;
                border-radius: 6px:important;
            }
            .button4 {background-color: #e7e7e7; color: black;} / Gray /
            .search{
                display:inline-block;
            }
            .event_search{
                width:250px;
                height:15px;
                border-radius: 6px;
            	display:inline-block;
            }

		</style>

	</head>
	<?php
	       $this->load->view('default/head/console_page.php');
	?>
	<body class="login-layout admin-body">
	<?php $this->load->view('default/nav/console_page.php'); ?>

	  <div class="container-fluid" id="main-container">
		<div id="main-content">
			<div class="row-fluid">
				<div class="span1"></div>

				<div class="span3"><span>orderBy</span>
					<select id="orderbyday" style="margin-bottom:0px;">

						<option value="">Beginning</option>
						<option value="1">Last Day</option>
						<option value="2">Last 2 Days</option>
						<option value="7">Last Week</option>
						<option value="10">Last 10 Days</option>
						<option value="14">Last 2 Weeks</option>
						<option value="30">Last Month</option>
						<option value="45">Last 45 Days</option>
						<option value="60">Last 2 Months</option>
						<option value="75">Last 75 Days</option>
						<option value="100">Last 100 Days</option>
						<option value="365">Last Years</option>

					</select>
				</div>
				<div class="span3">
					<select id="orderbyasc" style="margin-bottom:0px;">
						<option value="0">ascending</option>
						<option value="1">descending</option>
					</select>
				</div><div class="span3">
					<form id="event_search" method="post" action ="#">
					   <input type="text" class="search event_search" placeholder="input the event name">
					</form>
				</div>
			</div>
			<div class="row-fluid" style="margin-top:20px;">
				<div class="span1"></div>
				<div class="span10">
					<table class="table table-striped events-table" id="table_data">
						<thead>
							<tr>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<?php
								foreach($info as $val){
									?>
									<tr>
										<td><input type="checkbox" class="deleteitem" name="<?php //echo $val['objectId'] ?>"></td>
										<td><img width="150px" height="150px" src="<?php echo base_url('public'),'/images/',$val['images']; ?>"></img></td>
										<td><?php  ?><br>
										    <?php echo $val['create_date'] ?><br>
											<b>Date Created:</b> <?php echo $val['create_date'] ?><br>
											<b>User:</b> <?php echo $val['name'] ?><br>
										</td>
										<td>
											<button class="button button4" onclick="metadataevents('<?php //echo $val['objectId']; ?>');"><span style="color:blue;"><img src="<?php echo base_url('public'),'/img/Metata_Data_Download.png'; ?>">&nbsp;</span>Download Metadata</button><br><br>
											<button class="button button4" onclick="window.print();"><span style="color:blue;"><img src="<?php echo base_url('public'),'/img/PDF.png'; ?>">&nbsp;</span>Download PDF</button>
										</td>
									</tr>
									<?php
								}
							?>
						</tbody>
					</table>
				</div>
				<br><br><br>
				<div class="row">
					<div class="span10" style="margin-left:10%;margin-top:3%;">
						<div class = "row">
							<div class="span4" style="text-align:center;"> <a style="min-width:300px;" href="javascript:deleteevent();" class="btn btn-small btn-primary menu-button">Delete Event</a> </div>
							<div class="span4" style="text-align:center;"> <a style="min-width:300px;" class="btn btn-small btn-primary menu-button editevent">Edit Event</a> </div>
							<div class="span4" style="text-align:center;"> <a style="min-width:300px;" class="btn btn-small btn-primary menu-button" href="<?php echo base_url(); ?>manage/clientmanagementconsolesupport">Support</a> </div>

						</div>
					</div>
				</div>
				<div style="text-align:center;margin-top:2%;">
					<a href="<?php echo base_url(); ?>manage/console_menu" class="btn btn-small btn-primary menu-button">
						Console Menu
					</a>
				</div>
			</div>
		</div>
	</div>

	<div class="hide metadatamodal container-fluid" style="background-color:#ddd;width:80%;margin:auto;margin-top:10%;">
		<div class="row-fluid">
			<div class="span12" style="text-align:left;"><br><br>
				<button onclick="metadataedit();"><h3>Download List</h3></button>
				<button onclick="gobacklist();"><h3>Go Back</h3></button><br>
			</div>
		</div>
		<div class="row-fluid">

			<div class="span6" style="text-align:left;padding-top:20px;">
				<div class="checkbox">
					<label><input type="checkbox" class="downloadlist"  value="1">Creator</label>
				</div>
				<div class="checkbox">
					<label><input type="checkbox" class="downloadlist" value="2">Date Created</label>
				</div>
				<div class="checkbox">
					<label><input type="checkbox" class="downloadlist" value="3">Time Created</label>
				</div>
				<div class="checkbox">
					<label><input type="checkbox" class="downloadlist" value="4">Number of Participants</label>
				</div>
				<div class="checkbox">
					<label><input type="checkbox" class="downloadlist" value="5">Tagged Users</label>
				</div>
				<div class="checkbox">
					<label><input type="checkbox" class="downloadlist" value="6">Size</label>
				</div>
				<div class="checkbox">
					<label><input type="checkbox" class="downloadlist" value="7">Location</label>
				</div>
				<div class="checkbox">
					<label><input type="checkbox" class="downloadlist" value="8">Number of Activity Sheets</label>
				</div>
				<div class="checkbox">
					<label><input type="checkbox" class="downloadlist" value="9">Title of Activity Sheets</label>
				</div>
			</div>
			<div class="span6" style="padding-top:20px;">
				<label>Activity Sheets</label>
				<div class="checkbox">
					<label><input type="checkbox" class="activitylist" value="10">Activity Sheet Time</label>
				</div>
				<div class="checkbox">
					<label><input type="checkbox" class="activitylist" value="11">Activity Sheet Date</label>
				</div>
				<div class="checkbox">
					<label><input type="checkbox" class="activitylist" value="12">Activity Sheet Title</label>
				</div>
				<div class="checkbox">
					<label><input type="checkbox" class="activitylist" value="13">Activity Sheet List</label>
				</div>
				<div class="checkbox">
					<label><input type="checkbox" class="activitylist" value="14">Activity Sheet Description</label>
				</div>
				<div class="checkbox">
					<label><input type="checkbox" class="activitylist" value="15">Activity Sheet Comment</label>
				</div>
			</div>
		</div>
		<div class="row-fluid">
			<div class="span12" style="text-align:left;"><br>
				<input type = 'hidden' id="metadataID" value="" />
				<button onclick="selectall();"><h3>Select All</h3></button>
				<button onclick="deselectall();"><h3>Deselect All</h3></button><br><br>
			</div>
		</div>
	</div>

	<div class="hide">
		<form method="post"id="frmmetalist" action="<?php echo base_url(); ?>events/eventmetadata">
			<input type="hidden" name="id" id="id" value="">
			<input type="hidden" name="metaviewlist" id="metaviewlist" value="">
		</form>
	</div>



	<?php $this->load->view('default/footer/console_page.php'); ?>
	<script src="<?php echo base_url('public') ?>/js/datatable.js"></script>

	<script type="text/javascript">

		$('#table_data').DataTable();
		$('#orderbyday').val(<?php echo $day; ?>);
		$('#orderbyasc').val(<?php echo $asc; ?>);

		function metadataevents(id){
			$("#main-container").hide(1000);
			$(".metadatamodal").show(1000);
			$("#metadataID").val(id);
		};
		function gobacklist(){
			$("#main-container").show(1000);
			$(".metadatamodal").hide(1000);
		}
		function selectall(){
			$( ".downloadlist" ).each(function(){
				this.checked = true;
			});
		}
		function deselectall(){
			$( ".downloadlist" ).each(function(){
				this.checked = false;
			});
		}
		function deleteevent(){
			if (window.confirm("Are you sure want to delete selected event(s)?")) {

				var deletelist = [];
				$( ".deleteitem" ).each(function(){
					if(this.checked == true)
						deletelist.push(this.name);
				});
				$.post( "<?php echo base_url(); ?>events/eventdelete",{ deletelist: deletelist}, function( data ) {
					//console.log(data);
					window.location.href="<?php echo base_url(); ?>events/index";
				});
			}
		}
		function metadataedit(){
			var metadatalist = "";
			$( ".downloadlist" ).each(function(){
				if(this.checked == true)
					metadatalist += this.value+",";
			});
			$( ".activitylist" ).each(function(){
				if(this.checked == true)
					metadatalist += this.value+",";
			});
			$("#id").val($("#metadataID").val());
			$("#metaviewlist").val(metadatalist);
			$("#frmmetalist").submit();

		}
		$( "#orderbyday" ).change(function() {
			window.location.href="<?php echo base_url(); ?>events/index?day="+$('#orderbyday').val()+"&asc="+$('#orderbyasc').val();
		});
		$( "#orderbyasc" ).change(function() {
			window.location.href="<?php echo base_url(); ?>events/index?day="+$('#orderbyday').val()+"&asc="+$('#orderbyasc').val();
		});

	</script>
	</body>
</html>
