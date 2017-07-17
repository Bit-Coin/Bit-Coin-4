<?php

include_once('CI_Controller_EX.php');

class organizational extends CI_Controller_EX {

    public function __construct() {
        parent::__construct();
        $this->load->model('M_organizational');
        $this->load->helper('form');
    }

    public function index() {
        $data['active'] = "Ban lãnh đạo";
        $data['result_cata'] = $this->_vertical_menu();
        $data['result'] = array_filter($this->M_organizational->get_all(1000, 0));
        $data['path'] = array('page/v_organizational');
        $this->load->view('default/layout_default', $data);
    }

}
