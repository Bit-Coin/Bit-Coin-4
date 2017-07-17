<section id="bottom">
    <div class="container wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
        <div class="row">
            <div class="col-md-3 col-sm-6">
                <div class="widget">
                    <h3>SCC HÀ NỘI</h3>
                    <ul>
                        <li><a href="<?php echo base_url('page/intro') ?>">Giới thiệu</a></li>
                        <li><a href="<?php echo base_url('page/lichsuhoatdong') ?>">Lịch sử hoạt động</a></li>
                        <li><a href="<?php echo base_url('page/lichsuhinhthanh') ?>">Lịch sử hình thành</a></li>
                        <li><a href="<?php echo base_url('organizational/index') ?>">Ban lãnh đạo</a></li>
                    </ul>
                </div>    
            </div><!--/.col-md-3-->

            <div class="col-md-3 col-sm-6">
                <div class="widget">
                    <h3>TIN TỨC - SỰ KIỆN</h3>
                    <ul>
                        <?php foreach ($result_cata['result_cata'] as $type): ?>
                            <li><a href="<?php echo base_url('post/' . $type['slug']) ?>"><?php echo $type['name'] ?></a></li>
                        <?php endforeach; ?>
                    </ul>
                </div>    
            </div><!--/.col-md-3-->

            <div class="col-md-3 col-sm-6">
                <div class="widget">
                    <h3>DỰ ÁN</h3>
                    <ul>
                        <?php foreach ($result_cata['result_project_type'] as $type): ?>
                            <li><a href="<?php echo base_url('project/' . $type['code']) ?>"><?php echo $type['name'] ?></a></li>
                        <?php endforeach; ?>
                    </ul>
                </div>    
            </div><!--/.col-md-3-->

            <div class="col-md-3 col-sm-6">
                <div class="widget">
                    <h3>CTY THÀNH VIÊN</h3>
                    <ul>
                        <li><a href="<?php echo base_url('partner/doitac') ?>">Đối tác</a></li>
                        <li><a href="<?php echo base_url('partner/contythanhvien') ?>">Công ty thành viên</a></li>
                    </ul>
                </div>    
            </div><!--/.col-md-3-->
        </div>
    </div>
</section><!--/#bottom-->