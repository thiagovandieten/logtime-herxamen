<?php
if($url1 == '') {
	$url1 = 'home';
	$onderdeel_id = '1';
}
/**
 * @param $url1
 */
function selectPagesFile($url1)
{
    switch($url1) {
        case($url1 == '' || $url1 == 'home'):
            return 'home.php';
            break;
        case($url1 == 'projecten'):
            return 'projecten.php';
            break;
        default:
            return 'pagina.php';
            break;
    }
}

if($url1 == 'home') {
	$pagina = 'home.php';
	$body = 'home';
	$onderdeel_id = '1';
}
else{
    
    // De onderdelen zoeken
    $query  = "SELECT * FROM onderdelen WHERE actief = '1' AND onderdeel_url = '".$url1."' LIMIT 1";
    $result = mysqli_query($dbc, $query);
    $row    = mysqli_fetch_array($result);
    $count  = mysqli_num_rows($result);

    if($count >= 1) {

        $onderdeel_id = $row['onderdeel_id'];

        // De pagina's selecteren
        $query  = "SELECT * FROM paginas WHERE onderdeel_id = '".$onderdeel_id."' AND actief = '1' LIMIT 1";
        $result = mysqli_query($dbc, $query);
        $count  = mysqli_num_rows($result);
        $rec    = mysqli_fetch_array($result);

        if($count >= 1) {
        //Hier kiest hij dus welke pages file hij gaat gebruiken!
            $pagina = selectPagesFile($url1);
            $pagina_id          = $rec['pagina_id'];
                    $titel              = $rec['titel'];
                    $body               = $rec['body'];
                    $kop                = $rec['kop'];
                    $tekst              = $rec['tekst'];
                    $element            = $rec['element'];
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