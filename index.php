<?php
error_reporting(E_ALL);
ob_start();

$url1 = $_GET['url1'];
$url2 = $_GET['url2'];
$url3 = $_GET['url3'];
$url4 = $_GET['url4'];

session_start();

require ('include/config.php');
require ('include/functions.php');
require ('include/content.php');
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="nl">
    <head>
         
         <!--Meta data-->
         <?php include('include/metatags.php'); ?>

         <!--Styles-->
         <?php include('include/links.php'); ?>
         
         <!--Scripts-->  
         <?php include('include/scripts.php'); ?>

         <title>Logtime v2 | <?php if($url1 == '' || $url1 == 'dashboard'){echo 'Dashboard';} else{echo $titel;} ?></title>
    </head>
    <body>
    
        <!--[if lt IE 7]>
            <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

        <!-- Top Header -->
        <?php include('include/elements/top-header.php'); ?>





        <div class="cbp-spmenu-push cbp-spmenu-push-toright" id="wrapper">           
            <!-- Navigatie -->
            <?php include('include/elements/navigatie.php'); ?>

            <!-- Content inladen -->
            <?php include ('include/pages/'.$pagina); ?>

            <!-- Footer -->
            <section class="footer">
                <?php //include('include/elements/footer.php'); ?>
            </section>
        </div>
        
        <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>

        <script src="_js/notificatie.js"></script>
        <script src="_js/modernizr.custom.js"></script>
        <script src="_js/menuleft.js"></script>
        <script src="_js/legacy.js"></script>
        <script src="_js/Chart.js"></script>

        <script>
            $(document).ready(
                    function() {
                        $("#urend").click(function() {
                            $("#urenreg").toggle();
                        });
                    });

            $(document).mouseup(function (e)
            {
                var container = $("#urenreg");

                if (!container.is(e.target) // if the target of the click isn't the container...
                        && container.has(e.target).length === 0) // ... nor a descendant of the container
                {
                    container.hide();
                }
            });
        </script>
        
    </body>
</html>
