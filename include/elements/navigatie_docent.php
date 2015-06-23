<!-- Rechter navigatie notifications -->
<nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-right" id="cbp-spmenu-s2">
    <div class="noti-mob-instellingen">


    </div>
    <?php
    $notific = $notificationClass->getUserNotifications();
    //print_r($notificationClass->getUserNotifications());

    foreach($notific as $data){
        echo ' <div class="mob-notification">'.wordwrap($data['notification_name']).'</div>';
    }
    ?>

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
    
    <?php

    $query = "SELECT * FROM onderdelen WHERE actief = '1' AND menubar = '1' AND `is_docent` = 1 ORDER BY onderdeel_id ASC";	
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
	    //echo '<li><a href="'.$url.'" class="'.$class.'">'.$onderdeel.'</a></li>';
	    echo '<a href="'.$url.'" class="'.$class.'"><span>'.$image.'</span>'.$onderdeel.'</a>';
	}

    // logout
	if(isset($_GET['logout']) && $_GET['logout'] == true){
		//$loginClass->logout();  
        //include('include/pages/logout.php');
        //exit();
	}

    ?>

    <a href="downloads/Handleiding.pdf"><span><img src="_img/icons/handleiding.png" alt="Handleiding"></span>Handleiding</a>
    <a href="logout.php"><span><img src="_img/icons/uitloggen.png" alt="Uitloggen"></span>Uitloggen</a>

    

</nav>

