<?php
error_reporting(E_ALL);
$loginClass->logged();
if(!isset($_GET['firstlogin'])){
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
			$berichterror = "";
		$berichtgoed = "";
	if(isset($message)){
		if(!empty($message['errors'])){
			$berichterror = '<div class="error">'.$message['errors'].'</div>';
		}else{
			$berichtgoed = $message['no_errors'];	
		}
	}
?>	
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>

    <script src="http://logtime.dev/js/jquery.backstretch.min.js"></script>

<div class="login-wrap">
<h1>Logtime</h1>
<?php echo $berichtgoed, $berichterror; ?>
<form method='post'>
	<input type='text' name='userlogin' placeholder='Studentcode/EMail'><br/>
    <input type='password' name='password' placeholder='Password'><br/>
    <input type='submit' name='login' value='Inloggen'>
</form>
<script>
  $.backstretch( "http://logtime.dev/images/bg.png" );
</script>

<?php
}else{
	include('include/elements/firstlogin.php');	
}