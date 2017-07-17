<?php
class M_config extends CI_Model
{

    public function get_item($key){
        $this->db->select('value');
        $this->db->from('config');
        $this->db->where('key',$key);
        $this->db->where('active',1);
        $this -> db -> limit(1);

        $query = $this -> db -> get();

        if($query -> num_rows() == 1)
        {
			return array_shift(array_values($query->result()))->value;
        }
        else
        {
            return false;
        }
    }

}

?>