<!DOCTYPE html>
<html lang="en">
    <head>

        <base href="<?php echo site_url() . 'public'; ?>" />
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title><?php echo $active !=null? $active:'scc Hà Nội'; ?></title>
        <p><?php echo lang('demo.username');?></p>

        <!-- core CSS -->
        <link href="<?php echo base_url('public/css/bootstrap.min.css') ?>" rel="stylesheet">
        <link href="<?php echo base_url('public/css/font-awesome.min.css') ?>" rel="stylesheet">
        <link href="<?php echo base_url('public/css/animate.min.css') ?>" rel="stylesheet">
        <link href="<?php echo base_url('public/css/prettyPhoto.css') ?>" rel="stylesheet">
        <link href="<?php echo base_url('public/css/main.css') ?>" rel="stylesheet">
        <link href="<?php echo base_url('public/css/responsive.css') ?>" rel="stylesheet">
        <!--[if lt IE 9]>
        <script src="<?php echo base_url('public/js/html5shiv.js') ?>"></script>
        <script src="<?php echo base_url('public/js/respond.min.js') ?>"></script>
        <![endif]-->
        <link rel="shortcut icon" href="<?php echo base_url('public/images/ico/favicon.png') ?>">
    </head>

    <body class="homepage">

        <header id="header">
            <div class="top-bar">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12 col-xs-12">
                            <div class="head-line">
                                <span><a href="<?php echo base_url('/') ?>">Trang chủ</a></span>
                                <form role="form" action="<?php echo site_url('post/timkiem'); ?>" method = "post">
                                    <input type="text" class="search-form" autocomplete="off" placeholder="Tìm kiếm" name="keyword">
                                    <input class="search-button-all" type="submit" name="submit" value="" />
                                </form>
                            </div>
                        </div>
                    </div>
                </div><!--/.container-->
            </div><!--/.top-bar-->

            <nav class="navbar navbar-inverse" role="banner">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="<?php echo base_url('/') ?>"><img src="<?php echo base_url('public/images/logo2.png') ?>" alt="logo" width="200"></a>
                    </div>

                    <div class="collapse navbar-collapse navbar-right">
                        <ul class="nav navbar-nav">
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">SCC HÀ NỘI <i class="fa fa-angle-down"></i></a>
                                <ul class="dropdown-menu">
                                    <li><a href="<?php echo base_url('page/intro') ?>">Giới thiệu</a></li>
                                    <li><a href="<?php echo base_url('page/lichsuhoatdong') ?>">Lịch sử hoạt động</a></li>
                                    <li><a href="<?php echo base_url('page/lichsuhinhthanh') ?>">Lịch sử hình thành</a></li>
                                    <li><a href="<?php echo base_url('organizational') ?>">Ban lãnh đạo</a></li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">TIN TỨC - SỰ KIỆN <i class="fa fa-angle-down"></i></a>
                                <ul class="dropdown-menu">
                                    <?php foreach ($result_cata['result_cata'] as $type): ?>
                                        <li><a href="<?php echo base_url('post/' . $type['slug']) ?>"><?php echo $type['name'] ?></a></li>
                                    <?php endforeach; ?>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">DỰ ÁN <i class="fa fa-angle-down"></i></a>
                                <ul class="dropdown-menu">
                                    <?php foreach ($result_cata['result_project_type'] as $type): ?>
                                        <li><a href="<?php echo base_url('project/' . $type['code']) ?>"><?php echo $type['name'] ?></a></li>
                                    <?php endforeach; ?>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">CTY THÀNH VIÊN <i class="fa fa-angle-down"></i></a>
                                <ul class="dropdown-menu">
                                    <li><a href="<?php echo base_url('partner/doitac') ?>">Đối tác</a></li>
                                    <li><a href="<?php echo base_url('partner/congtythanhvien') ?>">Công ty thành viên</a></li>
                                </ul>
                            </li>
                            <li><a href="<?php echo base_url('post/tuyendung') ?>">TUYỂN DỤNG</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">LIÊN HỆ <i class="fa fa-angle-down"></i></a>
                                <ul class="dropdown-menu">
                                    <li><a href="<?php echo base_url('page/contact') ?>">Liên hệ</a></li>
                                    <li><a href="<?php echo base_url('page/chinhanh') ?>">Chi nhánh</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div><!--/.container-->
            </nav><!--/nav-->

        </header><!--/header-->

        <?php
        foreach ($path as $view) {
            $this->load->view("default/include/$view");
        }
        ?>
        <?php include('menu_bottom.php'); ?>
        <footer id="footer" class="midnight-blue">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        &copy; 2015 <a target="_blank" href="#">SCC Hà Nội</a>. All Rights Reserved.
                    </div>
                    <div class="col-sm-6">
                        <ul class="pull-right">
                            <li><a href="<?php echo base_url('/') ?>">Trang chủ</a></li>
                            <li><a href="<?php echo base_url('page/intro') ?>">Giới thiệu</a></li>
                            <li><a href="<?php echo base_url('page/contact') ?>">Liên hệ</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </footer><!--/#footer-->

        <script src="<?php echo base_url('public/js/jquery.js') ?>"></script>
        <script src="<?php echo base_url('public/js/bootstrap.min.js') ?>"></script>
        <script src="<?php echo base_url('public/js/jquery.prettyPhoto.js') ?>"></script>
        <script src="<?php echo base_url('public/js/jquery.isotope.min.js') ?>"></script>
        <script src="<?php echo base_url('public/js/main.js') ?>"></script>
        <script src="<?php echo base_url('public/js/wow.min.js') ?>"></script>
        <script src="<?php echo base_url('public/js/custom.js') ?>"></script>
    </body>
</html>
