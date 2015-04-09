<?php

if(isset($_POST['bijwerken'])){
    $project        = $_POST['project'];
    $category       = $_POST['category'];
    $task           = $_POST['task'];
    $date           = $_POST['date'];
    $description    = $_POST['description'];
    $starttime      = $_POST['starttime'];
    $stoptime       = $_POST['stoptime'];
    $totaltime      = strtotime($stoptime) - strtotime($starttime);
    $duration       = date('H:i:s', $totaltime);   
    $time_part      = explode(':', $duration);

    // Tijd exploden en uur -1 omdat deze standaard 1 uur teveel aangeeft.
    $hour           = $time_part[0] - 1;
    $minute         = $time_part[1];
    $second         = $time_part[2];

    if($hour == '0'){ $hour = '00';}

    $duration   = $hour.':'.$minute.':'.$second;

    $db->query("INSERT INTO `userlogs` (`starttime`, `stoptime`, `totaltime`, `description`, `date`, `user_id`, `project`, `category`, `task`) 
    VALUES('".$starttime."', '".$stoptime."', '".$duration."', '".$description."', '".$date."', '".(USER_ID)."', '".$project."', '".$category."', '".$task."')");
    $db->execute();
}

?>