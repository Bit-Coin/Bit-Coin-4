<?php

class M_project extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    public function get_all($limit, $start, $id) {
        $this->db->limit($limit, $start);
        $this->db->where('catalogue_id', $id);
        $this->db->where('active', 1);
        $result = $this->db->get('project');
        if ($result->num_rows() > 0) {
            return $result->result_array();
        } else
            return false;
    }

    public function get_hot($limit, $start) {
        $this->db->limit($limit, $start);
        $this->db->where('hot is not null', null );
        $this->db->where('active', 1);
        $result = $this->db->get('project');
        if ($result->num_rows() > 0) {
            return $result->result_array();
        } else
            return false;
    }

    public function get_item_by_type_id($id) {
        $this->db->where('type_id', $id);
        $this->db->where('active', 1);
        $result = $this->db->get('project');
        if ($result->num_rows() > 0) {
            return $result->result_array();
        } else
            return false;
    }

    public function get_item_by_type_code($code) {
        $this->db->select('project.*')
                ->join('project_type', 'project.type_id = project_type.id')
                ->where('project_type.code', $code)
                ->where('project.active', 1);
        $result = $this->db->get('project');
        if ($result->num_rows() > 0) {
            return $result->result_array();
        } else
            return false;
    }

}

?>