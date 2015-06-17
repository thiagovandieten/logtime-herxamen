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

## FATIH: Je kunt een fout melding aanmaken door de $msg['error'] te gebruiken en je kunt een 'goede' melding gebruiken door $msg['no_error'] te gebruiken! Succes! Yannick.
print_r($msg);
?>
<section class="ac-container">
	<form method='post'>
		Onderwerp: <input type='text' name='onderwerp'>
		Naar:<br/>
		<?php echo $notificationClass->getUserTypes(); ?>
		<br/>
		Bericht:<br/> <textarea name='description'></textarea><br/>
		<input type='submit' name='send' value='Verzend Notificatie'>
	</form>
</section>