<?php

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
    
    // Tijd exploden en uur -1 omdat deze standaard 1 uur teveel aangeeft.
    $hour           = $time_part[0] - 1;
    $minute         = $time_part[1];
    //$second         = date('s');

    if($hour == '0'){ $hour = '00';}

    $starttime  = date('H:i', $starttime);
    $stoptime   = date('H:i', $stoptime);
    $duration   = $hour.':'.$minute.':'.$second;

    if($melding == ''){
        $update = $dbc->query("UPDATE userlogs SET 
            project     = '".$project."',
            category    = '".$category."',
            task        = '".$task."',
            date        = '".$date."',
            description = '".$description."',
            starttime   = '".$starttime."',
            stoptime    = '".$stoptime."',
            totaltime   = '".$duration."'
            WHERE userlog_id = '".$log_id."'");

        if($update){
            //echo'Success!'; 
        }
        else{
            die('Error : ('. $dbc->errno .') '. $dbc->error);
        }

        //echo 'Wijzigingen zijn succesvol opgeslagen!';
    }
}
elseif(isset($_POST['delete'])){
    $log_id = $_POST['log_id'];
    $delete_row = $dbc->query("DELETE FROM userlogs WHERE userlog_id = '".$log_id."'");
    //echo '<meta http-equiv="refresh" content="0; url='.$website.'/'.$url1.'">';

}
?>
<div class="filter-wrap">
    <div class="filter-omgeving">
        <p>Filter op</p>
        <form>
            <select class="light-table-filter" data-table="order-table">
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
            </select>
            <select class="light-table-filter" data-table="order-table">
                <option>Categorie</option>
                <option value="Klas 1D0W">1D0W</option>
                <option value="Klas 3H3W">3H0W </option>
                <option value="Klas 3H0W">3H0W</option>
            </select>
            <select class="light-table-filter" data-table="order-table">
                <option>Taak</option>
                <option value="Klas 1D0W">1D0W</option>
                <option value="Klas 3H3W">3H0W </option>
                <option value="Klas 3H0W">3H0W</option>
            </select>
            <select class="light-table-filter" data-table="order-table">
                <option>Datum</option>
                <option value="Klas 1D0W">1D0W</option>
                <option value="Klas 3H3W">3H0W </option>
                <option value="Klas 3H0W">3H0W</option>
            </select>
        </form>
    </div>
</div>
<section class="ac-container">
    <div class="uren-overzicht">
    <?php if(isset($melding)){ echo $melding;} ?>
        <table class="order-table table" cellspacing="0">
            <thead>
                <tr class="border_bottom">
                    <td style="color: #666; min-width: 130px !important;width: 14%;"></td>
                    <td style="color: #666; width: 10%">Categorie</td>
                    <td style="color: #666; width: 12%">Taak</td>
                    <td style="color: #666; width: 10%">Begintijd</td>
                    <td style="color: #666; width: 10%">Eindtijd</td>
                    <td style="color: #666; width: 12%">Totaal uren</td>
                    <td style="color: #666; width: 12%">Datum</td>
                    <td style="color: #666; width: 30%">Omschrijving</td>
                    <td style="color: #666">Bewerken</td>
                    <td style="color: #666">Verwijderen</td>
                </tr>
            </thead>
            <?php
            
            $query  = "SELECT DISTINCT date FROM userlogs ORDER BY date DESC";
            $result = mysqli_query($dbc, $query);
            $count  = mysqli_num_rows($result); 

            while($row = mysqli_fetch_array($result)) {
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
                $result1 = mysqli_query($dbc, $query1);
                $count1  = mysqli_num_rows($result1);
                ?>
                <tbody>
                <tr>
                    <td rowspan="<?php echo $count1; ?>" align="center"><span class="dagnaam"><?php echo $dagnaam; ?></span><span class="datum-dag"><?php echo $ingevoerd_dag; ?></span><br><span class="datum-maand"><?php echo $maand; ?></span></td>
                <?php


                while($row1 = mysqli_fetch_array($result1)) {
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
                    $hour           = $time_part[0] - 1;
                    $minute         = $time_part[1];
                    $totaltime      = $hour.':'.$minute;
                
                    echo '<form method="post">';
                    echo '<td>';

                    $query_cat  = "SELECT DISTINCT category FROM categories";
                    $result_cat = mysqli_query($dbc, $query_cat);
                    $count_cat  = mysqli_num_rows($result_cat);

                    // Taak keuze
                    echo '<select name="category">';
                    while($row_cat = mysqli_fetch_array($result_cat)) {

                        echo '<option name="category" value="'.$row_cat['category'].'"'; if($category == $row_cat['category']){ echo 'selected="selected"';} echo '>'.$row_cat['category'].'</option>';
                    }
                    echo '</select>';
                    echo '</td>';

                    echo '<td>';

                    $query_task  = "SELECT DISTINCT task FROM tasks";
                    $result_task = mysqli_query($dbc, $query_task);
                    $count_task  = mysqli_num_rows($result_task);

                    // Taak keuze
                    echo '<select name="task">';
                    while($row_task = mysqli_fetch_array($result_task)) {

                        echo '<option name="tasks" value="'.$row_task['task'].'"'; if($task == $row_task['task']){ echo 'selected="selected"';} echo '>'.$row_task['task'].'</option>';
                    }
                    echo '</select>';
                    echo '</td>';


                    echo '<td><input id="starttime" type="text" name="starttime" value="'.$starttime.'" maxlength="5"></td>';
                    echo '<td><input id="stoptime" type="text" name="stoptime" value="'.$stoptime.'" maxlength="5"></td>';
                    echo '<td>'.$totaltime.'</td>';
                    echo '<td><input type="text" id="date" name="date" value="'.$date.'"></td>';
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