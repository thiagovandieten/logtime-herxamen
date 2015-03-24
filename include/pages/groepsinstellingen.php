<?php
	$groupClass->hasPermission();
?>
<h1>
Groepsinstellingen
</h1>
<br/>
<?php
$dir_dest = '_img/uploads/group_avatar';
$dir_pics = $dir_dest;
error_reporting(0);

if ((isset($_POST['action']) ? $_POST['action'] : (isset($_GET['action']) ? $_GET['action'] : '')) == 'simple') {

    // ---------- SIMPLE UPLOAD ----------

    // we create an instance of the class, giving as argument the PHP object
    // corresponding to the file field from the form
    // All the uploads are accessible from the PHP object $_FILES
    $handle = new upload($_FILES['my_field']);

    // then we check if the file has been uploaded properly
    // in its *temporary* location in the server (often, it is /tmp)
    if ($handle->uploaded) {

        // yes, the file is on the server
        // now, we start the upload 'process'. That is, to copy the uploaded file
        // from its temporary location to the wanted location
        // It could be something like $handle->Process('/home/www/my_uploads/');
        
		$handle->Process($dir_dest);
		$handle->file_new_name_body = 'group_image_';
		
		$groupClass->saveImage($handle->file_dst_name);
		
        // we check if everything went OK
        if ($handle->processed) {
            // everything was fine !
            $msg['no_errors'] = 'Succesvol het nieuwe plaatje geupload!';
			header('location: groepsinstellingen');
        } else {
            // one error occured
            $msg['error'] = 'Het plaatje is niet upgeload wegens een probleem probeer het opnieuw!';
        }

        // we delete the temporary files
        $handle-> Clean();

    } else {
        // if we're here, the upload file failed for some reasons
        // i.e. the server didn't receive the file
        $msg['error'] = 'Het plaatje is niet upgeload wegens een probleem, probeer het opnieuw!';
       // echo '  Error: ' . $handle->error . '';

    }


}
if(isset($_POST['save_wage'])){
	$groupClass->save_wage($_POST['studentwage']);
	
	if($groupClass->getError()){
		$msg['error'] = $groupClass->getError();
	}
	if($groupClass->getNotification()){
		$msg['no_error'] = $groupClass->getNotification();
	}
}

if($msg['no_error']){
	echo "<p>".$msg['no_error']."</p>";	
}else{
	echo "<p>".$msg['error']."</p>";	
}


## de IMG
echo $groupClass->getGroupImage();
?>
<form name="form1" enctype="multipart/form-data" method="post" />
    <p><input type="file" size="32" name="my_field" value="" /></p>
    <p class="button"><input type="hidden" name="action" value="simple" />
    <input type="submit" name="Submit" value="upload" /></p>
</form>
<form method='post'>
<div>
    	Uurloon
    </div>
    <div> 
    	<input type='text' name='studentwage' value='<?php echo $groupClass->getStudentWage()?>' />
    </div>
    <div>
    	<input type='submit' name='save_wage' value='Opslaan' />
    </div>
</form>    