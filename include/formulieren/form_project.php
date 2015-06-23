<?php
use Logtime\ProjectGroup\ProjectGroupGateway;
use \Logtime\View\Template\GenerateHTMLTags;

?>
<?php if($melding != ''){ echo '<p class="error">'.$melding.'</p>'; } ?>
<div class="personal-settings">
	<h1>Project aanmaken</h1>
        <?php if($_GET['actie'] == 'nieuw'):  ?>
        <form id="project" method="post" action="?actie=aanmaken" enctype="multipart/form-data">
        <?php elseif($_GET['actie'] == 'wijzig'): ?>
        <form id="project" method="post" action="?actie=wijzigen&project_id=<?php echo $project_id ?>" enctype="multipart/form-data">
        <?php else: ?>
        <form id="project" method="post" action="" enctype="multipart/form-data">
        <?php endif; ?>
		<?php if($waarschuwing != ''){ echo $waarschuwing; } ?>
		<?php if(isset($succes)){ echo $succes; } ?>

		<label for="projectname">Projectnaam</label>
		<input type="text" name="projectname" value="<?php echo $projectname; ?>">

		<label for="projectslug">Project url</label>
		<input type="text" name="projectslug" value="<?php echo $projectslug; ?>">

        <p>Periodes</p>
        <select name="periode">
            <?php for($i = 1; $i < 5; $i++) {
                if($periode == $i) echo "<option value=\"$i\" selected >Periode $i</option>";
                else echo "<option value=\"$i\" >Periode $i</option>";
            } ?>
        </select>

        <br/>
        <br/>
        <p style="border-bottom: 1px solid #ccc;padding-bottom: 5px;margin-bottom: 5px;"><b>Groepen</b></p>
        <?php if ($userClass->user_type_id == 1 ) {
                $pgGateway = new ProjectGroupGateway($db);//Groepen ophalen op basis van de gebruiker's locatie
                $groups = $pgGateway->selectAllbyLocationIdWithGrade($userClass->location_id);
                foreach($groups as $group) {
                    if(in_array($group['projectgroup_id'], $projectGroupIds)) {
                        echo GenerateHTMLTags::checkbox('groups[]' , $group['projectgroup_id'], true, $group['grade_name'])."<br />";
                    } else {
                        echo GenerateHTMLTags::checkbox('groups[]' , $group['projectgroup_id'], false, $group['grade_name'])."<br />";
                    }

                }
            }
        ?>
  
		<input type="submit" name="save" id="submit" value="Opslaan" class="bijwerken" />
	</form>
</div>