<!DOCTYPE html>
<html lang="en">
	<?php $this->load->view('default/head/console_page.php'); ?>
	<link rel="stylesheet" href="<?php echo base_url('public') ?>/css/events.css" />
	<body class="login-layout admin-body">
	<?php $this->load->view('default/nav/console_page.php'); ?>
  	<div class="container-fluid" id="main-container">
		<div id="main-content">
			<div class="row-fluid">
				<div class="span12">
					<div class="widget-main">
						<div class="row-fluid">
							<div class="span10">

								<div id="event_area">
									<ul>
									    <li data-id="1">1</li>
									    <li data-id="2">2</li>
									    <li data-id="3">3</li>
									    <li data-id="4">4</li>
									</ul>
								</div>

								<div class="clear">
									<a href="#" onclick="script:deletesheets();" class="btn btn-small btn-primary menu-button">
										Delete Selected Sheets
									</a>
								</div>
								<div class="clear">
									<a href="<?php echo base_url(); ?>manage/console_menu" class="btn btn-small btn-primary menu-button">
										Console Menu
									</a>
								</div>
							</div>
							<div class="span2">
								<a class="btn btn-small btn-primary menu-button menu-logout-button" href="<?php echo base_url(); ?>manage/logout">
			  						Logout
			  					</a>
							</div>
						</div>
						<div class="row-fluid">
							<div class="span12">
								<a class=" btn btn-small btn-primary menu-button menu-logout-button menu-button-small" href="<?php echo base_url(); ?>/manage/sqlserver">
									SQL Server
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<?php $this->load->view('default/footer/console_page.php'); ?>
	<script src="http://code.jquery.com/ui/1.12.0/jquery-ui.min.js" integrity="sha256-eGE6blurk5sHj+rmkfsGYeKyZx3M4bG+ZlFyA7Kns7E=" crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(document).ready
		(
			function()
			{
			    $('#event_area ul').multiSelect
				(
					{
			        	unselectOn: '#event_area',
			        	keepSelection: true,
			    	}
				);
			}
		);

		function deletesheets()
		{
			$("#event_area ul li.selected").each
			(
				function( index )
				{
					console.log( index + ": " + $( this ).data("id") );
				}
			);
			alert("Delete Sheets");
		}

		$.fn.multiSelect = function(o)
		{
		    var defaults = {
		        multiselect: true,
		        selected: 'selected',
		        filter:        ' > *',
		        unselectOn:    false,
		        keepSelection: true,
		        list:            $(this).selector,
		        e:                null,
		        element:    null,
		        start: false,
		        stop: false,
		        unselecting: false
		    }
		    return this.each(function(k,v) {
		        var options = $.extend({}, defaults, o || {});
		        // selector - parent, assign listener to children only
		        $(document).on('mousedown', options.list+options.filter, function(e)
				{
		            if (e.which == 1)
					{
						if (options.handle != undefined && !$(e.target).is(options.handle)) {

		                     return true;
		                }
		                options.e = e;
		                options.element = $(this);
		                multiSelect(options);
		            }
		            return true;
		        });

		        if (options.unselectOn)
				{
		            $(document).on('mousedown', options.unselectOn, function(e)
					{
		                if (!$(e.target).parents().is(options.list) && e.which != 3)
						{
		                    $(options.list+' .'+options.selected).removeClass(options.selected);
		                    if (options.unselecting != false)
							{
		                        options.unselecting();
		                    }
		                }
		            });

		        }

		    });


		}

		function multiSelect(o)
		{
		    var target = o.e.target;
		    var element = o.element;
		    var list = o.list;

		    if ($(element).hasClass('ui-sortable-helper'))
			{
		        return false;
		    }

		    if (o.start != false)
			{
		        var start = o.start(o.e, $(element));
		        if (start == false)
				{
		            return false;
		        }
		    }

		    if (o.e.shiftKey && o.multiselect)
			{
		        $(element).addClass(o.selected);
		        first = $(o.list).find('.'+o.selected).first().index();
		        last = $(o.list).find('.'+o.selected).last().index();

		        if (last < first)
				{
		            firstHolder = first;
		            first = last;
		            last = firstHolder;
		        }

		        if (first == -1 || last == -1)
				{
		            return false;
		        }

		        $(o.list).find('.'+o.selected).removeClass(o.selected);

		        var num = last - first;
		        var x = first;

		        for (i=0;i<=num;i++)
				{
		            $(list).find(o.filter).eq(x).addClass(o.selected);
		            x++;
		        }
		    }
			else if ((o.e.ctrlKey || o.e.metaKey) && o.multiselect)
			{
		        if ($(element).hasClass(o.selected))
				{
		            $(element).removeClass(o.selected);
		        } else
				{
		            $(element).addClass(o.selected);
		        }
		    }
			else
			{
		        if (o.keepSelection && !$(element).hasClass(o.selected))
				{
		           $(list).find('.'+o.selected).removeClass(o.selected);
		           $(element).addClass(o.selected);
		        }
				else
				{
		           $(list).find('.'+o.selected).removeClass(o.selected);
		           $(element).addClass(o.selected);
		        }

		    }

		    if (o.stop != false)
			{
		        o.stop($(list).find('.'+o.selected), $(element));
		    }

		}

	</script>
	</body>
</html>
