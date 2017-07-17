<?php
class M_email_template extends CI_Model
{

    public function get_item_by_key($key){
        $this->db->where('key',$key);
        $this->db->where('active',1);
        $result=$this->db->get('email_template');
        if ($result->num_rows()>0)
			return array_shift(array_values($result->result_array()));
        else
            return false;

    }

}

?>