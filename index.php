<?php
error_reporting(0);
ini_set('display_errors', '1');
ob_start();

$url1 = $_GET['url1'];
$url2 = $_GET['url2'];
$url3 = $_GET['url3'];
$url4 = $_GET['url4'];

session_start();

include('include/config.php');
include('include/content.php');
include('include/functions.php');

## Check of user ingelogd is
if($url1 != 'login'){
	$loginClass->loggedIn($url1);
}
?>

<!DOCTYPE html>
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

       
        <?php
			if($url1 == 'login'){
				include ('include/pages/'.$pagina);
			}else{
		?> 
        <!-- Top Header -->
        <?php include('include/elements/top-header.php'); ?>
    	<div class="cbp-spmenu-push cbp-spmenu-push-toright" id="wrapper">           
	        <!-- Navigatie -->
            <?php include('include/elements/'.$userClass->nav().'.php');?>

			<!-- Content inladen -->
            <?php include ('include/pages/'.$pagina); ?>
        

            <!-- Footer -->
            <section class="footer">
                <?php //include('include/elements/footer.php'); ?>
            </section>
        </div>
        <?Php }?>
        
        <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>

        <script src="<?php echo $website; ?>/_js/notificatie.js"></script>
        <script src="<?php echo $website; ?>/_js/modernizr.custom.js"></script>
        <script src="<?php echo $website; ?>/_js/menuleft.js"></script>
        <script src="<?php echo $website; ?>/_js/legacy.js"></script>
        <script src="<?php echo $website; ?>/_js/Chart.js"></script>        
    </body>
</html>
