<?php
$query = "SELECT * FROM onderdelen WHERE actief = '1' ORDER BY onderdeel_id ASC";
$result = mysqli_query($dbc, $query);
$count = mysqli_num_rows($result);

while($row = mysqli_fetch_array($result)) {
		$ond_id       = $row['onderdeel_id'];
		$onderdeel    = $row['onderdeel'];
		$url          = $row['onderdeel_url'];
		$menubalk     = $row['menubalk'];
        
        if($ond_id == 1) { 
			$onderdeel = 'home'; 
			$url = '/'; 
		}
    
        if($url1 == $url) { $class = 'active'; }
		else { $class = ''; }
    
    echo '<li><a href="'.$url.'" class="'.$class.'">'.$onderdeel.'</a></li>';
}

?>

