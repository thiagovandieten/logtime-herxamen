<?php
session_start(); //to ensure you are using same session
session_destroy(); //destroy the session
header('Location:http://logtime.mrydesign.nl/login'); //to redirect back to "index.php" after logging out
exit();
?>