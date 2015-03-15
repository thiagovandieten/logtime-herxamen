<?php
if($kop != '') { echo '<h1>'.$kop.'</h1>'; }
if($inleiding != '') { echo '<h2 class="inleiding">'.$inleiding.'</h2>'; }
if($tekst != '') { echo $tekst; }
if($element != '') { include('include/elements/'.$element); }
?>

<div class="personal-settings">
	<form id="contact" method="post" action="">
		<label for="firstname">Voornaam</label>
		<input type="text" name="firstname">

		<label for="lastname">Achternaam</label>
		<input type="text" name="lastname">

		<label for="street">Straat</label>
		<input type="text" name="street">

		<label for="housenumber">Huisnummer</label>
		<input type="text" name="housenumber">

		<label for="firstname">Postcode</label>
		<input type="text" name="firstname">

		<label for="city">Woonplaats</label>
		<input type="text" name="city">

		<label for="email">E-mail</label>
		<input type="email" name="email" >
		 
		<label for="phone">Mobiel</label>
		<input type="phone" name="phone">
		  
		<input type="submit" name="submit" id="submit" value="Opslaan" class="bijwerken" />
	</form>
</div>
