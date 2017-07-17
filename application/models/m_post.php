<?php

class M_post extends CI_Model {

    public function get_all($limit, $start, $table = "post", $post_type = "motor") {
        $this->db->limit($limit, $start);
        if ($table == 'post')
            $this->db->where('post_type', $post_type);
        $this->db->where('active', 1);
        $this->db->from($table);
        $result = $this->db->get();
        if ($result->num_rows() > 0) {
            return $result->result_array();
        } else
            return false;
    }

    public function get_item($id, $post_type = 'page') {
        $this->db->where('id', $id);
        $this->db->where('post_type', $post_type);
        $this->db->where('active', 1);
        $result = $this->db->get('post');
        if ($result->num_rows() > 0)
            return $result->result_array();
        else
            return false;
    }

    public function get_item_by_code($code, $post_type = 'page') {
        $this->db->where('code', $code);
        $this->db->where('post_type', $post_type);
        $this->db->where('active', 1);
        $result = $this->db->get('post');
        if ($result->num_rows() > 0)
            return $result->result_array();
        else
            return false;
    }

    public function get_item_by_list_code($code_array, $post_type = 'page') {
        $this->db->where_in('code', $code_array);
        $this->db->where('post_type', $post_type);
        $result = $this->db->get('post');
        $str = $this->db->last_query();
        if ($result->num_rows() > 0)
            return $result->result_array();
        else
            return false;
    }

    public function get_item_by_catalogue($catalogue, $post_type = 'page') {
        $this->db->where('catalogue_id', $catalogue);
        $this->db->where('post_type', $post_type);
        $this->db->where('active', 1);
        $this->db->order_by("create_date", "desc");
        $result = $this->db->get('post');
        if ($result->num_rows() > 0)
            return $result->result_array();
        else
            return false;
    }

    public function get_item_by_catalogue_code($catalogue_code) {
        $this->db->select('post.*')
            ->join('catalogue', 'post.catalogue_id = catalogue.id')
            ->where('catalogue.slug', $catalogue_code)
            ->where('post.active', 1);
        $result = $this->db->get('post');
        if ($result->num_rows() > 0)
            return $result->result_array();
        else
            return false;
    }


    public function get_item_by_id($id, $post_type = 'page') {
        $this->db->where('id', $id);
        $this->db->where('post_type', $post_type);
        $this->db->where('active', 1);
        $result = $this->db->get('post');
        if ($result->num_rows() > 0)
            return $result->result_array();
        else
            return false;
    }

    public function get_number_of_post($catalogue = 0, $post_type = 'page') {
        if($catalogue !=0)
            $this->db->where('catalogue_id', $catalogue);
        $this->db->where('post_type', $post_type);
        $this->db->where('active', 1);
        $result = $this->db->get('post');
        if ($result->num_rows() > 0)
            return $result->num_rows();
        else
            return false;
    }

    public function get_new_post($post_type = 'page') {
        $this->db->where('post_type', $post_type);
        $this->db->where('active', 1);
        $this->db->order_by("create_date", "desc");
        $this->db->limit(4, 0);
        $result = $this->db->get('post');
        if ($result->num_rows() > 0)
            return $result->result_array();
        else
            return false;
    }

    public function list_paging($catalogue_type, $post_type = 'post', $total, $start){
        $this->db->select('post.*')
            ->join('catalogue', 'post.catalogue_id = catalogue.id')
            ->where('catalogue.slug', $catalogue_type)
            ->where('post.active', 1);
        $this->db->order_by("create_date", "desc");
        $this->db->limit($total, $start);
        $result=$this->db->get('post');
        if ($result->num_rows()>0)
            return $result->result_array();

        else
            return false;
    }

    public function like() {
        if($_POST['id'] == "")
        {
            $id = "You can't send empty text";
        }
        else
        {
            $id = $_POST['id'];
        }
        $this->db->select('like');
        $this->db->where('id', $id);
        $this->db->from('post');
        $result = $this->db->get();
        $like = $result->row('like');

        if($this->session->flashdata("like_post") == '') {
            $this->session->set_flashdata("like_post", TRUE);
            $this->db->where('id', $id);
            $updatedata = array('like' => $like + 1);
            if ($this->db->update("post", $updatedata))
                return $like + 1;
            else
                return false;
        }
        else{
            $this->session->set_flashdata("like_post", TRUE);
            return $like;
        }
    }

    public function search_news($keyword, $post_type = 'post', $total, $start){
        $this->db->like('post.name',$keyword);
        $this->db->order_by("post.create_date", "desc");
        if ($post_type != ''){
            $this->db->select('post.*');
            $this->db->join('catalogue', 'post.catalogue_id = catalogue.id')
                ->where('post.post_type',$post_type)
                ->where('catalogue.active', 1)
                ->where('catalogue.visible', 1);
        }
        else if ($post_type == '')
            $this->db->where('post_type !=','page');
        $this->db->limit($total, $start);
        $result=$this->db->get('post');
        if ($result->num_rows()>0) {
            return $result->result_array();
        }
        else
            return false;
    }

    public function count_search_records($keyword, $post_type = 'post'){
        $this->db->like('post.name',$keyword);
        if ($post_type != '') {
            $this->db->select('post.*');
            $this->db->join('catalogue', 'post.catalogue_id = catalogue.id')
                ->where('post.post_type',$post_type)
                ->where('catalogue.active', 1)
                ->where('catalogue.visible', 1);
        }
        else if ($post_type == '')
            $this->db->where('post_type !=','page');
        $result=$this->db->get('post');
        if ($result->num_rows()>0) {
            return $result->num_rows();
        }
        else
            return false;
    }

    public function get_news_type(){
        $this->db->where(array('active' => 1, 'visible' => 1));
        $result = $this->db->get('catalogue');
        if ($result->num_rows()>0) {
            return $result->result_array();
        }
        else
            return false;
    }
}

?>