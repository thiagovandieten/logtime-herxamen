<?php
$query  = "SELECT * FROM user_projects WHERE user_id = '".(USER_ID)."'";
$db->query($query); 
$data = $db->resultset();

foreach ($data as $row) { 
    $project_id = $row['project_id'];


    $query_p  = "SELECT * FROM projects WHERE project_id = '".$project_id."'";
    $db->query($query_p); 
    $data_p = $db->single();

    $projectnaam = $data_p['project'];
    $project_done = $data_p['done'];

    $query_l = "SELECT SEC_TO_TIME(SUM(TIME_TO_SEC(`totaltime`))) As total FROM userlogs WHERE project = '".$projectnaam."'";
    $db->query($query_l); 
    $data_l = $db->single();

    $totaltime = $data_l['total'];
    if($totaltime == ''){ $totaltime = '0'; }

    if($project_done != 1){
        // Berekening maken om percentage uit te rekenen
        // Haal alle categorieen en taken op van de user
        $query  = "SELECT * FROM user_tasks WHERE project_id = '".$project_id."'";
        $db->query($query); 
        $data           = $db->resultset();
        $count_tasks    = $db->rowCount();

        $query_done  = "SELECT is_done FROM user_tasks WHERE project_id = '".$project_id."' AND is_done = '1'";
        $db->query($query_done); 
        $data_done   = $db->resultset();
        $count_done  = $db->rowCount();

        $is_done     = $data_done['is_done'];
        
        // Start berekening
        $percentage = $count_done / $count_tasks * 100;
        $voortgang_project = round($percentage);
    }else{
        $voortgang_project = 100;
    }
    ?>
    
    <section class="ac-container">
        <div>
            <!---bij de id van ac-1 haal je de id op van db bijvoorbeeld ac-2, ac-3 ect geld ook bij de label van for  ac-1-->
            <input id="ac-<?php echo $project_id; ?>" name="accordion-<?php echo $project_id; ?>" type="checkbox" />
            <label for="ac-<?php echo $project_id; ?>">Voortgang van het project <?php echo $projectnaam; ?><!---naam van project hier-->
                <div class="rechts-colum">
                    <p class="totaal-uren"><?php echo $totaltime; ?> uren</p>
                    <div class="progress">
                        <div data-percentage="<?php echo $voortgang_project; ?>%" style="width: <?php echo $voortgang_project; ?>%;" class="progress-bar progress-bar-success" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    <p><?php echo $voortgang_project; ?>%</p>
                </div>
            </label>
            <article class="ac-small">
                <?php
                $query_d  = "SELECT * FROM projectcategories WHERE project_id = '".$project_id."'";
                $db->query($query_d); 
                $data_d = $db->resultset();
                $count  = $db->rowCount();

                // Haal alle categorieen en taken op van dit project
                foreach ($data_d as $row_d) {
                    $category_id = $row_d['category_id'];
                    $task_id     = $row_d['task_id'];

                    $query_cat  = "SELECT * FROM categories WHERE category_id = '".$category_id."'";
                    $db->query($query_cat); 
                    $data_cat = $db->single();

                    $query_task  = "SELECT * FROM tasks WHERE task_id = '".$task_id."'";
                    $db->query($query_task); 
                    $data_task = $db->single();

                    $task = $data_task['task'];

                    //echo 'Taken van dit project: '.$task.'<br>';
                }

                ?>
                <!--hier begin leerlingen kaart-->

                <?php

                $query_up  = "SELECT * FROM user_projects WHERE project_id = '".$project_id."' AND active = 1";
                $db->query($query_up); 
                $data_up = $db->resultset();
                $count_up   = $db->rowCount();
                
                foreach ($data_up as $row_up) {
                    $user_id = $row_up['user_id'];

                    $query_u  = "SELECT * FROM users WHERE user_id = '".$user_id."' AND active = 1";
                    $db->query($query_u); 
                    $data_u = $db->single();
                    $count_u   = $db->rowCount();
                    
                    $firstname  = $data_u['firstname'];
                    $lastname   = $data_u['lastname'];
                    $avatar     = $data_u['user_image_path'];
                   
                    if($count_u){
                        $query1  = "SELECT * FROM userlogs WHERE user_id = '".$user_id."' AND project = '".$projectnaam."'";
                        $db->query($query1); 
                        $count  = $db->rowCount();

                        if($count >= 1){

                            $query_tt = "SELECT SEC_TO_TIME(SUM(TIME_TO_SEC(`totaltime`))) As total FROM userlogs WHERE user_id = '".$user_id."' AND project = '".$projectnaam."'";
                            $db->query($query_tt); 
                            $data_tt    = $db->single();
                            $count_tt   = $db->rowCount().'<br>';

                            $totaltime = $data_tt['total'];
                            
                            if($totaltime == '' ){ 
                                $totaltime = '0'; 
                            }
                                                  
                            $query_last = "SELECT updated_at FROM userlogs WHERE user_id = '".$user_id."' AND project = '".$projectnaam."' ORDER BY updated_at DESC";
                            $db->query($query_last); 
                            $data_last = $db->single();
                            $count_last   = $db->rowCount();

                            $last_update = $data_last['updated_at'];          

                            $date = $last_update;

                            $update_datum    = multiexplode(array("-", " ", ":"), $date);
                            $update_dag      = $update_datum[2];
                            $update_maand    = $update_datum[1];
                            $update_jaar     = $update_datum[0];
                            $update_uur      = $update_datum[3];
                            $update_minuut   = $update_datum[4];
                            $update_seconde  = $update_datum[5];

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
                        }
                        else{ 
                            $totaltime = '0';
                            $last_update = '-'; 
                        }
                        if($last_update2 < $last_week){ 
                            $alert = true;
                            $last_update = '<h2 style="color: #e84c3d;!important">'.$last_update.'</h2>';
                        }
                        else{
                            $last_update = '<h2>'.$last_update.'</h2>';
                            $alert = false;
                        }

                        
                        
                        
                            
                        // Haal alle categorieen en taken op van de user ( Alleen voor count )
                        $query  = "SELECT * FROM user_tasks WHERE project_id = '".$project_id."' AND user_id = '".$user_id."'";
                        $db->query($query); 
                        $data           = $db->resultset();
                        $count_tasks    = $db->rowCount();
                        
                  
                        // Berekening maken om percentage uit te rekenen
                        $query_done  = "SELECT is_done FROM user_tasks WHERE project_id = '".$project_id."' AND user_id = '".$user_id."' AND is_done = '1'";
                        $db->query($query_done); 
                        $data_done   = $db->resultset();
                        $count_done  = $db->rowCount();

                        $is_done     = $data_done['is_done'];
                        
                        // Start berekening
                        $percentage = $count_done / $count_tasks * 100;
                        $percentage = round($percentage);

                        ?>
                    
                        <a href="#"> 
                            <div class="leerling-kaart">
                                <?php if($alert == true){ echo '<img src="_img/icons/alert.png" alt="Alert" title="Logboek lang niet bijgewerkt!" class="alert">'; } ?>
                                <img src="_img/uploads/personal_avatar/<?php echo $avatar; ?>" alt="avatar">
                                <h2><?php echo $firstname.' '.$lastname; ?></h2>
                                <div class="stand-leerling">
                                    <div class="progress-leerling">
                                        <div data-percentage="<?php echo $percentage; ?>%" style="width: <?php echo $percentage; ?>%;" class="progress-bar-leerling progress-bar-success-leerling" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                                <p><?php echo $percentage; ?>%</p>
                                <div class="leerling-uren">
                                    <h2><?php echo round($totaltime); ?></h2>
                                    <p>uren</p>
                                </div>
                                <div class="leerling-datum">
                                    <?php echo $last_update; ?>
                                    <p>Laats geupdate</p>
                                </div>
                            </div>
                        </a>
                        <!--hier eindigt de leerlingen kaart-->
                <?php 
                    }
                } 
                ?>

                <!--Pie chart begint hier-->
                <div class="klas-stats">
                    <div class="pie-chart">
                        <div class="pieID pie">

                        </div>
                        <ul class="pieID legend">
                        <?php
                        $query_up  = "SELECT * FROM user_projects WHERE project_id = '".$project_id."' AND active = 1";
                        $db->query($query_up); 
                        $data_up = $db->resultset();
                        $count_up   = $db->rowCount();
                        
                        foreach ($data_up as $row_up) {
                            $user_id = $row_up['user_id'];

                            $query_u  = "SELECT * FROM users WHERE user_id = '".$user_id."' AND active = 1";
                            $db->query($query_u); 
                            $data_u = $db->single();
                            $count_u   = $db->rowCount();
                            
                            $firstname  = $data_u['firstname'];
                            $lastname   = $data_u['lastname'];

                            $query_tt = "SELECT SEC_TO_TIME(SUM(TIME_TO_SEC(`totaltime`))) As total FROM userlogs WHERE user_id = '".$user_id."' AND project = '".$projectnaam."'";
                            $db->query($query_tt); 
                            $data_tt    = $db->single();
                            $count_tt   = $db->rowCount().'<br>';

                            $totaltime = $data_tt['total'];
                            
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
                        ?>
                        </ul>
                    </div>
                    <!--Pie chart eindigt hier-->

                    <!--Voortgang begint hier-->
                    <div class="voortgang-leerlingen">
                   
                        <div id="canvas-holder">
                            <canvas id="chart-area" width="150" height="150"/></canvas>
                        </div>
                        <p><b><?php echo $voortgang_project; ?>%</b> <br /> voltooid</p><!--aantal % van de project voortgang ophalen begint hier-->
                        

                        <?php 
                        $query_periode  = "SELECT * FROM projectgroup_periode 
                        INNER JOIN periodes ON projectgroup_periode.periode_id = periodes.periode_id
                        WHERE project_id = '".$project_id."' AND projectgroup_id = '".(PROJECTGROUP_ID)."'";
                        $db->query($query_periode); 
                        $data_periode     = $db->single();
                        $count_periode    = $db->rowCount();

                        $periode_id      = $data_periode['periode_id'];
                        $startdate       = $data_periode['startdate'];
                        $stopdate        = $data_periode['stopdate'];

                        $today = date('Y-m-d');

                        $date1 = new DateTime($startdate);
                        $date2 = new DateTime($stopdate);
                        $today = new DateTime($today);
                        

                        $count_days     = $date2->diff($date1)->format("%a");

                        $remaining_days = $date2->diff($today)->format("%a");

                        if($remaining_days != 0){
                            $process        = $remaining_days / $count_days * 100;
                            $process        = round($process);
                        }
                        else{
                            echo $process = 100;
                        }
                        // Moet hier in de toekomst een functie voor schrijven, scheelt kopieren plakken 
                        // Startdatum omzetten
                        $startdatum    = explode("-", $startdate);
                        $start_dag      = $startdatum[2];
                        $start_maand    = $startdatum[1];
                        $start_jaar     = $startdatum[0];

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
                        $stopdatum    = explode("-", $stopdate);
                        $stop_dag      = $stopdatum[2];
                        $stop_maand    = $stopdatum[1];
                        $stop_jaar     = $stopdatum[0];

                        // Maand cijfers omzetten naar maand namen
                        if($stop_maand     == '01'){ $stop_maand = 'januari'; }
                        elseif($stop_maand == '02'){ $stop_maand = 'februari'; }
                        elseif($stop_maand == '03'){ $stop_maand = 'maart'; }
                        elseif($stop_maand == '04'){ $stop_maand = 'april'; }
                        elseif($stop_maand == '05'){ $stop_maand = 'mei'; }
                        elseif($stop_maand == '06'){ $stop_maand = 'juni'; }
                        elseif($stop_maand == '07'){ $stop_maand = 'juli'; }
                        elseif($stop_maand == '08'){ $stop_maand = 'augustus'; }
                        elseif($stop_maand == '09'){ $stop_maand = 'september'; }
                        elseif($stop_maand == '10'){ $stop_maand = 'oktober'; }
                        elseif($stop_maand == '11'){ $stop_maand = 'november'; }
                        elseif($stop_maand == '12'){ $stop_maand = 'december'; }

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
                </div>
                

               
                <!--Voortgang eindigt hier-->
            </article>
        </div>
    </section>
<?php 
} 
?>
