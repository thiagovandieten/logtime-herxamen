<?php
	$groupClass->isTeacher();
    if(isset($_GET['new'])){
?>

<section class="ac-container">
<?php
    if(isset($_POST['newGroup'])){
        $status = $groupClass->saveNewGroup($_POST);
    }
    //----------------------------------------formulier om een nieuwe groep aan te maken----------------------------------------//
    if(isset($status))
    {
        echo "<div class='".$status['class']."'>".$status['message']."</div>";
    }
?>
<script src="<?php echo $website; ?>/_js/selectStudent.js"></script>
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
    </br>
    <button type="button" onclick="javascript:addStudent();" id="add_student">></button><button type="button" onclick="javascript:removeStudent();" id="remove_student"><</button>
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
    <select multiple name='students[]' id="chosen_student" required>
        <option disabled>Gekozen leerlingen</option>
    </select>*
    <br>
    <select name='projectleider' id="projectleider">
        <option disabled selected>kies een projectleider</option>
    </select>
    <br/>
    <input type='submit' name='newGroup' value='Opslaan' me/>
  </form>
</section>

<?php }
elseif (isset($_GET['edit'])) {
    //----------------------------------------formulier om een groep te wijzigen----------------------------------------//
    $group = $groupClass->teacherGetGroup($_GET['edit']);
    if(isset($_POST['editGroup'])){
        $status = $groupClass->updateGroup($_POST);

    }
    if(isset($status))
    {
        echo "<div class='".$status['class']."'>".$status['message']."</div>";
    }
   ?>
<script src="<?php echo $website; ?>/_js/selectStudent.js"></script>
<p> Groep wijzigen </p>
  <br/>
  <form method='post'>
    <select name='grade' required>
        <option disabled>Kies een leerjaar</option>
        <?php
            foreach ($gradeClass->getAllGrades() as $value)
            {
                $selected = "";
                if ($group['grade_id'] == $value['grade_id']) {
                    $selected = "selected";
                }
                echo "<option value='".$value['grade_id']."'" . $selected . ">".$value['grade_name']."</option>";
            }
        ?>
    </select>*
    <br/>
    <input type='text' name='groupName' value="<?php echo $group['projectgroup_name']; ?>" required/>*
    <br/>
    <select name='coach' required>
        <option disabled>Kies een coach</option>
        <?php
            foreach ($groupClass->getAllTeachers() as $value)
            {
                $selected = "";
                if ($group['coach_id'] == $value['user_id']) {
                    $selected = "selected";
                }
                echo "<option value='".$value['user_id']."'" . $selected . ">".$value['firstname']." ".$value['lastname']."</option>";
            }
        ?>
    </select>*
    </br>
    <button type="button" onclick="javascript:addStudent();" id="add_student">></button><button type="button" onclick="javascript:removeStudent();" id="remove_student"><</button>
    </br>
    <select multiple id="choose_student">
        <option disabled>Kies een leerlingen</option>
        <?php
            foreach ($studentsettingClass->getAllStudents() as $value)
            {
                foreach ($group['students'] as $student) {
                    if (in_array($value['user_id'], $student)) {
                        continue 2;
                    }
                }
                echo "<option value='".$value['user_id']."'>".$value['firstname']." ".$value['lastname']."</option>";
            }
        ?>
    </select>
    <select multiple name='students[]' id="chosen_student" required>
        <option disabled>Gekozen leerlingen</option>
        <?php
            foreach ($group['students'] as $student) {

                echo "<option value='".$student['user_id']."' selected>".$student['firstname']." ".$student['lastname']."</option>";
            }
        ?>
    </select>*
    <br>
    <select name='projectleider' id="projectleider">
        <option disabled>kies een projectleider</option>
        <?php
            foreach ($group['students'] as $student) {
                $selected = "";
                if ($group['leader_id'] == $student['user_id']) {
                    $selected = "selected";
                }
                echo "<option value='".$student['user_id']."'>".$student['firstname']." ".$student['lastname']."</option>";
            }
        ?>
    </select>
    <input type="hidden" name="group_id" value="<?php echo $group['projectgroup_id'];?>">
    <br/>
    <input type='submit' name='editGroup' value='Opslaan' me/>
  </form>
</section>

   <?php
} 
else{
    //----------------------------------------Delete group----------------------------------------//
    if (isset($_POST['delete'])) {
        if (isset($_POST['group'])) {
            $status = $groupClass->deleteGroup($_POST['group']);
        }
        else
        {
            $status = false;
        }
      
    }
    //----------------------------------------toont alle groepen----------------------------------------//
?>
<div class="filter-wrap">
<?php 
    if(isset($status))
    {
        echo "<div class='".$status['class']."'>".$status['message']."</div>";
    }
?>
<form method="POST">
  <div class="buttons-wrap"> <a href='docentgroepsinstellingen?new'>
    <button type="button" class="nieuw-knop">Nieuw</button>
    </a>

    <input type="submit" class="delete-knop" style="margin-left: 5px;" name="delete" value="Verwijderen">
  </div>
</div>
<section class="ac-container">
    <table class="order-table table" cellspacing="0">
        <thead>
            <tr class="border_bottom">
                <td style="color: #666;">#</td>
                <td style="color: #666;">Jaargang </td>
                <td style="color: #666;">Project Groep </td>
                <td style="color: #666;">Coach </td>
                <td style="color: #666;">Project Leider </td>
            </tr>
        </thead>
        <tbody> 
        <?php
            foreach($groupClass->getAllGroups() as $group)
            {
        ?>
        <tr>
            <td><input type="checkbox" style="display: block" name="group[]"value="<?php echo $group['projectgroup_id'];?>" ></td>
                <td onclick="document.location = 'docentgroepsinstellingen?edit=<?php echo $group['projectgroup_id'];?>';"> <?php echo $group['grade_name']; ?>      </td>
                <td onclick="document.location = 'docentgroepsinstellingen?edit=<?php echo $group['projectgroup_id'];?>';"> <?php echo $group['projectgroup_name'];?></td>
                <td onclick="document.location = 'docentgroepsinstellingen?edit=<?php echo $group['projectgroup_id'];?>';"><?php echo $group['coach'];?>            </td>
                <td onclick="document.location = 'docentgroepsinstellingen?edit=<?php echo $group['projectgroup_id'];?>';"><?php if(!isset($group['leader']))
                            {
                                echo "Geen project leider";
                            }
                            else
                            {
                                echo $group['leader'];
                            } 
                ;?>      </td>
        </tr>
        
        <?php
            }
        ?>
        </tbody>
    </table>
    </form>
</section>  
<?php } ?>