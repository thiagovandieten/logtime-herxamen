<?php
if(isset($_SESSION['geslaagd'])){
    echo '<p class="succeslog">'.$_SESSION['geslaagd'].'</p>';
    unset($_SESSION['geslaagd']);
}

if(isset($_POST['save'])){
    $log_id         = $_POST['log_id'];
    $project        = $_POST['project'];
    $category       = $_POST['category'];
    $task           = $_POST['task'];
    $date           = $_POST['date'];
    if($date == ''){$date = date('Y-m-d');}
    $description    = $_POST['description'];
    
    $starttime      = strtotime($_POST['starttime']);
    $stoptime       = strtotime($_POST['stoptime']);
    $totaltime      = $stoptime - $starttime;
    $duration       = date('H:i:s', $totaltime);   
    $time_part      = explode(':', $duration);
    
    if($starttime == '' || $stoptime == '' || $description == '' || $date == ''){ $melding = '<p class="error">Vul alle velden in</p>'; }

    // Tijd exploden en uur -1 omdat deze standaard 1 uur teveel aangeeft.
    $hour           = $time_part[0] -1;
    $minute         = $time_part[1];
    //$second         = date('s');



    if($hour == '0'){ $hour = '00';}

    $starttime  = date('H:i', $starttime);
    $stoptime   = date('H:i', $stoptime);
    $duration   = $hour.':'.$minute.':'.$second;

    if($melding == ''){

        $db->query("UPDATE `userlogs` SET 
        `project`       = '".$project."',
        `category`      = '".$category."',
        `task`          = '".$task."',
        `date`          = '".$date."',
        `description`   = '".$description."',
        `starttime`     = '".$starttime."',
        `stoptime`      = '".$stoptime."',
        `totaltime`     = '".$duration."'  
        WHERE `userlog_id` = '".$log_id."'");
        
        $db->execute();

        if($db){
           
        }
        else{
            die('Error : ('. $dbc->errno .') '. $dbc->error);
        }

        $succes = '<p class="succeslog">De wijzigingen zijn succesvol opgeslagen!</p>';
    }
}
elseif(isset($_POST['delete'])){
    $log_id = $_POST['log_id'];
    $delete_row = $db->query("DELETE FROM userlogs WHERE userlog_id = '".$log_id."'");
    $db->execute();
    //echo '<meta http-equiv="refresh" content="0; url='.$website.'/'.$url1.'">';

}
elseif(isset($_POST['pdf'])){

    require_once("dompdf/dompdf_config.inc.php");
   
    $query  = "SELECT * FROM userlogs ORDER BY date DESC";
    $db->query($query); 
    $data = $db->resultset();
    $count = $db->rowCount();

    $html =
    '<html><body>
        <table class="order-table table" cellspacing="0">
            <div class="page" style="font-size: 15px">
                <table style="width: 100%;" class="header">
                    <tr>
                        <td><h1 style="text-align: left">LOGBOEK</h1></td>
                        <td><h1 style="text-align: right">2015</h1></td>
                    </tr>
                </table>
                <table style="width: 100%">
                    <tr>
                        <td colspan="6">
                            <h2>Logs:</h2>
                        </td>
                    </tr>
                    <thead>
                        <tr class="border_bottom">
                            <td style="color: #666; width: 14%">Project</td>
                            <td style="color: #666; width: 14%">Datum</td>
                            <td style="color: #666; width: 14%">Taak</td>
                            <td style="color: #666; width: 14%">Begintijd</td>
                            <td style="color: #666; width: 14%">Eindtijd</td>
                            <td style="color: #666; width: 14%">Totale uren</td>
                            <td style="color: #666; width: 14%">Omschrijving</td>
                        </tr>
                    </thead>';
                    
                    foreach($data as $userlog){ 
                        $html .= '
                        <tr>
                        <td style="text-align: left">'.$userlog['project'].'</td>
                        <td style="text-align: left">'.$userlog['date'].'</td>
                        <td style="text-align: left">'.$userlog['task'].'</td>
                        <td style="text-align: left">'.$userlog['starttime'].'</td>
                        <td style="text-align: left">'.$userlog['stoptime'].'</td>
                        <td style="text-align: left">'.$userlog['totaltime'].'</td>
                        <td style="text-align: left">'.$userlog['description'].'</td>
                        </tr>'; 
                    }
                    $html .= '
                </table>
            </div>
        </table>
    </body></html>';
                
                $today = date("Y-m-d-H-i-s");
                $filename = $today."-logboek.pdf";
            
                
            
                $dompdf = new DOMPDF();
                $dompdf->load_html($html);
                $dompdf->render();
                $dompdf->stream($filename);
                 
                $output = $dompdf->output();
                $file_to_save = './exports/pdf/'.$filename;
                file_put_contents($file_to_save, $output);
            
                readfile($file_to_save);
   
}
elseif(isset($_POST['excel'])){
    header('Location: http://localhost/logtime/excel/export.php');
}
?>
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<div class="filter-wrap">
    <div class="filter-omgeving">
        <p>Filter op</p>
        <form>
            <!-- <select class="light-table-filter" data-table="order-table">
                <option value=" ">Leerjaar</option>
                <option value="Leerjaar 1">Leerjaar 1</option>
                <option value="Leerjaar 2">Leerjaar 2</option>
                <option value="Leerjaar 3">Leerjaar 3</option>
            </select>
            <select class="light-table-filter" data-table="order-table">
                <option value=" ">Periode</option>
                <option value="periode 1">Periode 1</option>
                <option value="periode 2">Periode 2</option>
                <option value="periode 3">Periode 3</option>
                <option value="periode 4">Periode 4</option>
            </select> -->
            <?php
            $query_cat  = "SELECT DISTINCT category FROM categories";
            $db->query($query_cat); 
            $data_cat = $db->resultset();
            $count = $db->rowCount();

            // Taak keuze
            echo '<select class="light-table-filter" data-table="order-table">';
            echo '<option value=" ">Categorie</option>';
            foreach($data_cat as $row_cat){
                echo '<option value="Categorie '.$row_cat['category'].'">'.$row_cat['category'].'</option>';
            }
            echo '</select>';
            
            $query_task  = "SELECT DISTINCT task FROM tasks";
            $db->query($query_task); 
            $data_task = $db->resultset();
            $count = $db->rowCount();

            // Taak keuze
            echo '<select class="light-table-filter" data-table="order-table">';
            echo '<option value=" ">Taak</option>';
            foreach($data_task as $row_task){
                echo '<option value="'.$row_task['task'].'">'.$row_task['task'].'</option>';
            }
            echo '</select>';

            $query_date  = "SELECT DISTINCT `date` FROM userlogs";
            $db->query($query_date); 
            $data_date = $db->resultset();
            $count = $db->rowCount();

            // Taak keuze
            echo '<select class="light-table-filter" data-table="order-table">';
            echo '<option value=" ">Datum</option>';
            foreach($data_date as $row_date){
                echo '<option value="'.$row_date['date'].'">'.$row_date['date'].'</option>';
            }
            echo '</select>';
            ?>
        </form>
        <form method="post">
            <input type="submit" name="pdf" value="Genereer PDF">
            <input type="submit" name="excel" value="Genereer Excel">
        </form>
    </div>
</div>
<section class="ac-container">
<!--Uren registratie voor mobiel -->
<section class="ac-container container-mob">
    <div>
        <input id="ac-0" name="accordion-1" type="checkbox" />
        <label class="uren-mob-invullen" for="ac-0"><img src="images/icons/uren-mob.png">Uren invullen</label>
        <article class="ac-small-mob">

            <h3>Uren bijwerken</h3>
            <?php include('include/elements/uren-invullen-form.php'); ?>
        </article>
    </div>
</section>
    <div class="uren-overzicht">
    <?php if(isset($melding)){ echo $melding;} ?>
    <?php if(isset($succes)){ echo $succes;} ?>
        <table class="order-table table" cellspacing="0">
            <thead>
                <tr class="border_bottom">
                    <td style="color: #666; min-width: 130px !important;width: 14%;"></td>
                    <td style="color: #666; width: 15%">Project</td>
                    <td style="color: #666; width: 10%">Categorie</td>
                    <td style="color: #666; width: 12%">Taak</td>
                    <td style="color: #666; width: 10%">Begintijd</td>
                    <td style="color: #666; width: 10%">Eindtijd</td>
                    <td style="color: #666; width: 12%">Totaal uren</td>
                    <td style="color: #666; width: 30%">Omschrijving</td>
                    <td style="color: #666">Bewerken</td>
                    <td style="color: #666">Verwijderen</td>
                </tr>
            </thead>
            <?php
            
            $query  = "SELECT DISTINCT date FROM userlogs ORDER BY date DESC";
            $db->query($query); 
            $data = $db->resultset();
            $count = $db->rowCount();

            foreach($data as $row){
                $date               = $row['date'];

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

                // Engelse dagnaam omzetten naar Nederlandse dagnaam
                $dagnaam = date("l", mktime($ingevoerd_uur, $ingevoerd_minuut, $ingevoerd_seconde, $ingevoerd_maand, $ingevoerd_dag, $ingevoerd_jaar));
                
                if($dagnaam     == 'Monday')    { $dagnaam = 'maandag'; }
                elseif($dagnaam == 'Tuesday')   { $dagnaam = 'dinsdag'; }
                elseif($dagnaam == 'Wednesday') { $dagnaam = 'woensdag'; }
                elseif($dagnaam == 'Thursday')  { $dagnaam = 'donderdag'; }
                elseif($dagnaam == 'Friday')    { $dagnaam = 'vrijdag'; }
                elseif($dagnaam == 'Saturday')  { $dagnaam = 'zaterdag'; }
                elseif($dagnaam == 'Sunday')    { $dagnaam = 'zondag'; }

                $aantal = 1;
                $query1  = "SELECT * FROM userlogs WHERE date LIKE '%".$ingevoerd_jaar.'-'.$ingevoerd_maand.'-'.$ingevoerd_dag."%'";
                $db->query($query1); 
                $data1 = $db->resultset();
                $count1 = $db->rowCount();
            
                ?>
                <tbody>
                <tr>
                    <td rowspan="<?php echo $count1; ?>" align="center"><span class="dagnaam"><?php echo $dagnaam; ?></span><span class="datum-dag"><?php echo $ingevoerd_dag; ?></span><br><span class="datum-maand"><?php echo $maand; ?></span></td>
                <?php

                foreach($data1 as $row1){
                    $log_id         = $row1['userlog_id'];
                    $project        = $row1['project'];
                    $category       = $row1['category'];
                    $task           = $row1['task'];
                    $description    = $row1['description'];
                    $starttime      = $row1['starttime'];
                    $stoptime       = $row1['stoptime'];
                    $totaltime      = $row1['totaltime'];

                    $time_part      = explode(':', $totaltime);
    
                    // Tijd exploden en uur -1 omdat deze standaard 1 uur teveel aangeeft.
                    $hour           = $time_part[0];
                    $minute         = $time_part[1];
                    if($hour >= 1 && $hour <= 9){$hour = '0'.$hour;}
                    $totaltime      = $hour.':'.$minute;

                
                    echo '<form method="post">';
                    echo '<td><input type="text" id="project" name="project" value="'.$project.'"></td>';
                    echo '<td>';

                    $query_cat  = "SELECT DISTINCT category FROM categories";
                    $db->query($query_cat); 
                    $data_cat = $db->resultset();
                    $count = $db->rowCount();

                    // Categorie keuze
                    echo '<select name="category">';
                    foreach($data_cat as $row_cat){
                        echo '<option name="category" value="'.$row_cat['category'].'"'; if($category == $row_cat['category']){ echo 'selected="selected"';} echo '>'.$row_cat['category'].'</option>';
                    }
                    echo '</select>';
                    echo '</td>';

                    echo '<td>';

                    $query_task  = "SELECT DISTINCT task FROM tasks";
                    $db->query($query_task); 
                    $data_task = $db->resultset();
                    $count = $db->rowCount();

                    // Taak keuze
                    echo '<select name="task">';
                    foreach($data_task as $row_task){
                        echo '<option name="tasks" value="'.$row_task['task'].'"'; if($task == $row_task['task']){ echo 'selected="selected"';} echo '>'.$row_task['task'].'</option>';
                    }
                    echo '</select>';
                    echo '</td>';


                    echo '<td><input id="starttime" type="text" name="starttime" value="'.$starttime.'" maxlength="5" onkeyup = "strip(this)"; onchange = "autoTabTimes(this)"></td>';
                    echo '<td><input id="stoptime" type="text" name="stoptime" value="'.$stoptime.'" maxlength="5" onkeyup = "strip(this)"; onchange = "autoTabTimes(this)"></td>';
                    echo '<td>'.$totaltime.'</td>';
                    echo '<td><textarea id="description" name="description">'.$description.'</textarea></td>';
                    echo '<td>';
                    echo '<input type="hidden" name="log_id" value="'.$log_id.'">';
                    echo '<input type="submit" name="save" class="opslaan" value="Opslaan">';
                    echo '</td>';
                    echo '<td>';
                    echo '<input type="hidden" name="log_id" value="'.$log_id.'">';
                    echo '<input type="submit" name="delete" class="verwijderen" value="X">';
                    echo '</td>';
                    echo '</form>';
                    echo '</tr>';

                $aantal++;
                }
                echo '</tbody>';
            }
            ?>

        </table>
    </div>
</section>

<script type = "text/javascript">
     function autoTabTimes(input) {
        var len = input.value.length;
        if (len<3) {
            //alert ("Ongeldige tijdnotatie - vul de juiste notatie in");
            input.value = "";
            return false;
        }
        if (len==3){
            input.value ="0" + input.value;
        }
        var final = input.value.split("");
        var h = Number(final[0] + final[1]);
        var m = Number(final[2] + final[3]);
        if (h <0 || h >23 || m <0 || m >59) {
            //alert ("Invalid time - re-enter it");
            input.value = "";
            return false;
        }
        var f = final[0]+final[1]+":"+final[2]+final[3];
        input.value = f;
        }

        function strip(which) {
        var x = which.value;
        x = x.replace(/[^0-9:]/g,"");  // allow only digits
        which.value = x;
    }
</script>
<script>
    $(document).ready(function()
    {
        $("table tr:odd").css("background-color", "#ededed");
    });
</script>

<script>
    (function(document) {
        'use strict';

        var LightTableFilter = (function(Arr) {

            var _input;

            function _onInputEvent(e) {
                _input = e.target;
                var tables = document.getElementsByClassName(_input.getAttribute('data-table'));
                Arr.forEach.call(tables, function(table) {
                    Arr.forEach.call(table.tBodies, function(tbody) {
                        Arr.forEach.call(tbody.rows, _filter);
                    });
                });
            }

            function _filter(row) {
                var text = row.textContent.toLowerCase(), val = _input.value.toLowerCase();
                row.style.display = text.indexOf(val) === -1 ? 'none' : 'table-row';
            }

            return {
                init: function() {
                    var inputs = document.getElementsByClassName('light-table-filter');
                    Arr.forEach.call(inputs, function(input) {
                        input.oninput = _onInputEvent;
                    });
                }
            };
        })(Array.prototype);

        document.addEventListener('readystatechange', function() {
            if (document.readyState === 'complete') {
                LightTableFilter.init();
            }
        });

    })(document);
</script>