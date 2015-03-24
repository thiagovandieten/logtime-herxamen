<?php
if(isset($_POST['bijwerken'])){
    // Userid definieren (tijdelijk)
    $user_id        = '1';

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

    $project        = '"'.$dbc->real_escape_string($project).'"';
    $category       = '"'.$dbc->real_escape_string($category).'"';
    $task           = '"'.$dbc->real_escape_string($task).'"';
    $date           = '"'.$dbc->real_escape_string($date).'"';
    $user_id        = '"'.$dbc->real_escape_string($user_id).'"';
    $starttime      = '"'.$dbc->real_escape_string($starttime).'"';
    $stoptime       = '"'.$dbc->real_escape_string($stoptime).'"';
    $duration       = '"'.$dbc->real_escape_string($duration).'"';
    $description    = '"'.$dbc->real_escape_string($description).'"';


    $insert_row = $dbc->query("INSERT INTO `userlogs` (starttime, stoptime, totaltime, description, date, user_id, project, category, task) 
    VALUES($starttime, $stoptime, $duration, $description, $date, $user_id, $project, $category, $task)");
}
?>