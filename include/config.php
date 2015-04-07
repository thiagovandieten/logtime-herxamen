<?php
	/*$dbHost 	= 'localhost';
	$dbUser 	= 'root'; 
	$dbPassword = '';
	$dbDatabase = 'logtime';

	$dbc = mysqli_connect ($dbHost, $dbUser, $dbPassword, $dbDatabase);

	if(!$dbc){
		die ('Er kan geen verbinding tot stand worden gebracht. Foutmelding: ' . mysqli_connect_error());	
	}
	*/
$website = 'http://'.$_SERVER['HTTP_HOST'].'/logtime';
error_reporting(E_ALL);

spl_autoload_register(function ($class) {
    include 'classes/' . $class . '.class.php';
});
error_reporting(0);

define('PROJECTGROUP_ID',$_SESSION['user']['projectgroup_id']);
define('USER_ID',$_SESSION['user']['user_id']);

## Inladen
$db = new database;
$loginClass = new login($db);
$formClass = new form();
if(!empty(PROJECTGROUP_ID)){
	$groupClass = new groupsettings($db, PROJECTGROUP_ID, $formClass);
}
?>