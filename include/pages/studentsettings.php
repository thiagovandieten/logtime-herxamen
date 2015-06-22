<?php
// Gebruikt studentsettingsClass
// ALTER TABLE `users` ADD `firstlogin` BOOLEAN NOT NULL AFTER `active`;

if(isset($_GET['new'])){
?>


  <?php
	if(isset($_POST['newUser'])){
		$studentsettingClass->newUser($_POST);
		$getError = "<div class='error'>".$studentsettingClass->getError()."</div>";
		$getNotification = "<div class='goed'>".$studentsettingClass->getNotification()."</div>";


      $berichtgoed="";
      $berichterror="";
        if(!empty($studentsettingClass->getError())){
          $berichterror = $getError;
        }
        echo $berichterror;

      if(!empty($studentsettingClass->getNotification())){
        $berichtgoed = $getNotification;
      }
      echo $berichtgoed;
	}


?>
    <section class="ac-container">
  <div class="personal-settings">
  <h1> Nieuwe gebruiker aanmaken! </h1>
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
    <input type='submit' name='newUser' value='Opslaan' />
  </form>
</section>
  </div>
<?php
}
else{
?>
<div class="filter-wrap">
  <div class="buttons-wrap"> <a href='studentsettings?new'>
    <button class="nieuw-knop">Nieuw</button>
    </a>
    <button class="delete-knop" style="margin-left: 5px;">Verwijderen</button>
  </div>
</div>
<section class="ac-container" style="width: 100%; margin: 0px;">
  <?php
	echo $studentsettingClass->returnAllUsers();
?>
</section>
<?php
}
?>


<script>
  $(document).ready(function()
  {
    $("table tr:odd").css("background-color", "#ededed");
  });
</script>

