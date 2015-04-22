<?php
$query  = "SELECT * FROM users WHERE user_id = '".$user_id."'";
$db->query($query); 
$data 	= $db->resultset();
$count 	= $db->rowCount();

foreach($data as $value){
	$firstname       = $value['firstname'];
	$lastname        = $value['lastname'];
	$email           = $value['email'];
	$phone_number    = $value['phone_number'];
	$afbeelding   	 = $value['user_image_path'];
	$adress_id       = $value['adress_id'];
	$password        = $value['password'];
}

$query_a  	= "SELECT * FROM adresses WHERE adress_id = '".$adress_id."'";
$db->query($query_a); 
$data_a 	= $db->resultset();
$count_a 	= $db->rowCount();

foreach($data_a as $value){
	$street        	= $value['street'];
	$housenumber   	= $value['housenumber'];
	$city          	= $value['city'];
	$zipcode     	= explode(" ", $value['zipcode']);

	$numbers 		= $zipcode[0];
	$characters 	= $zipcode[1];
}

$dir_dest = '_img/uploads/personal_avatar';
$dir_pics = $dir_dest;

// Personal Settings
if(isset($_POST['save_ps'])){
	$melding = '';

	$firstname       = $_POST['firstname'];
	$lastname        = $_POST['lastname'];
	$email           = $_POST['email'];
	$phone    		 = $_POST['phone'];
	$phone_number 	 = preg_replace('/\s+/', '', $phone);
	$street        	 = $_POST['street'];
	$housenumber   	 = $_POST['housenumber'];
	$city          	 = $_POST['city'];
	$numbers 		 = trim($_POST['numbers']);
	$characters 	 = trim($_POST['characters']);

	// Validation
	if($firstname 					== ''){ $melding = 'Vul een voornaam in';}
	elseif($lastname 				== ''){ $melding = 'Vul een achternaam in';}
	elseif($email 					== ''){ $melding = 'Vul een email adres in';}
	elseif(is_valid_email($email) 	!= 1){ $melding = 'Vul een geldig email adres in';}
	elseif($phone_number 			== ''){ $melding = 'Vul een mobiele nummer in';}
	elseif(checkTelefoon($phone_number)	!= 1){ $melding = 'Vul een geldig mobiele nummer in';}
	elseif($street 					== ''){ $melding = 'Vul een straatnaam in';}
	elseif($housenumber 			== ''){ $melding = 'Vul een huisnummer in';}
	elseif($city 					== ''){ $melding = 'Vul een woonplaats in';}
	elseif ((empty($numbers) || empty($characters))) { $melding = 'U heeft geen postcode ingevuld'; }
	elseif (checkPC($numbers, $characters) != 1) { $melding = 'U heeft geen geldig postcode ingevuld'; }		

	

	// Check if avatar is set
	if($_FILES['afbeelding']['name']) {
		//Eerst oude afbeelding verwijderen
		if($afbeelding != '') {
			unlink( '_img/uploads/personal_avatar/'. $afbeelding);
		
			list($afbeelding, $waarschuwing) = uploadimg('afbeelding', '_img/uploads/personal_avatar/', IMGTYPE, $afbeelding);
			$update_img = $afbeelding; 
		}
		else {
			list($afbeelding, $waarschuwing) = uploadimg('afbeelding', '_img/uploads/personal_avatar/', IMGTYPE);
			$update_img = $afbeelding; 
		}
	}
	else {
		$update_img = $afbeelding;
	}

	if($melding == '' && $waarschuwing == ''){
		$db->query("UPDATE `users` SET 
        `firstname`     	= '".$firstname."',
        `lastname`      	= '".$lastname."',
        `email`         	= '".$email."',
        `user_image_path`   = '".$update_img."',
        `phone_number`  	= '".$phone_number."'
        WHERE `user_id` 	= '".$user_id."'");
        
        $db->execute();

        $db->query("UPDATE `adresses` SET 
        `street`     		= '".$street."',
        `housenumber`   	= '".$housenumber."',
        `city`     			= '".$city."',  
        `zipcode`     		= '".$numbers.' '.ucfirst($characters)."' 
        WHERE `adress_id` 	= '".$adress_id."'");
        
        $db->execute();
        

        if($db){
           $succes = '<p class="succeslog">De wijzigingen zijn succesvol opgeslagen!</p>';
        }
        else{
            die('Error : (uhhh)');
        }


	}
}

// Password
if(isset($_POST['save_pw'])){

	$password_old 		= $_POST['old_password'];
	$password_new 		= $_POST['new_password'];
	$password_confirm 	= $_POST['confirm_password'];

	$password = hash('sha512', $password_old);

	$query = "SELECT * FROM `users` WHERE user_id = '".$user_id."' AND password = '".$password."'";	
	$db->query($query); 
	$data 	= $db->resultset();
	$count 	= $db->rowCount();
	
	if(empty($db->resultset())){
		$melding = 'Het huidige wachtwoord is onjuist';
	}
	elseif($password_old == ''){ 
		$melding = 'Vul je huidige wachtwoord in'; 
	}
	elseif($password_new == ''){ 
		$melding = 'Vul je nieuwe wachtwoord in'; 
	}
	elseif($password_confirm == ''){ 
		$melding = 'Herhaal het nieuwe wachtwoord'; 
	}
	elseif($password_confirm != $password_new){ 
		$melding = 'De nieuwe wachtwoorden zijn niet hetzelfde';
	}
	elseif($password_confirm <= '5'){ 
		$melding = 'Het nieuwe wachtwoord moet uit minimaal 6 karakters bestaan';
	}

	if($melding == ''){
		
		$db->query("UPDATE `users` SET 
        `password`       = '".$password."' 
        WHERE `user_id` = '".$user_id."'");
        
        $db->execute();

        if($db){
           $succes = '<p class="succeslog">Je wachtwoord is succesvol gewijzigd!</p>';
        }
        else{
            die('Error : ('. $dbc->errno .') '. $dbc->error);
        }
	}


}

?>

<div class="personal-settings">
	<h1>Persoonlijke gegevens</h1>
	<form id="contact" method="post" action="" enctype="multipart/form-data">


		<div class="img-omvang">
			<img src="_img/uploads/personal_avatar/<?php echo $afbeelding; ?>" width="150">
			<input class="avatar-veranderen custom-file-input" name="afbeelding" type="file">
		</div>

		<?php if($melding != ''){ echo '<p class="error">'.$melding.'</p>'; } ?>
		<?php if($waarschuwing != ''){ echo $waarschuwing; } ?>
		<?php if(isset($succes)){ echo $succes; } ?>

		<label for="firstname">Voornaam</label>
		<input type="text" name="firstname" value="<?php echo $firstname; ?>">

		<label for="lastname">Achternaam</label>
		<input type="text" name="lastname" value="<?php echo $lastname; ?>">

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
