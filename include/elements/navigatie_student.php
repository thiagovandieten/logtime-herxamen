<!-- Rechter navigatie notifications -->
<nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-right" id="cbp-spmenu-s2">
    <div class="noti-mob-instellingen">
        <div class="mob-aantal-gelezen">
            <a href="#">  9 ongelezen</a><!--Notifications voor mobiel -->
        </div>
        <div class="mob-markeer-alles">
            <a href="#">Markeer alles als gelezen <img src="_img/icons/oog.png" alt="gelezen"></a><!--link om alles gelezen te zetten -->
        </div>
    </div>

    <!--Notifications voor mobiel omvang-->
    <div class="mob-notification">
        <img src="_img/icons/avatar-empty.png" alt="avatar"><!--Leerling avatar ophalen van db-->
        <p><b>Leerling naam </b>is aangewezen als<!--Leerling naam ophalen van db-->
            nieuwe projectleider van de groep.</p>
        <span>12 feb 2014 12:45</span><!--Datum ophalen van db-->
    </div>
    <!--Notifications voor mobiel omvang-->
    <div class="mob-notification">
        <img src="_img/icons/avatar-empty.png" alt="avatar"><!--Leerling avatar ophalen van db-->
        <p><b>Leerling naam </b>is aangewezen als<!--Leerling naam ophalen van db-->
            nieuwe projectleider van de groep.</p>
        <span>12 feb 2014 12:45</span><!--Datum ophalen van db-->
    </div>
    <!--Notifications voor mobiel omvang-->
    <div class="mob-notification">
        <img src="_img/icons/avatar-empty.png" alt="avatar"><!--Leerling avatar ophalen van db-->
        <p><b>Leerling naam </b>is aangewezen als<!--Leerling naam ophalen van db-->
            nieuwe projectleider van de groep.</p>
        <span>12 feb 2014 12:45</span><!--Datum ophalen van db-->
    </div>
</nav>

<nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-left menu-mob-width cbp-spmenu-open" id="cbp-spmenu-s1">
    <!--Profiel voor mobiele weergave-->
    <div class="profiel-mob">
       <img src="_img/icons/avatar-empty.png" style="display: block; float: left!important" alt="avatar" class="avatar"><!--Avatar van leerling ophalen van db-->
            <p>Volledige naam</p><!--Naam van leerlingen ophalen van db-->

       <img src="_img/icons/instellingen-mob.png" alt="Instellingen" class="mob-instellingen" title="Instellingen">
    </div>
    <div style="clear:both"></div>
    <a href="<?php echo $website; ?>"><span><img src="_img/icons/dashboard.png" alt="Dashboard"></span>Dashboard</a><!--link aankoppelen -->
    <div id="urend"><a href="#"><span><img src="_img/icons/urenreg.png" alt="uren"></span>Uren registreren</a></div><!--link aankoppelen -->
    
    <?php

    $query = "SELECT * FROM onderdelen WHERE actief = '1' AND menubar = '1' ORDER BY onderdeel_id ASC";
	//$result = mysqli_query($dbc, $query);
	//$count = mysqli_num_rows($result);
	
	$db->query($query);	
	$data = $db->resultset();
	$count = $db->rowCount();
	
//    while($row = mysqli_fetch_array($result)) {
	foreach($data as $row){
	$ond_id       = $row['onderdeel_id'];
	$onderdeel    = $row['onderdeel'];
	$url          = $row['onderdeel_url'];
	$menubalk     = $row['menubalk'];
	$icon     	  = $row['icon'];

    if($ond_id == 1) { 
		$onderdeel = 'home'; 
		$url = '/'; 
	}

	if($icon != ''){
		$image = '<img src="_img/icons/'.$icon.'" alt="'.$onderdeel.'">';
	}

    if($url1 == $url) { $class = 'active'; }
	else { $class = ''; }
	    //echo '<li><a href="'.$url.'" class="'.$class.'">'.$onderdeel.'</a></li>';
	    echo '<a href="'.$url.'" class="'.$class.'"><span>'.$image.'</span>'.$onderdeel.'</a>';
	}
	
	// logout
	if(isset($_GET['logout']) && $_GET['logout'] == true){
		$loginClass->logout();	
	}

    ?>

    <a href="#"><span><img src="_img/icons/handleiding.png" alt="Handleiding"></span>Handleiding</a>
    <a href="?logout=true"><span><img src="_img/icons/uitloggen.png" alt="Uitloggen"></span>Uitloggen</a>


    <!-- <a href="#"><span><img src="_img/icons/logboek.png" alt="Logboek"></span>Logboek</a>
    <a href="#"><span><img src="_img/icons/instellingen.png" alt="Instellingen"></span>Groeps instellingen</a>
    <a href="#"><span><img src="_img/icons/map.png" alt="Project aanmaken"></span>Project beheer</a>
    <a href="#"><span><img src="_img/icons/handleiding.png" alt="Handleiding"></span>Handleiding</a>
    <a href="#"><span><img src="_img/icons/uitloggen.png" alt="Uitloggen"></span>Uitloggen</a> -->
    

    <!--Uren registratie -->
    <div id="urenreg">
        <div class="uren-wrapper">
            <h2>Uren bijwerken</h2>
            <select name="project">
                <!--Project keuze -->
                <option>Project kiezen</option>
                <option>Logtime</option>
                <option>Malcome</option>
            </select>
            <!--Taak keuze -->
            <select name="taak">
                <option>Taak kiezen</option>
                <option>Fase 0a de briefing</option>
                <option>Fase 0b nulmeting</option>
            </select>
            <!--Hier de datum van vandaag tonen -->
            <input type="date" name="datum" class="datum-pop">
            <!--begintijd alleen cijfers mogelijk-->
            <input type="text" name="starttijd" placeholder="00:00" class="uren">
            <p class="uren-tot">tot</p>
            <!--eindtijd alleen cijfers mogelijk-->
            <input type="text" name="eindtijd" placeholder="00:00" class="uren">
            <textarea name="omschrijving" placeholder="Omschrijving"></textarea>
            <input type="submit" name="bijwerken" class="bijwerken">
        </div>
    </div>
</nav>

