<?php
/**
 * Created by PhpStorm.
 * User: nktakumi
 * Date: 21/05/15
 * Time: 12:05
 */

namespace Logtime\Project;
use Logtime\Contracts\Gateway\AbstractGateway;
/**
 * Dit is een Gateway class
 *
*/
class ProjectGateway extends AbstractGateway {

    protected $tableName = 'project';

    public function delete($project_id) {
        $this->db->query("DELETE FROM projects WHERE project_id = '".$project_id."'");
        $this->db->execute();
        error_log('Moet verwijderd zijn!');
        return 'De items zijn succesvol verwijderd.';
    }
}