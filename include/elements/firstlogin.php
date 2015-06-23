<?php
if(isset($_POST['submit'])){
	$loginClass->firstLogin($_POST);
}

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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script src="http://logtime.dev/js/jquery.backstretch.min.js"></script>

<div class="eenmalig-wrap">
	<h1>Voer uw gegevens in</h1>
	<?php
	if($message['errors']){
		echo '<div class="error">'.$message['errors'].'</div>';	
	}else{
		echo $message['no_error'];	
	}
	?>
	<form method='post'>
		<input type='text' name='firstname' placeholder='Voornaam'><br/>
	    <input type='text' name='lastname'placeholder='Achternaam'><br/>

	    <input type='text' name='password' placeholder='Wachtwoord'><br/>
	    <input type='text' name='password_re' placeholder='Retyp je wachtwoord'><br/>
	    <input type='submit' name='submit'><br/>
	</form>
</div>

<script>
    $.backstretch( "<?php echo $website ;?>/_img/bg.png" );
</script>
