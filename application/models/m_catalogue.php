<?php
class M_catalogue extends CI_Model
{
        public function get_all($limit,$start,$table="project_cat"){
            $this->db->limit($limit,$start);
            $this->db->where('active',1);
            $this->db->from($table);
            $result=$this->db->get();
            if($result->num_rows()>0){
              return $result->result_array();
            }
            else 
                return false;   
        }         
}

?>