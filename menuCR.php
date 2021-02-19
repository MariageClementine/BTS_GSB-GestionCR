<?session_start();
include("includes/classConnexion.php");
$logOK=require("includes/coSite.php");
if($logOK==true)
{
?>
	<html>
		<head>
			<title>GSB : Suivi de la Visite médicale </title>
		</head>
		<body bgcolor="white" text="5599EE">
			<link href="styles/style.css" rel="stylesheet" type="text/css">
			<div name="haut" style="margin: 2 2 2 2 ;height:100; color:white; background-color:77AADD; vertical-align:center;">
				<h1>
					<img style="border-radius:10px;float:left;" src="images/logo2.jpg" /><p style="float:left;">Gestion des visites</p>
				</h1>
			</div>
			<div name="gauche" style="border-radius:20px;float:left;width:18%; background-color:white; height:100%;">
				<h2>Outils</h2>
				<ul><li>Comptes-Rendus</li>
					<ul>
						<li><a href="nouveauRapport.php" >Nouveaux</a></li>
						<li><a href="consulterRapport.php">Consulter</a></li>
					</ul>
					<li>Consulter</li>
					<ul><li><a href="medicament.php" >Médicaments</a></li>
						<li><a href="praticien.php" >Praticiens</a></li>
						<li><a href="visiteur.php" >Autres visiteurs</a></li>
					</ul>
					<li><a href="deconnexion.php">Deconnexion</a></li>
				</ul>
			</div>
			<div name="droite" style="float:left;width:80%;">
				<div name="bas" style="margin : 10 2 2 2;clear:left;background-color:77AADD;color:white;height:88%;">
					<h1>Bienvenue</h1>
				</div>
			</div>
		</body>
	</html>
<?php
}
else
{
	?>
	<meta http-equiv="refresh" content="0; index.php">
	<?php
}
?>