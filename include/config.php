<?php
define('PROJECTGROUP_ID',$_SESSION['user']['projectgroup_id']);
define('USER_ID',$_SESSION['user']['user_id']);

$user_id = $_SESSION['user']['user_id'];

//Hier kijken of hij of productie draait of bij iemand lokaal

if($_SERVER['HTTP_HOST'] == 'herlogtime.dev') {
    //Roep DB aan onder Thiago's credentials
    $website = 'http://'.$_SERVER['HTTP_HOST'];
    $db = new database('logtime', 'logtime', 'examen');
} else {
    //Roep DB aan zoals gewoonlijk
    $website = 'http://'.$_SERVER['HTTP_HOST'].'/logtime';
    $db = new database('logtime', 'root', '');
};

## Inladen

$loginClass = new login($db);
$groupClass = new groupsettings($db, PROJECTGROUP_ID);

date_default_timezone_set("Europe/Amsterdam");



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