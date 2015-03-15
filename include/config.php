<?php
	$dbHost 	= 'localhost';
	$dbUser 	= 'root'; 
	$dbPassword = '';
	$dbDatabase = 'logtime';

	$dbc = mysqli_connect ($dbHost, $dbUser, $dbPassword, $dbDatabase);

	if(!$dbc){
		die ('Er kan geen verbinding tot stand worden gebracht. Foutmelding: ' . mysqli_connect_error());	
	}

	$website = 'http://'.$_SERVER['HTTP_HOST'].'/logtime';
?>