<?php

class M_user extends CI_Model {

  function __construct() {
    parent::__construct();
  }




  function login($username, $password)
  {
    $this->db->select( 'id, username, email' );
    $this->db->from( 'res_users' );
    $sanitize_username = $this->db->escape( $username );
    $where = "( username=" . $sanitize_username . " OR  email=". $sanitize_username . ")";
    $this->db->where( $where );
    $this->db->where( 'password', md5( $password ) );
    $this->db->where( 'active', 1 );
    $this->db->limit(1);

    $query = $this->db->get();

    if ($query->num_rows() == 1) {
      return $query->result();
    }
    else {
      return false;
    }
  }

  public function temp_reset_password( $temp_pass, $email_to_reset ) {
    $data = array('reset_password' => $temp_pass);

    if ($data) {
      $this->db->where('email', $email_to_reset);
      $this->db->update('res_users', $data);
      return TRUE;
    }
    else {
      return FALSE;
    }
  }

  public function temp_reset_client_password($temp_pass, $id) {
    $data = array(
      'reset_password' => $temp_pass);

    if ($data) {
      $this->db->where('id', $id);
      $this->db->update('client', $data);
      return TRUE;
    }
    else {
      return FALSE;
    }
  }

  public function reset_password($temp_pass) {
    $data = array(
      'password' => md5($this->input->post('password')),
      'reset_password' => '');
    if ($data) {
      $this->db->where('reset_password', $temp_pass);
      $this->db->update('res_users', $data);
      return TRUE;
    }
    else {
      return FALSE;
    }
  }

  public function reset_client_password($temp_pass) {
    $data = array(
      'password' => md5($this->input->post('password')),
      'reset_password' => '');
    if ($data) {
      $this->db->where('reset_password', $temp_pass);
      $this->db->update('client', $data);
      return TRUE;
    }
    else {
      return FALSE;
    }
  }

  public function is_temp_pass_valid($temp_pass) {
    $this->db->where('reset_password', $temp_pass);
    $query = $this->db->get('res_users');
    if ($query->num_rows() == 1) {
      return TRUE;
    }
    else
      return FALSE;
  }

  public function is_client_pass_valid($temp_pass) {
    $this->db->where('reset_password', $temp_pass);
    $query = $this->db->get('client');
    if ($query->num_rows() == 1) {
      return TRUE;
    }
    else
      return FALSE;
  }

  public function userslist()
  {
    $this->db->select('*');
    $this->db->from('res_users');
    $this->db->where('active', 1);
    $query = $this->db->get();


    return $query->result_array();

  }

  public function save($data)
  {
    $this->db->insert('res_users', $data);

  }

}

?>
