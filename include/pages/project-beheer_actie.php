<?php
use Logtime\Project\ProjectGateway;

if(isset($_GET['id'])) {
    $project_id = $_GET['id'];

    $query = "
          SELECT pr.*, pe.periode,  GROUP_CONCAT(DISTINCT pg.projectgroup_id) AS projectgroup_ids
          FROM projects AS pr
          LEFT JOIN periodes AS pe ON pr.periode_id = pe.periode_id
          LEFT JOIN projectgroup_projects AS mtm ON pr.project_id = mtm.project_id
          LEFT JOIN projectgroup AS pg ON mtm.projectgroup_id = pg.projectgroup_id
          WHERE pr.project_id =  $project_id;";
//    $query  = "SELECT * FROM projects WHERE project_id = '".$project_id."'";
    $db->query($query);
    $data = $db->single();

    $project_id 	= $data['project_id'];
    $projectname 	= $data['project'];
    $projectslug	= $data['projectslug'];
    $projectcat_id	= $data['projectcategory_id'];
    $location		= $data['location'];
    $project_done 	= $data['done'];
    $active			= $data['active'];
    $periode        = $data['periode'];
    $projectGroupIds = explode(',' , $data['projectgroup_ids']);



    $query  = "SELECT * FROM projectcategories WHERE projectcategory_id = '".$projectcat_id."'";
    $db->query($query);
    $data = $db->single();
}

                    
switch($_GET['actie']) {
    case 'nieuw':
        break;
    case 'wijzigen':
        if(!isset($_POST['groups'])) {
            $melding = 'Er zijn geen groepen meegegeven!';
            break;
        }
        $projectGateway = new ProjectGateway($db);
        $data = $_POST;
        $data['location_id'] = $userClass->location_id;
        $data['project_id'] = $_GET['project_id'];
        $projectGateway->updateProject($data);
        $_SESSION['succes'] = 'Project wijzigen gelukt!';
        header('Location: ' . $website. '/project-beheer');
        die();
        break;
    case 'aanmaken':
        if(!isset($_POST['groups'])) {
            $melding = 'Er zijn geen groepen meegegeven!';
            break;
        }
        $projectGateway = new ProjectGateway($db);
        $data = $_POST;
        $data['location_id'] = $userClass->location_id;
        $projectGateway->insertProject($data);
        $_SESSION['succes'] = 'Project aanmaken gelukt!';
        header('Location: ' . $website. '/project-beheer');
        die();
        break;
}

// Waarschuwing weergeven (als deze bestaat)
if(isset($waarschuwing)){ echo $waarschuwing; }

// Het formulier weergeven
require ('include/formulieren/form_project.php');

?>