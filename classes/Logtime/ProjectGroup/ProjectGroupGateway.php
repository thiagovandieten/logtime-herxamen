<?php
/**
 * Created by PhpStorm.
 * User: nktakumi
 * Date: 14/06/15
 * Time: 15:55
 */

namespace Logtime\ProjectGroup;


use Logtime\Contracts\Gateway\AbstractGateway;

class ProjectGroupGateway extends AbstractGateway {
    protected $tableName = 'projectgroup';

    public function selectAllbyLocationIdWithGrade($id) {
        $query = "SELECT p.*, g.grade_name FROM projectgroup AS p
                  LEFT JOIN grade AS g ON p.grade_id = g.grade_id
                  WHERE p.location_id = {$id}";
        $this->db->query($query);
        return $this->db->resultset();
    }
}