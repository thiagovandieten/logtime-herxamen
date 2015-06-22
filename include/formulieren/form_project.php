<?php
use Logtime\ProjectGroup\ProjectGroupGateway;
use \Logtime\View\Template\GenerateHTMLTags;

?>

<div class="personal-settings">
	<h1>Project aanmaken</h1>
        <?php if($_GET['actie'] == 'nieuw'):  ?>
        <form id="project" method="post" action="?actie=aanmaken" enctype="multipart/form-data">
        <?php else: ?>
        <form id="project" method="post" action="" enctype="multipart/form-data">
        <?php endif; ?>
		<?php if($melding != ''){ echo '<p class="error">'.$melding.'</p>'; } ?>
		<?php if($waarschuwing != ''){ echo $waarschuwing; } ?>
		<?php if(isset($succes)){ echo $succes; } ?>

		<label for="projectname">Projectnaam</label>
		<input type="text" name="projectname" value="<?php echo $projectname; ?>">

		<label for="projectslug">Project url</label>
		<input type="text" name="projectslug" value="<?php echo $projectslug; ?>">

        <p>Periodes</p>
        <?php for($i = 1; $i < 5; $i++) {
            if(in_array($i, $periodes)) echo GenerateHTMLTags::checkbox('periodes[]' , $i, true);
            else echo  GenerateHTMLTags::checkbox('periodes[]' , $i);
        } ?>
        <br/>
        <br/>
        <p>Groepen</p>
        <?php if ($userClass->user_type_id == 1 ) {
                $pgGateway = new ProjectGroupGateway($db);//Groepen ophalen op basis van de gebruiker's locatie
                $groups = $pgGateway->selectAllbyLocationIdWithGrade($userClass->location_id);
                foreach($groups as $group) {
                    echo GenerateHTMLTags::checkbox('groups[]' , $group['projectgroup_id'], false, $group['grade_name']);
                }
            }
        ?>
  
		<input type="submit" name="save" id="submit" value="Opslaan" class="bijwerken" />
	</form>
</div>