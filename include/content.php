<?php
if($url1 == '') {
	$url1 = 'dashboard';
	$onderdeel_id = '1';
}
/**
 * @param $url1
 */
// function selectPagesFile($url1)
// {
//     switch($url1) {
//         case($url1 == '' || $url1 == 'dashboard'):
//             return 'dashboard.php';
//             break;
//         case($url1 == 'projecten'):
//             return 'projecten.php';
//             break;
//         default:
//             return 'pagina.php';
//             break;
//     }
// }

if($url1 == 'dashboard') {
	$pagina = 'dashboard.php';
	$body = 'dashboard';
	$onderdeel_id = '1';
}
else{
    // De onderdelen zoeken
    $query  = "SELECT * FROM onderdelen WHERE actief = '1' AND onderdeel_url = '".$url1."' LIMIT 1";
 	$db->query($query);	
	$row = $db->resultset();
	$count = $db->rowCount();
	
    if($count >= 1) {
		
		//Onderdeel id binnen halen
		foreach($row as $value){
			$onderdeel_id = $value['onderdeel_id'];	
		}

        // De pagina's selecteren
      	$query  = "SELECT * FROM paginas WHERE onderdeel_id = '".$onderdeel_id."' AND actief = '1' LIMIT 1";
		
		$db->query($query);	
		$rec = $db->resultset();
		$count = $db->rowCount();

        if($count >= 1) {
        	//Hier kiest hij dus welke pages file hij gaat gebruiken!
            foreach($rec as $value){
				$pagina             = $value['body'] . '.php';
				$pagina_id          = $value['pagina_id'];
				$titel              = $value['titel'];
				$body               = $value['body'];
				$kop                = $value['kop'];
				$tekst              = $value['tekst'];
				$element            = $value['element'];	
			}
        }
        else {
           $pagina = 'handling/404.php';
        }
    }
    else {
           $pagina = 'handling/404.php';
    }
}
?>