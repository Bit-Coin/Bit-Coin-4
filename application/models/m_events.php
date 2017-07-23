<?php
class M_events extends CI_Model {

    public function get_all() {

        $this->db->select('post.*');
        $result = $this->db->get('post');
        if ($result->num_rows() > 0) {
            return $result->result_array();
        } else
            return false;
    }
}
?>