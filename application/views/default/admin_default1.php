<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>Dashboard - SCC Hanoi Admin</title>
        <meta name="description" content="overview & stats" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <?php foreach ($css_files as $file): ?>
            <link type="text/css" rel="stylesheet" href="<?php echo $file; ?>" />
        <?php endforeach; ?>
        <?php foreach ($js_files as $file): ?>
            <script src="<?php echo $file; ?>"></script>
        <?php endforeach; ?>
        <!-- basic styles -->
        <link href="<?php echo base_url('public') ?>/assets/css/bootstrap.min.css" rel="stylesheet" />
        <link href="<?php echo base_url('public') ?>/assets/css/bootstrap-responsive.min.css" rel="stylesheet" />

        <link rel="stylesheet" href="<?php echo base_url('public') ?>/assets/css/font-awesome.min.css" />
        <!--[if IE 7]>
          <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
        <![endif]-->
        <!-- ace styles -->
        <link rel="stylesheet" href="<?php echo base_url('public') ?>/assets/css/ace.min.css" />
        <link rel="stylesheet" href="<?php echo base_url('public') ?>/assets/css/ace-responsive.min.css" />
        <link rel="stylesheet" href="<?php echo base_url('public') ?>/assets/css/ace-skins.min.css" />
        <!--[if lt IE 9]>
          <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
        <![endif]-->
    </head>

    <body>
        <div class="navbar navbar-inverse">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="brand" href="<?php echo base_url('manage') ?>"><small><i class="icon-leaf"></i> SCC Hanoi Admin</small> </a>
                    <ul class="nav ace-nav pull-right">
                        <li class="grey">

                        <li class="light-blue user-profile">
                            <a class="user-menu dropdown-toggle" href="#" data-toggle="dropdown">
                              <img alt="Jason's Photo" src="<?php echo base_url('public') ?>/assets/avatars/user.jpg" class="nav-user-photo" />
                                <span id="user_info">
                                    <small>Welcome,</small> <?php echo $username; ?>
                                </span>
                                <i class="icon-caret-down"></i>
                            </a>
                            <ul id="user_menu" class="pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-closer">
                                <li><a href="<?php echo base_url('manage/user/edit/' . $id); ?>"><i class="icon-cog"></i> Settings</a></li>
                                <li class="divider"></li>
                                <li><a href="<?php echo base_url(); ?>manage/logout"><i class="icon-off"></i> Logout</a></li>
                            </ul>
                        </li>

                    </ul><!--/.ace-nav-->

                </div><!--/.container-fluid-->
            </div><!--/.navbar-inner-->
        </div><!--/.navbar-->

        <div class="container-fluid" id="main-container">
            <a href="#" id="menu-toggler"><span></span></a><!-- menu toggler -->

            <div id="sidebar">

                <div id="sidebar-shortcuts">

                    <div id="sidebar-shortcuts-mini">
                        <span class="btn btn-success"></span>
                        <span class="btn btn-info"></span>
                        <span class="btn btn-warning"></span>
                        <span class="btn btn-danger"></span>
                    </div>
                </div><!-- #sidebar-shortcuts -->

                <ul class="nav nav-list">

                    <li class="active">
                        <a href="<?php echo base_url('manage') ?>">
                            <i class="icon-dashboard"></i>
                            <span>Dashboard</span>

                        </a>
                    </li>					
                    <li>
                        <a href="#" class="dropdown-toggle" >
                            <i class="icon-edit"></i>
                            <span>Bài viết</span>
                            <b class="arrow icon-angle-down"></b>
                        </a>
                        <ul class="submenu">
                            <li><a href="<?php echo base_url('manage/all_post') ?>"><i class="icon-double-angle-right"></i>DS Bài viết</a></li>
                            <li><a href="<?php echo base_url('manage/catalogue') ?>"><i class="icon-double-angle-right"></i>DMục Bài viết</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" class="dropdown-toggle" >
                            <i class="icon-edit"></i>
                            <span>Dự án</span>
                            <b class="arrow icon-angle-down"></b>
                        </a>
                        <ul class="submenu">
                            <li><a href="<?php echo base_url('manage/all_project') ?>"><i class="icon-double-angle-right"></i>DS Dự án</a></li>
                            <li><a href="<?php echo base_url('manage/all_project_cat') ?>"><i class="icon-double-angle-right"></i>Loại dự án</a></li>
                            <li><a href="<?php echo base_url('manage/all_project_type') ?>"><i class="icon-double-angle-right"></i>Nhóm dự án</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" class="dropdown-toggle" >
                            <i class="icon-edit"></i>
                            <span>Đối tác-Cty Con</span>
                            <b class="arrow icon-angle-down"></b>
                        </a>
                        <ul class="submenu">
                            <li><a href="<?php echo base_url('manage/all_partners') ?>"><i class="icon-double-angle-right"></i>Đối tác</a></li>
                            <li><a href="<?php echo base_url('manage/all_child_company') ?>"><i class="icon-double-angle-right"></i>Cty Con</a></li>						
                        </ul>
                    </li>
                    <li>
                        <a href="<?php echo base_url('manage/gallery') ?>">
                            <i class="icon-picture"></i>
                            <span>Hình ảnh</span>						
                        </a>
                    </li>
                    <li>
                        <a href="<?php echo base_url('manage/organizational') ?>">
                            <i class="icon-cog"></i>
                            <span>Cơ cấu tổ chức</span>
                        </a>
                    </li>
                    <li>
                        <a href="<?php echo base_url('manage/pages') ?>">
                            <i class="icon-desktop"></i>
                            <span>Pages</span>
                        </a>
                    </li>		
                    <li>
                        <a href="<?php echo base_url('manage/email_template') ?>">
                            <i class=" icon-envelope-alt"></i>
                            <span>Email templates</span>
                        </a>
                    </li>
                    <li>
                        <a href="<?php echo base_url('manage/messages') ?>">
                            <i class="icon-envelope"></i>
                            <span>Messages</span>
                        </a>
                    </li>
                    <li>
                        <a href="<?php echo base_url('manage/user') ?>">
                            <i class="icon-user"></i>
                            <span>User</span>

                        </a>
                    </li>
                    <li>
                        <a href="<?php echo base_url('manage/config') ?>">
                            <i class="icon-cogs"></i>
                            <span>Config</span>
                        </a>
                    </li>
                </ul><!--/.nav-list-->
                <div id="sidebar-collapse"><i class="icon-double-angle-left"></i></div>
            </div><!--/#sidebar-->		
            <div id="main-content" class="clearfix">					
                <div id="breadcrumbs">
                    <ul class="breadcrumb">
                        <li><i class="icon-home"></i> <a href="<?php echo base_url('manage') ?>">Trang chủ</a><span class="divider"><i class="icon-angle-right"></i></span></li>
                        <li class="active">Dashboard</li>
                    </ul><!--.breadcrumb-->
                    <div id="nav-search">
                        <form class="form-search">
                            <span class="input-icon">
                                <input autocomplete="off" id="nav-search-input" type="text" class="input-small search-query" placeholder="Search ..." />
                                <i id="nav-search-icon" class="icon-search"></i>
                            </span>
                        </form>
                    </div><!--#nav-search-->
                </div><!--#breadcrumbs-->
                <div id="page-content" class="clearfix">						
                    <div class="page-header position-relative">
                        <h1>Dashboard <small><i class="icon-double-angle-right"></i><?php echo $function_name; ?></small></h1>
                    </div><!--/page-header-->			

                    <div class="row-fluid">
                        <!-- PAGE CONTENT BEGINS HERE -->


                        <div class="space-6"></div>
                        <div class="row-fluid">





                            <div class="vspace"></div>



                        </div><!--/span-->


                    </div><!--/row-->
                    <div>
                        <?php echo $output; ?>
                    </div>

                    <div class="hr hr32 hr-dotted"></div>


                    <div class="row-fluid">



                        <div class="hr hr32 hr-dotted"></div>







                        <a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse">
                            <i class="icon-double-angle-up icon-only"></i>
                        </a>


                        <!-- basic scripts -->

                        <script src="<?php echo base_url('public') ?>/assets/js/bootstrap.min.js"></script>

                        <!-- page specific plugin scripts -->

                        <!--[if lt IE 9]>
                        <script type="text/javascript" src="<?php echo base_url('public') ?>/assets/js/excanvas.min.js"></script>
                        <![endif]-->

                        <script type="text/javascript" src="<?php echo base_url('public') ?>/assets/js/jquery-ui-1.10.2.custom.min.js"></script>

                        <script type="text/javascript" src="<?php echo base_url('public') ?>/assets/js/jquery.ui.touch-punch.min.js"></script>

                        <script type="text/javascript" src="<?php echo base_url('public') ?>/assets/js/jquery.slimscroll.min.js"></script>

                        <script type="text/javascript" src="<?php echo base_url('public') ?>/assets/js/jquery.easy-pie-chart.min.js"></script>

                        <script type="text/javascript" src="<?php echo base_url('public') ?>/assets/js/jquery.sparkline.min.js"></script>

                        <script type="text/javascript" src="<?php echo base_url('public') ?>/assets/js/jquery.flot.min.js"></script>

                        <script type="text/javascript" src="<?php echo base_url('public') ?>/assets/js/jquery.flot.pie.min.js"></script>

                        <script type="text/javascript" src="<?php echo base_url('public') ?>/assets/js/jquery.flot.resize.min.js"></script>


                        <!-- ace scripts -->
                        <script src="<?php echo base_url('public') ?>/assets/js/ace-elements.min.js"></script>
                        <script src="<?php echo base_url('public') ?>/assets/js/ace.min.js"></script>



                        </body>
                        </html>
