<?php
    if(isset($_POST['edit'])){
        $log_id         = $_POST['log_id'];
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
        <table class="order-table table" cellspacing="0">
            <thead>
                <tr class="border_bottom">
                    <td style="color: #666; min-width: 130px !important;width: 14%;"></td>
                    <td style="color: #666; width: 10%">Categorie</td>
                    <td style="color: #666; width: 10%">Taak</td>
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
            $result = mysqli_query($dbc, $query);
            $count  = mysqli_num_rows($result); 

            while($row = mysqli_fetch_array($result)) {
                $date           = $row['date'];

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


                $aantal = 1;
                $query1  = "SELECT * FROM userlogs WHERE date LIKE '%".$ingevoerd_jaar.'-'.$ingevoerd_maand.'-'.$ingevoerd_dag."%'";
                $result1 = mysqli_query($dbc, $query1);
                $count1  = mysqli_num_rows($result1);
                ?>
                <tbody>
                <tr>
                    <td rowspan="<?php echo $count1; ?>" align="center"><span class="datum-dag"><?php echo $ingevoerd_dag; ?></span><br><span class="datum-maand"><?php echo $maand; ?></span></td>
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
                
                    echo '<form method="post">';
                    echo '<td>'.$category.'</td>';
                    echo '<td>'.$task.'</td>';
                    echo '<td><input type="text" name="starttime" value="'; if($_POST['starttime'] == ''){ echo $starttime; }else{ echo $starttime;} echo '" maxlength="5" onkeyup = "strip(this)" ; onblur = "autoTabTimes(this)"></td>';
                    echo '<td><input type="text" name="stoptime" value="'; if($_POST['starttime'] == ''){ echo $stoptime; }else{ echo $stoptime;} echo '" maxlength="5" onkeyup = "strip(this)" ; onblur = "autoTabTimes(this)"></td>';
                    echo '<td>'.$totaltime.'</td>';
                    echo '<td><textarea id="description" name="description" onclick="maxSize(this)">';if($_POST['starttime'] == ''){ echo $description; } echo '</textarea></td>';
                    echo '<td>';
                    //echo '<input type="hidden" name="log_id" value="'.$log_id.'">';
                    //echo '<input type="submit" name="save" class="opslaan" value="Opslaan">';
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
        x = x.replace(/[^0-9]/g,"");  // allow only digits
        which.value = x;
    }
</script>

<script type="text/javascript">
    document.getElementById('description').onclick = function(maxSize) {
        $(this).style.cssText = 'height:150px; width: 100%;';
    };
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