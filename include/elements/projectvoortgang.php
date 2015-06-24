<?php
if($_SESSION['user']['usertype_id'] == 2){
    $query  = "SELECT * FROM `projects`";
}
else{
   $query  = "SELECT * FROM `user_projects` INNER JOIN `projects` ON `user_projects`.`project_id` = `projects`.`project_id` WHERE `user_id` = '".(USER_ID)."'";
}

$db->query($query); 
$data   = $db->resultset();
$count  = $db->rowCount();

if($count === 0){
    echo '<div class="error">Er is (nog) geen informatie beschikbaar. 
    Je zult eerst in een groep geplaatst moeten worden om je gegevens te zien. <br> Neem contact op met je docent.</div>';
}

$i = 0;
foreach ($data as $row) { 
    $project_id     = $row['project_id'];

    $query_project  = "SELECT * FROM projects WHERE project_id = '".$project_id."'";
    $db->query($query_project); 
    $data_project   = $db->single();

    $projectnaam    = $data_project['project'];
    $project_done   = $data_project['done'];

    if($project_done === 0){
        // Berekening maken om percentage uit te rekenen
        $query_tasks    = "SELECT * FROM user_tasks WHERE project_id = '".$project_id."'";
        $db->query($query_tasks); 
        $data_tasks     = $db->resultset();
        $count_tasks    = $db->rowCount();

        if($count_tasks >= 1){
            $query_done  = "SELECT is_done FROM user_tasks WHERE project_id = '".$project_id."' AND is_done = '1'";
            $db->query($query_done); 
            $data_done   = $db->resultset();
            $count_done  = $db->rowCount();

            $is_done     = $data_done['is_done'];
            
            // Start berekening
            $percentage = $count_done / $count_tasks * 100;
            $voortgang_project = round($percentage).'%';
        }
        else{
            $voortgang_project = 'N/A ';
        }
    }
    else{
        $voortgang_project = '100%';
    }

    $query_result = "SELECT * FROM userlogs WHERE project LIKE '".$projectnaam."'";
    $db->query($query_result); 
    $data_result = $db->single();
    $count       = $db->rowCount();

    if($count >= 1){
        $query_totaltime    = "SELECT COALESCE(SEC_TO_TIME(SUM(TIME_TO_SEC(`totaltime`))),0) As total FROM userlogs WHERE project LIKE '".$projectnaam."'";
        $db->query($query_totaltime); 
        $data_totaltime = $db->single();
        $count          = $db->rowCount();
    }
        $totaltime      = $data_totaltime['total'];

        if($totaltime == ''){ 
            $totaltime = '0'; 
        }
        
        ?>
        <section class="ac-container">
            <div>
                <!---bij de id van ac-1 haal je de id op van db bijvoorbeeld ac-2, ac-3 ect geldt ook bij de label van for  ac-1-->
                <input id="ac-<?php echo $project_id; ?>" name="accordion-<?php echo $project_id; ?>" type="checkbox" />
                <label for="ac-<?php echo $project_id; ?>">Voortgang van het project <?php echo $projectnaam; ?><!---naam van project hier-->
                    <div class="rechts-colum">
                        <p class="totaal-uren"><?php echo $totaltime; ?> uren</p>
                        <div class="progress">
                            <div data-percentage="<?php echo $voortgang_project; ?>%" style="width: <?php echo $voortgang_project; ?>%;" class="progress-bar progress-bar-success" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                        <p><?php echo $voortgang_project; ?></p>
                    </div>
                </label>
                <article class="ac-small">
                    <!--hier begin leerlingen kaart-->
                    <?php include('include/elements/leerlingkaart.php'); ?>
                    <!--hier eindigt de leerlingen kaart-->
                    
                    <div class="klas-stats">
                        <!--Pie chart begint hier-->
                        <?php include('include/elements/pie-chart.php'); ?>
                        <!--Pie chart eindigt hier-->
                    </div>
                </article>
        </section>

    <?php
}
?>




