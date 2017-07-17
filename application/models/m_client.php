<?php

class M_client extends CI_Model {

  function __construct() {
    parent::__construct();
  }

  public function create_client($data) {
    $result = $this->db->insert('client', $data);
    if ($result) {
      return TRUE;
    }
    return FALSE;
  }

  public function edit($data) {
    $this->db->where('id', $data['id']);
    $result = $this->db->update('client', $data);
    if ($result) {
      return TRUE;
    }
    return FALSE;
  }
  
  public function get_client($id) {
    $this->db->where('id', $id);
    $result = $this->db->get('client');
    if ($result) {
      return $result->result_array();;
    }
    return FALSE;
  }

  public function get_all() {
    $result = $this->db->get('client');
    if ($result->num_rows() > 0) {
      return $result->result_array();
    }
    else
      return false;
  }

}

?>