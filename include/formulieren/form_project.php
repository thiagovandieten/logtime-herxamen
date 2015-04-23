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

		<label for="street">Straat</label>
		<input type="text" name="street" value="<?php echo $street; ?>">

		<label for="housenumber">Huisnummer</label>
		<input type="text" maxlength="4" name="housenumber" value="<?php echo $housenumber; ?>">

		<label for="zipcode">Postcode</label>
		<input name="numbers" maxlength="4" type="text" placeholder="1234" value="<?php echo $numbers; ?>" />
   		<input name="characters" maxlength="2" type="text" placeholder="AB" value="<?php echo $characters; ?>" />

		<label for="city">Woonplaats</label>
		<input type="text" name="city" value="<?php echo $city; ?>">

		<label for="email">E-mail</label>
		<input type="email" name="email" value="<?php echo $email; ?>">
		 
		<label for="phone">Mobiel</label>
		<input type="phone" maxlength="11" name="phone" value="<?php echo $phone_number; ?>">
		  
		<input type="submit" name="save_ps" id="submit" value="Opslaan" class="bijwerken" />
	</form>

	<h1 class="ww-aanpassen">Wachtwoord aanpassen</h1>

	<form method="POST" action="" accept-charset="UTF-8" enctype="multipart/form-data">
		<input placeholder="Huidig wachtwoord" name="old_password" type="password" value="">
		<input placeholder="Nieuw wachtwoord" name="new_password" type="password" value="">
		<input placeholder="Wachtwoord herhalen" name="confirm_password" type="password" value="">
		<br>
		<input type="submit" name="save_pw" value="Wijzigen">
	</form>
</div>