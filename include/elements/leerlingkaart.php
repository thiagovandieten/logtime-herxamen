<?php
$query_up   = "SELECT * FROM user_projects WHERE project_id = '".$project_id."' AND active = '1'";
$db         ->query($query_up); 
$data_up    = $db->resultset();
$count_up   = $db->rowCount();

foreach ($data_up as $row_up) {
    $user_id        = $row_up['user_id'];

    $query_user     = "SELECT * FROM users WHERE user_id = '".$user_id."' AND active = '1'";
    $db             ->query($query_user); 
    $data_user      = $db->single();
    $count_user     = $db->rowCount();
    
    $firstname      = $data_user['firstname'];
    $lastname       = $data_user['lastname'];
    $avatar         = $data_user['user_image_path'];

    $query_log      = "SELECT * FROM userlogs WHERE user_id = '".$user_id."' AND project = '".$projectnaam."' ORDER BY updated_at DESC";
    $db             ->query($query_log);
    $data_log       = $db->single(); 
    $count_log      = $db->rowCount();

    $last_update    = $data_log['updated_at'];

    if($count_log   >= 1){

        $query_tt   = "SELECT SEC_TO_TIME(SUM(TIME_TO_SEC(`totaltime`))) As total FROM userlogs WHERE user_id = '".$user_id."' AND project = '".$projectnaam."'";
        $db         ->query($query_tt); 
        $data_tt    = $db->single();
        $count_tt   = $db->rowCount().'<br>';

        $totaltime  = $data_tt['total'];
        
        if($totaltime == '' ){ 
            $totaltime = '0'; 
        }
                              
        $date               = $last_update;

        $update_datum       = multiexplode(array("-", " ", ":"), $date);
        $update_dag         = $update_datum[2];
        $update_maand       = $update_datum[1];
        $update_jaar        = $update_datum[0];
        $update_uur         = $update_datum[3];
        $update_minuut      = $update_datum[4];
        $update_seconde     = $update_datum[5];

        // Maand cijfers omzetten naar maand namen
        if($update_maand     == '01'){ $maand = 'januari'; }
        elseif($update_maand == '02'){ $maand = 'februari'; }
        elseif($update_maand == '03'){ $maand = 'maart'; }
        elseif($update_maand == '04'){ $maand = 'april'; }
        elseif($update_maand == '05'){ $maand = 'mei'; }
        elseif($update_maand == '06'){ $maand = 'juni'; }
        elseif($update_maand == '07'){ $maand = 'juli'; }
        elseif($update_maand == '08'){ $maand = 'augustus'; }
        elseif($update_maand == '09'){ $maand = 'september'; }
        elseif($update_maand == '10'){ $maand = 'oktober'; }
        elseif($update_maand == '11'){ $maand = 'november'; }
        elseif($update_maand == '12'){ $maand = 'december'; }

        $last_update    = $update_dag.' '.substr($maand, 0,3).' '.$update_jaar;
        $last_update2   = $update_jaar.'-'.$update_maand.'-'.$update_dag;

        $today      = strtotime('today UTC');
        $last_week  = strtotime("-7 day", $today);
        $last_week = date('Y-m-d', $last_week);

        if($last_update2 < $last_week){ 
            $alert = true;
            $last_update = '<h2 style="color: #e84c3d;!important">'.$last_update.'</h2>';
        }
        else{
            $last_update = '<h2>'.$last_update.'</h2>';
            $alert = false;
        }

        // Haal alle categorieen en taken op van de user ( Alleen voor count )
        $query          = "SELECT * FROM user_tasks WHERE project_id = '".$project_id."' AND user_id = '".$user_id."'";
        $db             ->query($query); 
        $data           = $db->resultset();
        $count_tasks    = $db->rowCount();
        
        // Berekening maken om percentage uit te rekenen
        $query_done     = "SELECT is_done FROM user_tasks WHERE project_id = '".$project_id."' AND user_id = '".$user_id."' AND is_done = '1'";
        $db             ->query($query_done); 
        $data_done      = $db->resultset();
        $count_done     = $db->rowCount();

        $is_done        = $data_done['is_done'];
        
        // Start berekening
        $percentage     = $count_done / $count_tasks * 100;
        $percentage     = round($percentage).'%';

    }
    else{ 
        $totaltime      = '0';
        $last_update    = '<h2>-</h2>';
        $percentage     = '0%';
    }

    ?>

    <div class="leerling-kaart">
        <?php if($alert == true){ echo '<img src="_img/icons/alert.png" alt="Alert" title="Logboek lang niet bijgewerkt!" class="alert">'; } ?>
        <img src="_img/uploads/personal_avatar/<?php echo $avatar; ?>" alt="avatar">
        <h2><?php echo $firstname.' '.$lastname; ?></h2>
        <div class="stand-leerling">
            <div class="progress-leerling">
                <div data-percentage="<?php echo $percentage; ?>%" style="width: <?php echo $percentage; ?>%;" class="progress-bar-leerling progress-bar-success-leerling" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
            </div>
        </div>
        <p><?php echo $percentage; ?></p>
        <div class="leerling-uren">
            <h2><?php echo round($totaltime); ?></h2>
            <p>uren</p>
        </div>
        <div class="leerling-datum">
            <?php echo $last_update; ?>
            <p>Laats geupdate</p>
        </div>
    </div>

    <?php
}

?>

