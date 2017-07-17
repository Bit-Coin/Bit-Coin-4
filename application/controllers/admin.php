<?php
include_once('CI_Controller_EX.php');

class admin extends CI_Controller_EX
{

	public function __construct()
	{
		parent::__construct();
		$this->load->model('M_user', '', TRUE);
		//This method will have the credentials validation
   		$this->load->library('form_validation');
	}

	public function users()
	{
		$data["list"] = $this->M_user->userslist();
		$this->load->view('admin/users', $data);
	}

	public function adduser()
	{
		$this->load->view('admin/adduser');
	}

	public function save()
	{



   		$this->form_validation->set_rules('username', 'username', 'trim|required|xss_clean|is_unique[res_users.username]');
   		$this->form_validation->set_rules('name', 'name', 'trim|required|xss_clean');
   		$this->form_validation->set_rules('phone', 'phone', 'trim|required|xss_clean|regex_match[/^[0-9]{10}$/]');
   		$this->form_validation->set_rules('email', 'email', 'trim|required|xss_clean|valid_email|is_unique[res_users.email]');
   		$this->form_validation->set_rules('tempass', 'Reset Password', 'trim|required|xss_clean');

		$data = array
		(
			'username' => $this->input->post('username'),
			'name' => $this->input->post('name'),
			'phone_number' => $this->input->post('phone'),
			'email' => $this->input->post('email'),
			'user_type' => "1",
			'active' => "1",
			'reset_password' => md5( $this->input->post('tempass') )
		);
		if( $this->form_validation->run() == TRUE )
   		{
   			$this->M_user->save($data);
   			$data['message'] = 'Data Inserted Successfully';
   		}
   		else
   		{
			$data['message'] = 'Error inserting data';
		}
		$this->load->view('admin/adduser', $data);
	}

}
