<?php
$project_id = $_GET['id'];

$query  = "SELECT * FROM projects WHERE project_id = '".$project_id."'";
$db->query($query); 
$data = $db->single();

$project_id 	= $data['project_id'];
$projectname 	= $data['project'];
$projectslug	= $data['projectslug'];
$projectcat_id	= $data['projectcategory_id'];
$location		= $data['location'];
$project_done 	= $data['done'];
$active			= $data['active'];

$query  = "SELECT * FROM projectcategories WHERE projectcategory_id = '".$projectcat_id."'";
$db->query($query); 
$data = $db->single();
                    

if($_GET['actie'] == 'wijzigen'){

}
elseif($_GET['actie'] == 'nieuw'){

}


// Waarschuwing weergeven (als deze bestaat)
if(isset($waarschuwing)){ echo $waarschuwing; }

// Het formulier weergeven
require ('include/formulieren/form_project.php');

?>