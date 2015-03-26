<?php
function multiexplode ($delimiters,$string) {
    $ready = str_replace($delimiters, $delimiters[0], $string);
    $launch = explode($delimiters[0], $ready);
    return  $launch;
}

// Upload functie
function uploadimg($bestand, $map="", $formaten="", $max_breedte, $max_hoogte, $kwaliteit) {
	
	// Controleren of er een bestand is gekozen
    if (!$_FILES[$bestand]['name']) return array('','U heeft geen bestand gekozen');

	  // Als er een bestand is gekozen naam in variabele (bestandsnaam) plaatsen
    $bestandsnaam = $_FILES[$bestand]['name'];
	
	// Controleren of er een bestand is gekozen
	if($_FILES[$bestand]['size'] > MAXFILESIZE) {
	     $result = "<p class=\"error\">Het bestand '".$_FILES[$bestand]['name']."' is te groot! Het mag niet groter zijn dan ".((MAXFILESIZE/1024)/1024)." mb.";
		return array('',$result);
	}
	
    // Extensie ophalen van het bestand
   	$extensie = strtolower(end(explode(".", $bestandsnaam)));

    // Het bestand een uniek nummer meegeven
    $uniek_nummer = substr(md5(uniqid(rand(),1)),0,5);
    $bestandsnaam = $uniek_nummer . '_' . $bestandsnaam;//Get Unique Name

	// Alle opgegeven formaten omzetten naar onderkast en in een variabele plaatsen
    $alle_formaten = explode(",",strtolower($formaten));
    
	if($formaten) {
		// Controleren of het bestand aan het juiste formaat voldoet
        if(in_array($extensie, $alle_formaten));
        else {
            $result = "<p class=\"error\">'".$_FILES[$bestand]['name']."' is geen geldig bestand.</p>";
            return array('',$result);
        }
    }

    // Locatie waar het bestand moet komen
    if($map) $map .= '/'; // Een '/' toevoegen aan het eind van de map
    $uploadbestand = $map . $bestandsnaam;

    $result = '';
    // Bestand naar de juiste map verplaatsen (tijdelijk naar vast)
    if (!move_uploaded_file($_FILES[$bestand]['tmp_name'], $uploadbestand)) {
        $result = "<p class=\"error\">Kan het bestand '".$_FILES[$bestand]['name']."' niet uploaden";
        if(!file_exists($map)) {
            $result .= " : De map bestaat niet.</p>";
        } 
		elseif(!is_writable($map)) {
            $result .= " : De map is niet schrijfbaar.</p>";
        } 
		elseif(!is_writable($uploadbestand)) {
            $result .= " : Het bestand is niet schrijfbaar.</p>";
        }
        $bestandsnaam = '';
        
    } else {
        if(!$_FILES[$bestand]['size']) { // Controleren of er een bestand is geplaatst
            @unlink($uploadbestand); // Het lege bestand verwijderen
            $bestandsnaam = '';
            $result = "<p class=\"error\">Leeg bestand gevonden - gebruik een geldig bestand!.</p>"; //Show the error message
        } else {
            chmod($uploadbestand,0777); // Het bestand schrijfbaar maken
        }
    }
	// Afbeelding resizen
    // De breedte en hoogte van het bestand ophalen
    list($bestandsbreedte, $bestandshoogte) = getimagesize($uploadbestand);

    // Het bestandstype ophalen
    $bestandstype = exif_imagetype($uploadbestand);

    // Bestandstype en extensie controleren en bronbestand maken
    if( ($extensie =="jpg") && ($bestandstype =="2") ) {
        $bronbestand = imagecreatefromjpeg($uploadbestand);
    }
	elseif( ($extensie =="jpeg") && ($bestandstype =="2") ){
        $bronbestand = imagecreatefromjpeg($uploadbestand);
    }
	elseif( ($extensie =="gif") && ($bestandstype =="1") ){
        $bronbestand = imagecreatefromgif($uploadbestand);
    }
	elseif( ($extensie =="png") && ($bestandstype =="3") ){
        $bronbestand = imagecreatefrompng($uploadbestand);
        //imagealphablending( $bronbestand, true );
        //imagesavealpha( $bronbestand, true );
    }

	// Verhouding (ratio) berekenen voor de breedte (x) en hoogte (y).
	$x_ratio = $max_breedte / $bestandsbreedte;
	$y_ratio = $max_hoogte / $bestandshoogte;
	
	if ($bestandsbreedte <= $max_breedte && $bestandshoogte <= $max_hoogte) {
		// We hoeven niets te berekenen
		$hoogte = $bestandshoogte;
		$breedte = $bestandsbreedte;
	}
	elseif ($bestandshoogte >= $max_hoogte) {
		// De hoogte is groter dan toegestaan, we gaan rekenen met de hoogte
		$hoogte = $max_hoogte;
		$breedte = ceil($y_ratio * $bestandsbreedte);
	}
	else {
		// De breedte is groter dan toegestaan, we gaan rekenen met de breedte
		$breedte = $max_breedte;
		$hoogte = ceil($x_ratio * $bestandshoogte);
	}

    // De nieuwe afbeelding maken (met het aangepaste formaat)
    $eindbestand = imagecreatetruecolor($breedte, $hoogte);
    
    //imagealphablending( $eindbestand, false );
    //imagesavealpha( $eindbestand, true );
    // imagecolortransparent($eindbestand, imagecolorallocate($eindbestand, 0, 0, 0));
    //imagecolortransparent($eindbestand, imagecolorallocate($eindbestand, 0, 0, 0));

    imagecopyresampled($eindbestand, $bronbestand, 0,0,0,0, $breedte, $hoogte, $bestandsbreedte, $bestandshoogte);
 
   	// De nieuwe afbeelding opslaan
  	/*
 	if(true){
   	 imagepng($eindbestand, $uploadbestand, $kwaliteit);
   }
   else {
	*/
	 imagejpeg($eindbestand, $uploadbestand, $kwaliteit);
	/*    }  */
      
    // het geheugen opruimen
    imagedestroy($bronbestand);
    imagedestroy($eindbestand);
	
    return array($bestandsnaam, $result);
}