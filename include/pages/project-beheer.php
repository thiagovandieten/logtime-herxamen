<div class="content">
<?php
	if($kop != '') { echo '<h1>'.$kop.'</h1>'; }
    if($inleiding != '') { echo '<h2 class="inleiding">'.$inleiding.'</h2>'; }
    if($tekst != '') { echo $tekst; }
    if($element != '') { include('include/elements/'.$element); }
    ?>
<p>Projecten</p>
</div>