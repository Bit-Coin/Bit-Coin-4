<?php
include_once('CI_Controller_EX.php');

class mongotest extends CI_Controller_EX
{

	public function __construct()
	{
		parent::__construct();
		$this->load->library('mongo_db');
	}

	public function index()
	{
        $tables=$this->db->query("SELECT t.TABLE_NAME AS myTables FROM INFORMATION_SCHEMA.TABLES AS t WHERE t.TABLE_SCHEMA = 'database name' AND t.TABLE_NAME LIKE '%a%' ")->result_array();
        foreach($tables as $key => $val) {
             echo $val['myTables']."<br>";// myTables is the alias used in query.
        }
	}
}
