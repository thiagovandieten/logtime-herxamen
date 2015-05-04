<div class="personal-settings">
	<h1>Project aanmaken</h1>
	<form id="project" method="post" action="" enctype="multipart/form-data">

		<?php if($melding != ''){ echo '<p class="error">'.$melding.'</p>'; } ?>
		<?php if($waarschuwing != ''){ echo $waarschuwing; } ?>
		<?php if(isset($succes)){ echo $succes; } ?>

		<label for="projectname">Projectnaam</label>
		<input type="text" name="projectname" value="<?php echo $projectname; ?>">

		<label for="projectslug">Project url</label>
		<input type="text" name="projectslug" value="<?php echo $projectslug; ?>">
  
		<input type="submit" name="save" id="submit" value="Opslaan" class="bijwerken" />
	</form>
</div>