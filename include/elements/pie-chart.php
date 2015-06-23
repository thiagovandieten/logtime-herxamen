<div class="pie-chart">
    <div class="pieID pie"></div>
    <ul class="pieID legend">
        <?php
        $query_up   = "SELECT * FROM user_projects WHERE project_id = '".$project_id."' AND active = 1";
        $db         ->query($query_up); 
        $data_up    = $db->resultset();
        $count_up   = $db->rowCount();
        
        foreach ($data_up as $row_up) {
            $user_id    = $row_up['user_id'];

            $query_u    = "SELECT * FROM users WHERE user_id = '".$user_id."' AND active = 1";
            $db         ->query($query_u); 
            $data_u     = $db->single();
            $count_u    = $db->rowCount();
            
            $firstname  = $data_u['firstname'];
            $lastname   = $data_u['lastname'];

            $query_result = "SELECT * FROM userlogs WHERE user_id = '".$user_id."' AND project = '".$projectnaam."'";
            $db->query($query_result); 
            $data_result = $db->single();
            $count       = $db->rowCount();

            if($count >= 1){

                $query_tt   = "SELECT COALESCESEC_TO_TIME(SUM(TIME_TO_SEC(`totaltime`))),0) As total FROM userlogs WHERE user_id = '".$user_id."' AND project = '".$projectnaam."'";
                $db->query($query_tt); 
                $data_tt    = $db->single();
                $count_tt   = $db->rowCount().'<br>';
                
                $totaltime  = $data_tt['total'];
                
                if($totaltime == '' ){ 
                    $totaltime = '0'; 
                }
            ?>
                
            <li>
                <em><?php echo $firstname.' '.$lastname; ?></em> <!--Leerling naam ophalen van db-->
                <span><?php echo round($totaltime); ?></span><!--Totale uren van het project van leerling ophalen van db-->
            </li>
                
            <?php 
            }
            else{
                $melding = '<div style="width: 20%:">Er zijn geen resultaten gevonden</div>';
            }
        }
        ?>
    </ul>
</div>
<?php echo $melding; ?>
<!--Voortgang begint hier-->
<div class="voortgang-leerlingen">
    <div id="canvas-holder">
        <canvas id="chart-area" width="150" height="150"/></canvas>
    </div>
    <p><b><?php echo $voortgang_project; ?></b> <br /> voltooid</p><!--aantal % van de project voortgang ophalen begint hier-->
    

    <?php 
    $query_periode      = "SELECT * FROM projectgroup_periode 
    INNER JOIN periodes ON projectgroup_periode.periode_id = periodes.periode_id
    WHERE project_id    = '".$project_id."' AND projectgroup_id = '".(PROJECTGROUP_ID)."'";
    $db->query($query_periode); 
    $data_periode       = $db->single();
    $count_periode      = $db->rowCount();

    $periode_id         = $data_periode['periode_id'];
    $startdate          = $data_periode['startdate'];
    $stopdate           = $data_periode['stopdate'];

    $today              = date('Y-m-d');

    $date1              = new DateTime($startdate);
    $date2              = new DateTime($stopdate);
    $today              = new DateTime($today);
    
    $count_days         = $date2->diff($date1)->format("%a");
    $remaining_days     = $date2->diff($today)->format("%a");

    if($remaining_days  != 0){
        $process        = $remaining_days / $count_days * 100;
        $process        = round($process);
    }
    else{
        echo $process   = 100;
    }
    // Moet hier in de toekomst een functie voor schrijven, scheelt kopieren plakken 
    // Startdatum omzetten
    $startdatum         = explode("-", $startdate);
    $start_dag          = $startdatum[2];
    $start_maand        = $startdatum[1];
    $start_jaar         = $startdatum[0];

    // Maand cijfers omzetten naar maand namen
    if($start_maand     == '01'){ $start_maand = 'januari'; }
    elseif($start_maand == '02'){ $start_maand = 'februari'; }
    elseif($start_maand == '03'){ $start_maand = 'maart'; }
    elseif($start_maand == '04'){ $start_maand = 'april'; }
    elseif($start_maand == '05'){ $start_maand = 'mei'; }
    elseif($start_maand == '06'){ $start_maand = 'juni'; }
    elseif($start_maand == '07'){ $start_maand = 'juli'; }
    elseif($start_maand == '08'){ $start_maand = 'augustus'; }
    elseif($start_maand == '09'){ $start_maand = 'september'; }
    elseif($start_maand == '10'){ $start_maand = 'oktober'; }
    elseif($start_maand == '11'){ $start_maand = 'november'; }
    elseif($start_maand == '12'){ $start_maand = 'december'; }

    
    // Einddatum omzetten
    $stopdatum          = explode("-", $stopdate);
    $stop_dag           = $stopdatum[2];
    $stop_maand         = $stopdatum[1];
    $stop_jaar          = $stopdatum[0];

    // Maand cijfers omzetten naar maand namen
    if($stop_maand      == '01'){ $stop_maand = 'januari'; }
    elseif($stop_maand  == '02'){ $stop_maand = 'februari'; }
    elseif($stop_maand  == '03'){ $stop_maand = 'maart'; }
    elseif($stop_maand  == '04'){ $stop_maand = 'april'; }
    elseif($stop_maand  == '05'){ $stop_maand = 'mei'; }
    elseif($stop_maand  == '06'){ $stop_maand = 'juni'; }
    elseif($stop_maand  == '07'){ $stop_maand = 'juli'; }
    elseif($stop_maand  == '08'){ $stop_maand = 'augustus'; }
    elseif($stop_maand  == '09'){ $stop_maand = 'september'; }
    elseif($stop_maand  == '10'){ $stop_maand = 'oktober'; }
    elseif($stop_maand  == '11'){ $stop_maand = 'november'; }
    elseif($stop_maand  == '12'){ $stop_maand = 'december'; }


    ?>
    <div class="progress-project">
        <!--Looptijd in elke als de einddatum naderdt dient dat in % te berekenen begin datum en eindatum -->
        <div data-percentage="<?php echo $process; ?>%" style="width: <?php echo $process; ?>%;" class="progress-bar-project progress-bar-success-project" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div> <!--voortgang % in width plaatsen-->
    </div>
    <div class="start-datum">
        <b>Start</b><br />
        <?php echo $start_dag.' '.substr($start_maand, 0,3).' '.$start_jaar ; ?>
    </div>
    <div class="eind-datum">
        <b>Eind</b><br />
        <?php echo $stop_dag.' '.substr($stop_maand, 0,3).' '.$stop_jaar ; ?>
    </div>
</div>