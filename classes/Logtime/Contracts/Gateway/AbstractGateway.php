<?php
/**
 * Created by PhpStorm.
 * User: nktakumi
 * Date: 13/06/15
 * Time: 12:21
 */

namespace Logtime\Contracts\Gateway;


abstract class AbstractGateway {
    protected $db;
    protected $tableName;

    public function __construct(\database $db) {
        $this->db = $db;

        if(empty($this->tableName)) throw new \Exception('Gateway class zonder tableName property!');
    }

    public function selectAll() {
        $query_grade  = "SELECT * FROM {$this->tableName}";
        $this->db->query($query_grade);
        return $this->db->resultset();
    }
}