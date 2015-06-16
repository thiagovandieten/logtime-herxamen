<?php
error_reporting(E_ALL);
$loginClass->logged();
if(!isset($_GET['firstlogin']) && !isset($_GET['lostpass'])){
	if(isset($_POST['login'])){
		$loginClass->setLoginData($_POST['userlogin'], $_POST['password']);
		$loginClass->validateLogin();	
		
		$message = array();
		
		if($loginClass->getError()){
			$message['errors'] = $loginClass->getError();	
		}
		
		if($loginClass->getNotification()){
			$message['no_errors'] = $loginClass->getNotification();	
		}
	}
	if(isset($message)){
		if(!empty($message['errors'])){
			echo $message['errors'];
		}else{
			echo $message['no_errors'];	
		}
	}
?>	
<form method='post'>
	<input type='text' name='userlogin' placeholder='Studentcode/EMail'><br/>
    <input type='password' name='password' placeholder='password'><br/>
    <input type='submit' name='login' value='Inloggen'>
</form>

<br/>
<a href='login&lostpass'>Wachtwoord Opvragen</a>

<?php
}elseif(isset($_GET['firstlogin'])){
	include('include/elements/firstlogin.php');	
}else{
	include('include/elements/lostpass.php');	
}