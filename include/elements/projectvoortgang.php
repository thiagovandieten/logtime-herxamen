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

    $query_l = "SELECT SEC_TO_TIME(SUM(TIME_TO_SEC(`totaltime`))) As total FROM userlogs WHERE project = '".$projectnaam."'";
    $db->query($query_l); 
    $data_l = $db->single();

    $totaltime = $data_l['total'];
    if($totaltime == ''){ $totaltime = '0'; }
    
    ?>
    
    <section class="ac-container">
        <div>
            <!---bij de id van ac-1 haal je de id op van db bijvoorbeeld ac-2, ac-3 ect geld ook bij de label van for  ac-1-->
            <input id="ac-<?php echo $project_id; ?>" name="accordion-<?php echo $project_id; ?>" type="checkbox" />
            <label for="ac-<?php echo $project_id; ?>">Voortgang van het project <?php echo $projectnaam; ?><!---naam van project hier-->
                <div class="rechts-colum">
                    <p class="totaal-uren"><?php echo $totaltime; ?> uren</p>
                    <div class="progress">
                        <div data-percentage="0%" style="width: 50%;" class="progress-bar progress-bar-success" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    <p>75%</p>
                </div>
            </label>
            <article class="ac-small">
                <!--hier begin leerlingen kaart-->
                <?php
                $query_up  = "SELECT * FROM user_projects WHERE project_id = '".$project_id."'";
                $db->query($query_up); 
                $data_up = $db->resultset();

                foreach ($data_up as $row_up) {
                    $user_id = $row_up['user_id'];

                    $query_u  = "SELECT * FROM users WHERE user_id = '".$user_id."'";
                    $db->query($query_u); 
                    $data_u = $db->single();

                    $firstname  = $data_u['firstname'];
                    $lastname   = $data_u['lastname'];
                    $avatar     = $data_u['user_image_path'];

                    $query_tt = "SELECT SEC_TO_TIME(SUM(TIME_TO_SEC(`totaltime`))) As total FROM userlogs WHERE user_id = '".$user_id."' AND project = '".$projectnaam."'";
                    $db->query($query_tt); 
                    $data_tt = $db->single();

                    $totaltime = $data_tt['total'];
                    if($totaltime == ''){ $totaltime = '0'; }

                    $query_last = "SELECT * FROM userlogs WHERE userlog_id = (SELECT MAX(userlog_id) FROM userlogs) AND user_id = '".$user_id."' AND project = '".$projectnaam."'";
                    $db->query($query_last); 
                    $data_last = $db->single();

                    $last_update = $data_last['updated_at'];
                    
                    if($last_update != ''){

                        $date               = $last_update;

                        $ingevoerd_datum    = multiexplode(array("-", " ", ":"), $date);
                        $ingevoerd_dag      = $ingevoerd_datum[2];
                        $ingevoerd_maand    = $ingevoerd_datum[1];
                        $ingevoerd_jaar     = $ingevoerd_datum[0];
                        $ingevoerd_uur      = $ingevoerd_datum[3];
                        $ingevoerd_minuut   = $ingevoerd_datum[4];
                        $ingevoerd_seconde  = $ingevoerd_datum[5];

                        // Maand cijfers omzetten naar maand namen
                        if($ingevoerd_maand     == '01'){ $maand = 'januari'; }
                        elseif($ingevoerd_maand == '02'){ $maand = 'februari'; }
                        elseif($ingevoerd_maand == '03'){ $maand = 'maart'; }
                        elseif($ingevoerd_maand == '04'){ $maand = 'april'; }
                        elseif($ingevoerd_maand == '05'){ $maand = 'mei'; }
                        elseif($ingevoerd_maand == '06'){ $maand = 'juni'; }
                        elseif($ingevoerd_maand == '07'){ $maand = 'juli'; }
                        elseif($ingevoerd_maand == '08'){ $maand = 'augustus'; }
                        elseif($ingevoerd_maand == '09'){ $maand = 'september'; }
                        elseif($ingevoerd_maand == '10'){ $maand = 'oktober'; }
                        elseif($ingevoerd_maand == '11'){ $maand = 'november'; }
                        elseif($ingevoerd_maand == '12'){ $maand = 'december'; }

                        $last_update = $ingevoerd_dag.' '.substr($maand, 0,3).' '.$ingevoerd_jaar;
                    }
                    else{ $last_update = '-'; }

                    $query_d  = "SELECT * FROM user_projects INNER JOIN categorie_tasks ON user_projects.categorie_task_id = categorie_tasks.categorie_task_id WHERE user_projects.user_id = '".$user_id."' AND project_id = '".$project_id."'";
                    $db->query($query_d); 
                    $data_d = $db->resultset();
                    echo $count = $db->rowCount();
                ?>

                <a href="#"> 
                    <div class="leerling-kaart">
                        <img src="_img/uploads/personal_avatar/<?php echo $avatar; ?>" alt="avatar">
                        <h2><?php echo $firstname.' '.$lastname; ?></h2>
                        <div class="stand-leerling">
                            <div class="progress-leerling">
                                <div data-percentage="0%" style="width: 74%;" class="progress-bar-leerling progress-bar-success-leerling" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                        </div>
                        <p>74%</p>
                        <div class="leerling-uren">
                            <h2><?php echo round($totaltime); ?></h2>
                            <p>uren</p>
                        </div>
                        <div class="leerling-datum">
                            <h2><?php echo $last_update; ?></h2>
                            <p>Laats geupdate</p>
                        </div>
                    </div>
                </a>
                <?php } ?>

                <!--hier eindigt de leerlingen kaart-->

                <!--Pie chart begint hier-->
                <div class="klas-stats">
                    <div class="pie-chart">
                        <div class="pieID pie">

                        </div>
                        <ul class="pieID legend">
                            <li>
                                <em>Thiago van Dieten</em> <!--Leerling naam ophalen van db-->
                                <span>324 </span><!--Totale uren van het project van leerling ophalen van db-->
                            </li>
                            <li>
                                <em>Fatih Celik</em><!--Leerling naam ophalen van db-->
                                <span>290 </span><!--Totale uren van het project van leerling ophalen van db-->
                            </li>
                            <li>
                                <em>Dennis Eilander</em><!--Leerling naam ophalen van db-->
                                <span>300 </span><!--Totale uren van het project van leerling ophalen van db-->
                            </li>
                            <li>
                                <em>Yannick Berendsen</em><!--Leerling naam ophalen van db-->
                                <span>314 </span><!--Totale uren van het project van leerling ophalen van db-->
                            </li>
                            <li>
                                <em>Phillip Heemskerk</em><!--Leerling naam ophalen van db-->
                                <span>320 </span><!--Totale uren van het project van leerling ophalen van db-->
                            </li>
                        </ul>
                    </div>
                    <!--Pie chart eindigt hier-->

                    <!--Voortgang begint hier-->
                    <div class="voortgang-leerlingen">
                        <div id="canvas-holder">
                            <canvas id="chart-area" width="150" height="150"/></canvas>
                        </div>
                        <p><b>75%</b> <br /> voltooid</p><!--aantal % van de project voortgang ophalen begint hier-->
                        <div class="progress-project">
                            <!--Looptijd in elke als de einddatum naderdt dient dat in % te berekenen begin datum en eindatum -->
                            <div data-percentage="0%" style="width: 30%;" class="progress-bar-project progress-bar-success-project" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div> <!--voortgang % in width plaatsen-->
                        </div>
                        <div class="start-datum">
                            <b>Start</b><br />
                            19 sep 2016 <!--Startdatum van db ophalen-->
                        </div>
                        <div class="eind-datum">
                            <b>Eind</b><br />
                            24 sep 2017<!--Startdatum van db ophalen-->
                        </div>
                    </div>
                </div>
                <!--Voortgang eindigt hier-->
            </article>
        </div>
    </section>
<?php } ?>
