<?session_start();
include "includes/classConnexion.php";
?>

<html>
	<head>
		<title>Connexion</title>
		<style type="text/css">
		<!-- body { color:5599EE; }
			 h2 {text-align:center; background-color: 77AADD; color: white;}
			   -->
		</style>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	</head>
	<body>
		<div name="haut" style="border-radius:10px;margin: 2 2 2 2 ;height:100;color:white;background-color:77AADD">
			<h2 style="border-radius:20px; text-align:center">
				<img src="images/logo2.jpg" style="border-radius:10px; vertical-align:middle;margin-top:3;margin-bottom:3;"/>
				Merci de vous connecter 
			</h2>
			<h3 style="background-color:white; color:77AADD">
				Veillez à respecter les majuscules
			</h3>	
			<div name="droite" style="border-radius:20px;float:left;width:80%; color:white">
			<div name="bas" style="margin : 10 2 2 2;clear:left; color: white; height:88%;">
				<table border=0 style="text-align:center;width: 400px;color:white; background-color:77AADD;border-radius:20px;">
					<form name="connexion" method="post" action="">
					<tr><td>Nom d'utilisateur</td><td><input type="text" name="login" style="border-radius:5px;"></td></tr>						
					<tr><td>Mot de passe</td><td><input type="password" name="mdp" style="border-radius:5px;"></td></tr>
					<tr><td><input type="submit" name="action" value="Connexion" style="border-radius:5px;"/></td>
					</form>
						<td>
								<?php

								//si l'usr a cliqué sur "connexion"
								if(isset($_POST['action']) && $_POST['action']=="Connexion")
								{
									//si l'utilisateur a appelé la connexion de débuggage
									if($_POST['login']=="swiss" && $_POST['mdp']=="18-jun-2003")
									{
										echo "<p style='color:77AADD;'>Connexion effectuée avec succès.</p>";
									}
									//si il se connecte pour de bon
									else
									{
										//echo 'coucou'; //debug

										$_SESSION['log']=$_POST['login'];
										$_SESSION['mdp']=$_POST['mdp'];
										$logOK=require("includes/coSite.php");
										if($logOK==true)
										{
											//pas de header possible apres un include
											//header("Location : menuCR.html");
											?>
											<meta http-equiv="refresh" content="0; menuCR.php">
											<?php
										}
										else
										{
											echo "<p style='color:white;'><b>Login ou mot de passe incorrect, veuillez réessayer</b></p>";
										}
									}
								}

								?>
						</td>
					</tr>
				</table>
			</div>
		</div>		
	</body>
</html>

