<?php
//error_reporting(E_ALL);
//ini_set("display_errors", 1);

//include 'excel/PHPExcel.php';
spl_autoload_register(function ($class) {
    include 'classes/' . $class . '.class.php';
});

define('PROJECTGROUP_ID',$_SESSION['user']['projectgroup_id']);
define('USER_ID',$_SESSION['user']['user_id']);
define('USERTYPE_ID',$_SESSION['user']['usertype_id']);
define('LOCATION_ID', $_SESSION['user']['location_id']);


$user_id = $_SESSION['user']['user_id'];

//Hier kijken of hij of productie draait of bij iemand lokaal
// NOTICE: Leuk, maar nu liggen sommige functies dood omdat het niet goed gaat in database.class.php
// heb de database.class.php teruggezet (backup beschikbaar)
if($_SERVER['HTTP_HOST'] == 'herlogtime.dev') {
    //Roep DB aan onder Thiago's credentials
    $website = 'http://'.$_SERVER['HTTP_HOST'];
    $db = new database('logtime', 'logtime', 'examen');
} else {
    //Roep DB aan zoals gewoonlijk
    $website 	= 'http://'.$_SERVER['HTTP_HOST'].'/logtime';
    $db 		= new database('logtime', 'root', '');
}

## Inladen

$loginClass = new login($db);
$groupClass = new groupsettings($db, PROJECTGROUP_ID);

date_default_timezone_set("Europe/Amsterdam");

//$website = 'http://'.$_SERVER['HTTP_HOST'].'/';

define('MAXFILESIZE',10485760);
define('MAXFILESIZEFILE',10485760);
define('IMGTYPE','jpeg,jpg,gif,png');
define('UPLOADDOWN','../_download/');
define('FILETYPE','pdf,doc,xls,jpg,docx');

$formClass = new form();
if(!empty($_SESSION['user']['projectgroup_id'])){
	$groupClass = new groupsettings($db, PROJECTGROUP_ID, $formClass);
}


$userClass           = new user($db, USER_ID);
$groupClass          = new groupsettings($db, PROJECTGROUP_ID);
$studentsettingClass = new studentsettings($db, USER_ID, LOCATION_ID);
$notificationClass 	 = new notification($db, USER_ID);
$gradeClass          = new grade($db, LOCATION_ID);
$projectClass        = new project($db, LOCATION_ID);

?>