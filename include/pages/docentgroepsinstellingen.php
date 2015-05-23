<?php
	$groupClass->hasPermission();
    error_reporting(-1);
    if(isset($_GET['new'])){
?>

<section class="ac-container">
<?php
    if(isset($_POST['newGroup'])){
    }
?>
<p> Nieuwe Groep aanmaken! </p>
  <br/>
  <form method='post'>
    <select name='grade'>
        <option>kies een leerjaar</option>
        <?php ?>
    </select>*
    <br/>
    <input type='text' name='groupName' placeholder="Groep naam" />*
    <br/>
    <select name='coach'>
        <option>kies een coach</option>
        <?php ?>
    </select>*
    <br/>
    <select name='project'>
        <option>kies een project</option>
        <?php ?>
    </select>
    <select multiple name='students'>
        <option>kies een leerlingen</option>
    </select>*
    <select name='projectleider'>
        <option>kies een projectleider</option>
        <?php ?>
    </select>
    <br/>
    <input type='submit' name='newGroup' value='Opslaan' />
  </form>
</section>

<?php }
else{ ?>
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