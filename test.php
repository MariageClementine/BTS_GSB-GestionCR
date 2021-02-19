<?php // test

include ("includes/classConnexion.php");
$coTest=new clstBDD();
//echo $coTest->connecte('localhost','root','ini01');
$coTest->connecte('localhost','root','ini01');
echo $coTest->getConnexion();
?>

