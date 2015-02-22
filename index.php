<?php
error_reporting(0);
ob_start();

$url1 = $_GET['url1'];
$url2 = $_GET['url2'];
$url3 = $_GET['url3'];
$url4 = $_GET['url4'];

session_start();

include('include/config.php');
include('include/content.php');
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

         <title>Logtime v2 | <?php echo $titel; ?></title>
    </head>
    <body>
    
        <!--[if lt IE 7]>
            <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

            <!-- Header - Navigatie -->
            <section class="container">
                <article class="masthead">
                       <?php include('include/elements/navigatie.php'); ?>
                </article>
            </section>

            <!-- Content inladen -->
            <section class="container">
                <?php include ('include/pages/'.$pagina); ?>
            </section> 

            <!-- Footer -->
            <section class="footer">
                <?php //include('include/elements/footer.php'); ?>
            </section>
   
        
        
        
        
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="_js/vendor/jquery-1.11.0.min.js"><\/script>')</script>

        <script src="_js/plugins.js"></script>
        <script src="_js/main.js"></script>

        <!-- Google Analytics: change UA-XXXXX-X to be your site's ID. -->
        <script>
            (function(b,o,i,l,e,r){b.GoogleAnalyticsObject=l;b[l]||(b[l]=
            function(){(b[l].q=b[l].q||[]).push(arguments)});b[l].l=+new Date;
            e=o.createElement(i);r=o.getElementsByTagName(i)[0];
            e.src='//www.google-analytics.com/analytics.js';
            r.parentNode.insertBefore(e,r)}(window,document,'script','ga'));
            ga('create','UA-XXXXX-X');ga('send','pageview');
        </script>
    </body>
</html>
