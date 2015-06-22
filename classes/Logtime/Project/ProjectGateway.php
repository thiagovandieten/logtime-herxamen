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

    public function insertProject($array) {
        $this->db->query("INSERT INTO projects (project, projectslug, location_id, periode_id, leveltype_id)
                          VALUES (?, ?, ?, ?, 1);");
        $this->db->bind(1, $array['projectname']);
        $this->db->bind(2, $array['projectslug']);
        $this->db->bind(3, $array['location_id']);
        $this->db->bind(4, $array['periode']);
        $this->db->execute();

        $id = $this->db->lastInsertId();
        foreach ($array['groups'] as $group) {
            $this->db->query("INSERT INTO projectgroup_projects VALUES (?, $id)");
            $this->db->bind(1, $group);
            $this->db->execute();
        }
    }

    public function updateProject($array) {
        $id = $array['project_id'];
        $this->db->query("
        UPDATE projects SET
	      project = ?,
          projectslug = ?,
          periode_id = ?
        WHERE project_id = ?
        ");
        $this->db->bind(1, $array['projectname']);
        $this->db->bind(2, $array['projectslug']);
        $this->db->bind(3, $array['periode']);
        $this->db->bind(4, $id);
        $this->db->execute();

        //TODO: check bouwen of de project_id een int is
        $this->db->query("DELETE FROM projectgroup_projects WHERE project_id = ? ");
        $this->db->bind(1, $id);
        $this->db->execute();

        foreach ($array['groups'] as $group) {
            $this->db->query("INSERT INTO projectgroup_projects VALUES (?, $id)");
            $this->db->bind(1, $group);
            $this->db->execute();
        }

    }
}