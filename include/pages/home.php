<?php
// De content inladen
$query  = "SELECT * FROM paginas WHERE onderdeel_id = '".$onderdeel_id."' LIMIT 1";
$result = mysqli_query($dbc, $query);
$row    = mysqli_fetch_array($result);
$count  = mysqli_num_rows($result);

$tekst = $row['tekst'];

?>
        <article class="title"><?php echo $tekst ?></article>