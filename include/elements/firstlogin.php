<?php
	if($_SESSION['temp_user_id'] == ''){
		header('location: /login');	
	}
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
?>
<h1>Eerste login</h1>
<form method='post'>
	<input type='text' name='firstname' placeholder='Voornaam'><br/>
    <input type='text' name='lastname'placeholder='Achternaam'><br/>
    <input type='password' name='password' placeholder='Wachtwoord'><br/>
    <input type='password' name='password_re' placeholder='Retyp je wachtwoord'><br/>
    <input type='submit' name='submit'> <a href='/login'><input type='button' value='Annuleren' /></a><br/>
</form>
