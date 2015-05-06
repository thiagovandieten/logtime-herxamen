<?php
define('PROJECTGROUP_ID',$_SESSION['user']['projectgroup_id']);
define('USER_ID',$_SESSION['user']['user_id']);

$user_id = $_SESSION['user']['user_id'];

spl_autoload_register(function ($class) {
    include 'classes/' . $class . '.class.php';
});

## Inladen
$db = new database;
$loginClass = new login($db);
$groupClass = new groupsettings($db, PROJECTGROUP_ID);

date_default_timezone_set("Europe/Amsterdam");

$website = 'http://'.$_SERVER['HTTP_HOST'].'/logtime';

define('MAXFILESIZE',10485760);
define('MAXFILESIZEFILE',10485760);
define('IMGTYPE','jpeg,jpg,gif,png');
define('UPLOADDOWN','../_download/');
define('FILETYPE','pdf,doc,xls,jpg,docx');

$formClass = new form();
if(!empty($_SESSION['user']['projectgroup_id'])){
	$groupClass = new groupsettings($db, PROJECTGROUP_ID, $formClass);
}
$userClass 				= new user($db, USER_ID);
$groupClass 			= new groupsettings($db, PROJECTGROUP_ID);
$studentsettingClass 	= new studentsettings($db, USER_ID);

?>