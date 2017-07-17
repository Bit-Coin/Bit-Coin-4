<?php

class M_partner extends CI_Model {

    public function get_all($limit, $start, $partner_type = 'doitac') {
        $this->db->limit($limit, $start);
        $this->db->select('partner.*')
                ->join('partner_cat', 'partner.partner_cat_id = partner_cat.id')
                ->where('partner_cat.code', $partner_type)
                ->where('partner.active', 1)
                ->where('partner_cat.active', 1);
        $result = $this->db->get('partner');

        if ($result->num_rows() > 0) {
            return $result->result_array();
        } else
            return false;
    }
}

?>