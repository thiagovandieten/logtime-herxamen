<?php
error_reporting(E_ALL);
spl_autoload_register(function ($class) {
    include 'classes/' . $class . '.class.php';
});


define('PROJECTGROUP_ID',$_SESSION['user']['projectgroup_id']);
define('USER_ID',$_SESSION['user']['user_id']);

## Inladen
$db = new database;
$loginClass = new login($db);
$groupClass = new groupsettings($db, PROJECTGROUP_ID);

date_default_timezone_set("Europe/Amsterdam");

$website = 'http://'.$_SERVER['HTTP_HOST'].'/logtime';

?>