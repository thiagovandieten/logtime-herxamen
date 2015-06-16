<?php
	if(isset($_POST['submit'])){
		$newpost = array_merge($_POST, array('temp_id' => $_SESSION['temp_user_id']));
		$loginClass->firstLogin($newpost);
	}
	
	$message = array();
		
	if($loginClass->getError()){
		$message['errors'] = $loginClass->getError();	
	}
	
	if($loginClass->getNotification()){
		$message['no_errors'] = $loginClass->getNotification();	
	}
	print_r($message);
?>
<h1>Eerste login</h1>
<form method='post'>
	<input type='text' name='firstname' placeholder='Voornaam'><br/>
    <input type='text' name='lastname'placeholder='Achternaam'><br/>
    <input type='text' name='password' placeholder='Wachtwoord'><br/>
    <input type='text' name='password_re' placeholder='Retyp je wachtwoord'><br/>
    <input type='submit' name='submit'><br/>
    
</form>
