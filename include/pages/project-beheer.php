<?php
use Logtime\Project\ProjectGateway;
use Logtime\Grade\GradeGateway;
use Logtime\View\Template\GenerateHTMLTags;

if(isset($_POST['delete'])){
    $project = new ProjectGateway($db);
    $project_id = $_POST['project'];

    $melding = $project->delete($project_id);

}

if(isset($_GET['actie']) && $_GET['actie'] != ''){
    /*
        'projectname' => string 'Blep' (length=4)
        'projectslug' => string 'google.com' (length=10)
        'groups' =>
         array (size=1)
            0 => string '1' (length=1)
        'save' => string 'Opslaan' (length=7)
     */
    include('include/pages/project-beheer_actie.php');
}
else{
    echo GenerateHTMLTags::errorWarningSuccess();
    ?>
        <form method="post" enctype="multipart/form-data">
            <div class="filter-wrap">
                <div class="buttons-wrap">
                    <a href="project-beheer?actie=nieuw" class="nieuw-knop" >Nieuw</a>
                    <input type="submit" name="delete" value="Verwijderen" class="delete-knop" style="margin-left: 5px;" 
                    onclick="return confirm('Je staat om een project te verwijderen. Weet je zeker dat je het project wilt verwijderen?')" >

                </div>
                <div class="filter-omgeving">
                    <p>Filter op</p>
                    
                        <?php
                        //Klas keuze
                        $gradeGateway = new GradeGateway($db);
                        echo GenerateHTMLTags::selectOption($gradeGateway->selectAll(),'grade', 'Leerjaar');

                        $periodeGateway = new \Logtime\Periode\PeriodeGateway($db);
                        echo GenerateHTMLTags::selectOption($periodeGateway->selectAll(),  'periode', 'Periode');
                        // Periode keuze
                        echo GenerateHTMLTags::selectOption($gradeGateway->selectAll(), 'grade_name', 'Klas');
        	            ?>
                </div>
            </div>
            <?php if($melding != ''){ echo "<div class='goed'>".$melding."</div>"; } ?>
            <div class="projecten-overzicht">
                <table class="order-table table" cellspacing="0">
                    <thead>
                    <tr class="border_bottom">
                        <td style="color: #666; width: 3%">#</td>
                        <td style="color: #666; width: 15%">Projectnaam</td>
                        <td style="color: #666; width: 10%">Leerjaar</td>
                        <td style="color: #666; width: 10%">Periode</td>
                        <td style="color: #666; width: 10%">Klas</td>
                        <td style="color: #666">Laats geupdated</td>
                        <td style="color: #666">Voortgang</td>
                    </tr>
                    </thead>
                    <?php
                    $query  = "SELECT * FROM projects WHERE done = 0";
        		    $db->query($query); 
        		    $data = $db->resultset();

                    foreach ($data as $rows){
        				
        				$project_id 	= $rows['project_id'];
        				$projectnaam 	= $rows['project'];
        		    	$project_done 	= $rows['done'];

        		    	$query  = "SELECT * FROM user_tasks WHERE project_id = '".$project_id."'";
        		        $db->query($query); 
        		        $data           = $db->resultset();
        		        $count_tasks    = $db->rowCount();

        		        $query_done  	= "SELECT is_done FROM user_tasks WHERE project_id = '".$project_id."' AND is_done = '1'";
        		        $db->query($query_done); 
        		        $data_done   	= $db->resultset();
        		        $count_done  	= $db->rowCount();

        		        $is_done     	= $data_done['is_done'];
        		        
        		        // Start berekening
        		        $percentage = $count_done / $count_tasks * 100;
        		        $voortgang_project = round($percentage);

        		    	$query_last = "SELECT updated_at FROM projects WHERE project_id = '".$project_id."' ORDER BY updated_at DESC";
                        $db->query($query_last); 
                        $data_last 	= $db->single();
                        $count_last = $db->rowCount();

                        $last_update = $data_last['updated_at'];          

                        $date = $last_update;

                        $update_datum    = multiexplode(array("-", " ", ":"), $date);
                        $update_dag      = $update_datum[2];
                        $update_maand    = $update_datum[1];
                        $update_jaar     = $update_datum[0];
                        $update_uur      = $update_datum[3];
                        $update_minuut   = $update_datum[4];
                        $update_seconde  = $update_datum[5];

                        // Maand cijfers omzetten naar maand namen
                        if($update_maand     == '01'){ $maand = 'januari'; }
                        elseif($update_maand == '02'){ $maand = 'februari'; }
                        elseif($update_maand == '03'){ $maand = 'maart'; }
                        elseif($update_maand == '04'){ $maand = 'april'; }
                        elseif($update_maand == '05'){ $maand = 'mei'; }
                        elseif($update_maand == '06'){ $maand = 'juni'; }
                        elseif($update_maand == '07'){ $maand = 'juli'; }
                        elseif($update_maand == '08'){ $maand = 'augustus'; }
                        elseif($update_maand == '09'){ $maand = 'september'; }
                        elseif($update_maand == '10'){ $maand = 'oktober'; }
                        elseif($update_maand == '11'){ $maand = 'november'; }
                        elseif($update_maand == '12'){ $maand = 'december'; }



                        $last_update    = $update_dag.' '.$maand.' '.$update_jaar;


                        $query = "SELECT * FROM projectgroup_periode 
                        INNER JOIN grade ON projectgroup_periode.grade_id = grade.grade_id 
                        INNER JOIN periodes ON projectgroup_periode.periode_id = periodes.periode_id 
                        WHERE project_id = '".$project_id."'";
                        $db->query($query); 
                        $data 	= $db->single();
                        $count  = $db->rowCount();

                        $grade 		= $data['grade'];
                        $grade_name = $data['grade_name'];
                        $periode 	= $data['periode'];

                        if($project_done == 0){
        		    ?>
        				    <tr>
        		                <td><input name="project" type="checkbox" value="<?php echo $project_id; ?>" style="display: block"></td>
        		                <td><a href="project-beheer?actie=wijzig&id=<?php echo $project_id; ?>"><?php echo $projectnaam; ?></td>
                                <td><span>Leerjaar <?php echo $grade; ?></span></td>
        		                <td>Periode <?php echo $periode; ?></td>
        		                <td>Klas <?php echo $grade_name; ?></td>
        		                <td><?php echo $last_update; ?></td>
        		                <td>
                                    <div class="progress">
        		                        <div data-percentage="<?php echo $voortgang_project; ?>%" style="width: <?php echo $voortgang_project; ?>%;" class="progress-bar progress-bar-success" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
        		                    </div> <p><?php echo $voortgang_project; ?>%</p>
                                </td>
        		            </tr>
        		    <?php
        				}
        				else{ ?>


        			<?php
        				}
                    }
                    ?>
                </table>
                <table cellspacing="0" class="order-table table">
                    <thead>
        	            <tr class="border_bottom">
        	                <td style="color: #666; width: 3%">#</td>
        	                <td style="color: #666; width: 50%">Projectnaam</td>
        	                <td style="color: #666">Afgerond</td>
        	                <td style="color: #666">Tijd</td>
        	            </tr>
                    </thead>
                    <?php
                	$query  = "SELECT * FROM projects WHERE done = 1";
        		    $db->query($query); 
        		    $data = $db->resultset();

        		    
                    foreach ($data as $rows){
        				
        				$project_id 	= $rows['project_id'];
        				$projectnaam 	= $rows['project'];
                        $projectslug    = str_replace(' ', '-', strtolower($projectnaam));
        		    	$project_done 	= $rows['done'];

        		    	$query_last = "SELECT updated_at FROM projects WHERE project_id = '".$project_id."' ORDER BY updated_at DESC";
                        $db->query($query_last); 
                        $data_last 	= $db->single();
                        $count_last = $db->rowCount();

                        $last_update = $data_last['updated_at'];          

                        $date = $last_update;

                        $update_datum    = multiexplode(array("-", " ", ":"), $date);
                        $update_dag      = $update_datum[2];
                        $update_maand    = $update_datum[1];
                        $update_jaar     = $update_datum[0];
                        $update_uur      = $update_datum[3];
                        $update_minuut   = $update_datum[4];
                        $update_seconde  = $update_datum[5];

                        // Maand cijfers omzetten naar maand namen
                        if($update_maand     == '01'){ $maand = 'januari'; }
                        elseif($update_maand == '02'){ $maand = 'februari'; }
                        elseif($update_maand == '03'){ $maand = 'maart'; }
                        elseif($update_maand == '04'){ $maand = 'april'; }
                        elseif($update_maand == '05'){ $maand = 'mei'; }
                        elseif($update_maand == '06'){ $maand = 'juni'; }
                        elseif($update_maand == '07'){ $maand = 'juli'; }
                        elseif($update_maand == '08'){ $maand = 'augustus'; }
                        elseif($update_maand == '09'){ $maand = 'september'; }
                        elseif($update_maand == '10'){ $maand = 'oktober'; }
                        elseif($update_maand == '11'){ $maand = 'november'; }
                        elseif($update_maand == '12'){ $maand = 'december'; }


                        $last_update    = $update_dag.' '.$maand.' '.$update_jaar;

                        $query_tt = "SELECT SEC_TO_TIME(SUM(TIME_TO_SEC(`totaltime`))) As total FROM userlogs WHERE project = '".$projectnaam."'";
                        $db->query($query_tt); 
                        $data_tt    = $db->single();
                        $count_tt   = $db->rowCount().'<br>';

                        $totaltime = $data_tt['total'];
                        
                        if($totaltime == '' ){ 
                            $totaltime = '0'; 
                        }

                		?>
                        
            	        <tr>
        	                <td><input name="project" type="checkbox" value="<?php echo $project_id; ?>" style="display: block" /></td>
        	                <td><a href="<?php echo $projectslug; ?>"><?php echo $projectnaam; ?></a></td>
        	                <td><?php echo $last_update; ?></td>
        	                <td><?php echo $totaltime; ?></td>
            	        </tr>
            		<?php
        			}
            		?>    
        		</table>
            </div>
        </form>
    <?php
    }
    ?>
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