<?php
spl_autoload_register(function ($class) {
    include 'classes/' . $class . '.class.php';
});


define('PROJECTGROUP_ID',$_SESSION['user']['projectgroup_id']);
define('USER_ID',$_SESSION['user']['user_id']);

## Inladen
$db = new database;
$loginClass = new login($db);
date_default_timezone_set("Europe/Amsterdam");

$website = 'http://'.$_SERVER['HTTP_HOST'].'/logtime';

define('MAXFILESIZE',10485760);
define('MAXFILESIZEFILE',10485760);
define('IMGTYPE','jpeg,jpg,gif,png');
define('UPLOADDOWN','../_download/');
define('FILETYPE','pdf,doc,xls,jpg,docx');

$formClass = new form();
if(!empty(PROJECTGROUP_ID)){
	$groupClass = new groupsettings($db, PROJECTGROUP_ID, $formClass);
}
$userClass = new user($db, USER_ID);
$groupClass = new groupsettings($db, PROJECTGROUP_ID);

?>