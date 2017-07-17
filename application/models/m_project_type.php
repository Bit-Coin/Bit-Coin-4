<?php

class M_project_type extends CI_Model {

    public function get_all($limit, $start, $table = "project_type") {
        $this->db->limit($limit, $start);
        $this->db->where('active', 1);
        $this->db->from($table);
        $result = $this->db->get();
        if ($result->num_rows() > 0) {
            return $result->result_array();
        } else
            return NULL;
    }

    public function get_project_type_by_code($code = '') {
        $this->db->where('active', 1);
        $this->db->where('code', $code);
        $this->db->from('project_type');
        $result = $this->db->get();
        if ($result->num_rows() > 0) {
            return $result->result_array();
        } else
            return NULL;
    }

}

?>