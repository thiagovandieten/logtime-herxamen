<?php 
$query  = "SELECT * FROM users WHERE user_id = '".(USER_ID)."'";
$db->query($query); 
$data   = $db->resultset();
$count  = $db->rowCount();

foreach($data as $value){
    $avatar     = $value['user_image_path'];
    $firstname  = $value['firstname'];
    $lastname   = $value['lastname'];
}

if($avatar == ''){
    $avatar = 'placeholder.png';
}
?>

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
        <img src="<?php echo $userClass->getUserImage()?>" style="display: block; float: left!important" alt="avatar" class="avatar"><!--Avatar van leerling ophalen van db-->
            <p><?php echo $userClass->getFullName()?></p><!--Naam van leerlingen ophalen van db-->

       <img src="_img/icons/instellingen-mob.png" alt="Instellingen" class="mob-instellingen" title="Instellingen">
    </div>
    <div style="clear:both"></div>
    <a href="<?php echo $website; ?>"><span><img src="_img/icons/dashboard.png" alt="Dashboard"></span>Dashboard</a><!--link aankoppelen -->
    <div id="urend"><a href="#"><span><img src="_img/icons/urenreg.png" alt="uren"></span>Uren registreren</a></div><!--link aankoppelen -->

    <!--Uren registratie -->
    <div id="urenreg">
        <div class="uren-wrapper">
            <h2>Uren bijwerken</h2>
            <?php include('include/elements/uren-invullen-form.php'); ?>
        </div>
    </div>

    <?php

    $query = "SELECT * FROM onderdelen WHERE actief = '1' AND menubar = '1' ORDER BY onderdeel_id ASC";
	
	$db->query($query);	
	$data = $db->resultset();
	$count = $db->rowCount();
	
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
	    echo '<a href="'.$url.'" class="'.$class.'"><span>'.$image.'</span>'.$onderdeel.'</a>';
	}
	
	// logout
	if(isset($_GET['logout']) && $_GET['logout'] == true){
		//$loginClass->logout();	
        //include('logout.php');
        //exit();
	}

    ?>

    <a href="#"><span><img src="_img/icons/handleiding.png" alt="Handleiding"></span>Handleiding</a>
    <a href="logout.php"><span><img src="_img/icons/uitloggen.png" alt="Uitloggen"></span>Uitloggen</a>


    <!-- <a href="#"><span><img src="_img/icons/logboek.png" alt="Logboek"></span>Logboek</a>
    <a href="#"><span><img src="_img/icons/instellingen.png" alt="Instellingen"></span>Groeps instellingen</a>
    <a href="#"><span><img src="_img/icons/map.png" alt="Project aanmaken"></span>Project beheer</a>
    <a href="#"><span><img src="_img/icons/handleiding.png" alt="Handleiding"></span>Handleiding</a>
    <a href="#"><span><img src="_img/icons/uitloggen.png" alt="Uitloggen"></span>Uitloggen</a> -->
    

    <!--Uren registratie -->
</nav>

<script>
    $(document).ready(
            function() {
                $("#urend").click(function() {
                    $("#urenreg").toggle();
                });
            });

    $(document).mouseup(function (e)
    {
        var container = $("#urenreg");

        if (!container.is(e.target) // if the target of the click isn't the container...
                && container.has(e.target).length === 0) // ... nor a descendant of the container
        {
            container.hide();
        }
    });
</script>