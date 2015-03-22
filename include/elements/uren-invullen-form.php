<form method="post">             
    <?php
    $query_project  = "SELECT * FROM projects WHERE done = '0' AND active = '1'";
    $result_project = mysqli_query($dbc, $query_project);
    $count_project  = mysqli_num_rows($result_project);

    // Project keuze
    echo '<select name="project">';
    while($row_project = mysqli_fetch_array($result_project)) {
        echo '<option name="project" value="'.$row_project["project"].'" value="'.$row_project['project'].'">'.$row_project["project"].'</option>';
    }
    ?>
    </select>

    <?php
    $query_cat  = "SELECT DISTINCT category FROM categories";
    $result_cat = mysqli_query($dbc, $query_cat);
    $count_cat  = mysqli_num_rows($result_cat);

    // Taak keuze
    echo '<select name="category">';
    while($row_cat = mysqli_fetch_array($result_cat)) {

        echo '<option name="category" value="'.$row_cat['category'].'">'.$row_cat['category'].'</option>';
    }
    ?>
    </select>

    <?php
    $query_task  = "SELECT DISTINCT task FROM tasks";
    $result_task = mysqli_query($dbc, $query_task);
    $count_task  = mysqli_num_rows($result_task);

    // Taak keuze
    echo '<select name="task">';
    while($row_task = mysqli_fetch_array($result_task)) {

        echo '<option name="tasks" value="'.$row_task['task'].'">'.$row_task['task'].'</option>';
    }
    
    ?>
    </select>
    <!--Datum van vandaag tonen -->
    <input type="date" id="input_01" placeholder="Datum" name="date" value="<?php if($_POST['date'] == ''){ echo date('Y-m-d'); }?>" class="datepicker">
    <!--begintijd alleen cijfers mogelijk-->
    <input type="text" placeholder="00:00" name="starttime" maxlength="5" id="uren-klein" onkeyup = "strip(this)" ; onblur = "autoTabTimes(this)">
    <!-- <p class="uren-tot">tot</p> -->
    <!--eindtijd alleen cijfers mogelijk-->
    <input type="text" placeholder="00:00" name="stoptime" value="<?php if($_POST['starttime'] == ''){ echo date('H:i'); }?>" maxlength="5" id="uren-klein" onkeyup = "strip(this)" ; onblur = "autoTabTimes(this)">

    <textarea placeholder="Omschrijving" name="description"></textarea>
    <input type="submit" class="bijwerken" name="bijwerken" value="Opslaan" >
</form>

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