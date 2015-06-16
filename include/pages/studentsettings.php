<?php
// Gebruikt studentsettingsClass
// ALTER TABLE `users` ADD `firstlogin` BOOLEAN NOT NULL AFTER `active`;
error_reporting(E_ALL);
if(isset($_GET['new'])){
?>

<section class="ac-container">
  <?php
	if(isset($_POST['newUser'])){
		$studentsettingClass->newUser($_POST);
		$getError = $studentsettingClass->getError();
		$getNotification = $studentsettingClass->getNotification();
		var_dump($getError);
		var_dump($getNotification);
	}
?>
  <p> Nieuwe gebruiker aanmaken! </p>
  <br/>
  <form method='post'>
    <input type='text' name='usercode' placeholder="usercode" />
    <br/>
    <input type='text' name='email' placeholder="e-mail" />
    <br/>
    <select name='sort'>
      <?php
	
		foreach($studentsettingClass->allusertypes() as $data){
				echo "<option value='".$data['usertype_id']."'>".$data['usertype']."</option>";
		}
	?>
    </select>
    <br/>
    <br/>
    <input type='submit' name='newUser' value='Opslaan' />
  </form>
</section>
<?php
}else{
?>
<div class="filter-wrap">
  <div class="buttons-wrap"> <a href='studentsettings?new'>
    <button class="nieuw-knop">Nieuw</button>
    </a>
    <button class="delete-knop" style="margin-left: 5px;">Verwijderen</button>
  </div>
</div>
<section class="ac-container">
  <?php
	echo $studentsettingClass->returnAllUsers();
?>
</section>
<?php }?>