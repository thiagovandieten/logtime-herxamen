<?php
/**
 * Created by PhpStorm.
 * User: nktakumi
 * Date: 13/06/15
 * Time: 10:44
 */

namespace Logtime\Grade;
use Logtime\Contracts\Gateway\AbstractGateway;

class GradeGateway extends AbstractGateway {
    protected $tableName = 'grade';

    public function selectAllByLocationId($id) {
        $query = "SELECT * FROM grades
                  WHERE location_id = {$id}";
        $this->db->query($query);
        return $this->db->resultset();
    }
}