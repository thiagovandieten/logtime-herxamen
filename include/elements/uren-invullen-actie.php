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
    $totaltime      = $stoptime - $starttime;
    $totaltime      = number_format($totaltime, 2);

    $project        = '"'.$dbc->real_escape_string($project).'"';
    $category       = '"'.$dbc->real_escape_string($category).'"';
    $task           = '"'.$dbc->real_escape_string($task).'"';
    $date           = '"'.$dbc->real_escape_string($date).'"';
    $user_id        = '"'.$dbc->real_escape_string($user_id).'"';
    $starttime      = '"'.$dbc->real_escape_string($starttime).'"';
    $stoptime       = '"'.$dbc->real_escape_string($stoptime).'"';
    $description    = '"'.$dbc->real_escape_string($description).'"';


    $insert_row = $dbc->query("INSERT INTO `userlogs` (starttime, stoptime, totaltime, description, date, user_id, project, category, task) 
    VALUES($starttime, $stoptime, $totaltime, $description, $date, $user_id, $project, $category, $task)");
}
?>