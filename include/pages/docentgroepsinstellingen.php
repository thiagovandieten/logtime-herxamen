<?php
	$groupClass->hasPermission();
    error_reporting(E_ALL);
    if(isset($_GET['new'])){
?>

<section class="ac-container">
<?php
    if(isset($_POST['newGroup'])){
        try
        {
            $groupClass->saveNewGroup($_POST);
        }
        catch(Exception $e)
        {
            var_dump($e);
        }

    }
    // formulier om een nieuwe groep aan te maken //
?>
<p> Nieuwe Groep aanmaken! </p>
  <br/>
  <form method='post'>
    <select name='grade' required>
        <option disabled selected>Kies een leerjaar</option>
        <?php
            foreach ($gradeClass->getAllGrades() as $value)
            {
                echo "<option value='".$value['grade_id']."'>".$value['grade_name']."</option>";
            }
        ?>
    </select>*
    <br/>
    <input type='text' name='groupName' placeholder="Groep naam" required/>*
    <br/>
    <select name='coach' required>
        <option disabled selected>Kies een coach</option>
        <?php
            foreach ($groupClass->getAllTeachers() as $value)
            {
                echo "<option value='".$value['user_id']."'>".$value['firstname']." ".$value['lastname']."</option>";
            }
        ?>
    </select>*
    <br/>
    <select name='project'>
        <option disabled selected>Kies een project</option>
        <?php
            foreach ($projectClass->getAllProjects() as $value)
            {
                echo "<option value='".$value['project_id']."'>".$value['project']."</option>";
            }
        ?>
    </select>
    </br>
    <button type="button" onclick="add_student()" id="add_student">></button><button type="button" onclick="remove_student()" id="remove_student"><</button>
    </br>
    <select multiple id="choose_student">
        <option disabled>Kies een leerlingen</option>
        <?php
            foreach ($studentsettingClass->getAllStudents() as $value)
            {
                echo "<option value='".$value['user_id']."'>".$value['firstname']." ".$value['lastname']."</option>";
            }
        ?>
    </select>
    <!-- TEMP HOE DE STUDENTS GEVULLED WORDT-->
    <select multiple name='students' id="chosen_student" required>
        <option disabled>Gekozen leerlingen</option>
        <?php
            foreach ($studentsettingClass->getAllStudents() as $value)
            {
                echo "<option value='".$value['user_id']."'>".$value['firstname']." ".$value['lastname']."</option>";
            }
        ?>
    </select>*
    <br>
    <select name='projectleider'>
        <option disabled selected>kies een projectleider</option>
    </select>
    <br/>
    <input type='submit' name='newGroup' value='Opslaan' me/>
  </form>
</section>

<?php }
else{
    // toont alle groepen //
?>
<div class="filter-wrap">
  <div class="buttons-wrap"> <a href='docentgroepsinstellingen?new'>
    <button class="nieuw-knop">Nieuw</button>
    </a>
    <button class="delete-knop" style="margin-left: 5px;">Verwijderen</button>
  </div>
</div>
<section class="ac-container">
    <table class="order-table table" cellspacing="0">
        <thead>
            <tr class="border_bottom">
                <td style="color: #666;">#</td>
                <td style="color: #666;">Jaargang</td>
                <td style="color: #666;">Project Groep</td>
                <td style="color: #666;">Coach</td>
                <td style="color: #666;">Project Leider</td>
                <td style="color: #666;">Huidig Project</td>
            </tr>
        </thead>
        <tbody> 
        <?php
            foreach($groupClass->getAllGroups() as $group)
            {
        ?>
            <tr><td><input type="checkbox" style="display: block"></td>
                <td><?php echo $group['grade_name']; ?>      </td>
                <td><?php echo $group['projectgroup_name'];?></td>
                <td><?php echo $group['coach'];?>            </td>
                <td><?php echo $group['leader'];?>           </td>
                <td><?php echo "insert project here";?>      </td>
            </tr>
        <?php
            }
        ?>
        </tbody>
    </table>
</section>  
<?php } ?>