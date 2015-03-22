<?php
// Waarden uit GET halen en gebruiken om gegevens uit database te halen
$row_id = $_GET['row_id'];
echo $query 	= "SELECT * FROM userlogs WHERE userlog_id = '".$row_id."' LIMIT 1";
$result = mysqli_query ($dbc, $query) or die (mysqli_error () . " De query was: " . $query);
$count 	= mysqli_num_rows($result);

if($count >= 1) {
	$row = mysqli_fetch_array($result);
				
	$log_id 	= $row['nieuws_id'];
	$inleiding 	= $row['inleiding'];
	$titel 		= $row['titel'];
	$datum 		= $row['datum'];
	$tekst 		= $row['tekst'];
	$actief 	= $row['actief'];
	
	list($jaar, $maand, $dag) = split('[/.-]', $datum);
}
?>

<?php
if($_SERVER['REQUEST_METHOD'] == 'POST') {
	// Waarden uit POST verzamelen en variabelen bepalen
	$jaar 		= $_POST['jaar'];
	$maand 		= $_POST['maand'];
	$dag 		= $_POST['dag'];
	$datum 		= $jaar.'-'.$maand.'-'.$dag;
	$titel 		= trim($_POST['titel']);
	$inleiding 	= trim($_POST['inleiding']);
	$tekst 		= trim($_POST['tekst']);
	$actief 	= $_POST['actief'];
	
	// De ingevoerde velden controleren
	if($titel == '') {
		$waarschuwing = '<p class="statuserror">Er is geen titel ingevuld.</p>';
	}
	elseif($tekst == '') {
		$waarschuwing = '<p class="statuserror">Er is geen tekst ingevuld.</p>';
	}
	// WIJZIGEN
	elseif($actie == 'toevoegen') {
		
			//De pagina toevoegen in de database
			$query = "INSERT INTO nieuws (winkel_id, datum, titel, nieuws_url, inleiding, tekst, actief) VALUES (
			'".$_SESSION['user_id']."',
			'".mysqli_real_escape_string($dbc, $datum)."',
			'".mysqli_real_escape_string($dbc, $titel)."',
			'".mysqli_real_escape_string($dbc, url($titel))."',
			'".mysqli_real_escape_string($dbc, $inleiding)."',
			'".mysqli_real_escape_string($dbc, $tekst)."',
			'".mysqli_real_escape_string($dbc, $actief)."'
			)";
			mysqli_query($dbc, $query)
					or die (mysqli_error () . "Error! Er is geen data toegevoegd, de query was: " . $query);
			
			//Id ophalen
			$id = mysqli_insert_id($dbc);
			
			$waarschuwing = '<p class="statusok">U heeft succesvol een nieuwsbericht toegevoegd.</p>';
			echo '<meta http-equiv="refresh" content="3"; URL=?sp='.$sp.'&amp;p='.$p.'&actie=wijzigen&row_id='.$id.'/>';
		
	}
	elseif ($actie == 'wijzigen') {
			//De pagina updaten
			$query = "UPDATE nieuws SET
				datum = '".mysqli_real_escape_string($dbc, $datum)."',
				titel = '".mysqli_real_escape_string($dbc, $titel)."',
				nieuws_url = '".mysqli_real_escape_string($dbc, url($titel))."',
				inleiding = '".mysqli_real_escape_string($dbc, $inleiding)."',
				tekst ='".mysqli_real_escape_string($dbc, $tekst)."',
				actief = '".mysqli_real_escape_string($dbc, $actief)."'
				WHERE nieuws_id = '".$row_id."'";
			mysqli_query($dbc, $query)
				or die (mysqli_error () . "Error! Er is geen data geupdate, de query was: " . $query);
		
	
		$waarschuwing = '<p class="statusok">U heeft dit nieuwsbericht succesvol gewijzigd.</p>';
		echo '<meta http-equiv="refresh" content="3"; URL="?sp='.$sp.'&amp;p='.$p.'&actie=wijzigen&row_id='.$row_id.'"/>';
	}
}
?>

<!-- Hieronder wordt de pagina geladen  -->

<?php
echo '<h2>'.ucfirst($p).' '.$actie.'</h2>';

// Waarschuwing weergeven (als deze bestaat)
if(isset($waarschuwing)){ echo $waarschuwing; }

// Het formulier weergeven
require ('include/formulieren/form_'.$url1.'.php');
?>