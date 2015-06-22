<?php


if(isset($_POST['send'])){
	$notificationClass->Validate($_POST);	

	if($notificationClass->getError()){
		$msg['error'] = $notificationClass->getError();
	}
	if($notificationClass->getNotification()){
		$msg['no_error'] = $notificationClass->getNotification();
		echo '<meta http-equiv="refresh" content="3">';
	}
}
if(isset($msg['error'])){
	$error = '<div class="error">'.$msg['error'].'</div>';
}


if(isset($msg['no_error'])){
	$error = '<div class="goed">'.$msg['no_error'].'</div>';
}

## FATIH: Je kunt een fout melding aanmaken door de $msg['error'] te gebruiken en je kunt een 'goede' melding gebruiken door $msg['no_error'] te gebruiken! Succes! Yannick.


?>
<?php echo $error;?>
<section class="ac-container">
	<div class="personal-settings">
	<form method='post'>

		<?php echo $notificationClass->getUserTypes(); ?>
		<br/>
		Bericht:<br/> <textarea name='description'></textarea><br/>
		<input type='submit' name='send' value='Sturen'>
	</form>
	</div>
</section>