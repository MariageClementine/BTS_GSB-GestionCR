<?session_start();
include("includes/classConnexion.php");
$logOK=require("includes/coSite.php");
if($logOK==true)
{
	?>
	<html>
	<head>
		<title>AUTRES VISITEURS</title>
		<link href="styles/style.css" rel="stylesheet" type="text/css"> 
		<meta http-equiv="content-type" content="text/html; charset=utf-8"/> 
	</head>
	<body>
<?php include_once("styles/haut.html"); ?>
				<h1> Visiteurs </h1>
				<table style="color:white;">
					<?php
						if(isset($_POST['recupDep']) && $_POST['recupDep']=="Rechercher")
						{
							$occur=mysql_query("select DEP_NOM FROM DEPARTEMENT where DEP_CODE='".$_POST['lstDept']."';");
							$dep=mysql_fetch_row($occur);
						?>

							<tr><td>D&eacute;partement: </td><td><?echo($dep[0]);?></td></tr>
							<form name="formVisiteur" method="post" action="">
								<tr>
									<td>
										<select name="lstVisiteur" class="zone">
											<option>Visiteur</option>
						<?php				
											$req2="select VIS_MATRICULE,VIS_NOM,VIS_PRENOM from VISITEUR WHERE DEP_CODE='".$_POST['lstDept']."';";
											$resultat2=mysql_query($req2);
											while($ligne2=mysql_fetch_array($resultat2))
											{
											?>
												<option value="<?=$ligne2["VIS_MATRICULE"]?>">
													<?=$ligne2["VIS_NOM"]?> <?=$ligne2["VIS_PRENOM"]?>
												</option>
											<?php	
											}
											?>		
										</select>
										<input type="submit" name="recupVis" value="Afficher">
									</td>
								</tr>
							</form>
						<?php
						}
						elseif(isset($_POST['recupVis']) && $_POST['recupVis']=="Afficher")
						{
							$occur=mysql_query("select VIS_NOM,VIS_PRENOM,VIS_ADRESSE,VIS_CP,VIS_VILLE,SEC_LIBELLE,LAB_NOM,DELEGUE FROM LABO RIGHT OUTER JOIN VISITEUR ON LABO.LAB_CODE=VISITEUR.LAB_CODE LEFT OUTER JOIN SECTEUR ON SECTEUR.SEC_CODE=VISITEUR.SEC_CODE WHERE VIS_MATRICULE='".$_POST['lstVisiteur']."';");
							$vis=mysql_fetch_row($occur);
						?>
							<tr><td><label class="titre">NOM :</label></td><td><?echo($vis[0]);?></td></tr>
							<tr><td><label class="titre">PRENOM :</label></td><td><?echo($vis[1]);?></td></tr>
							<tr><td><label class="titre">ADRESSE :</label></td><td><?echo($vis[2]);?></td></tr>
							<tr><td><label class="titre">CP :</label></td><td><?echo($vis[3]);?></td></tr>
							<tr><td><label class="titre">VILLE :</label></td><td><?echo($vis[4]);?></td></tr>
							<tr><td><label class="titre">SECTEUR :</label></td><td><?echo($vis[5]);?></td></tr>	
							<tr><td><label class="titre">LABO :</label></td><td><?echo($vis[6]);?></td></tr>	
							<tr><td><label class="titre">DELEGUE* :</label></td><td><?echo($vis[7]);?></td></tr>	
							<tr><td>*1=oui, 0=non</td></tr>
						<?php
						}	
						else
						{
							?>
							<form name="formDept" method="post" action="">	
							<tr>
								<td>
									<select name="lstDept" class="titre">
										<option>D&eacute;partement</option>			
				<?php
										$req="select DEP_CODE, DEP_NOM FROM DEPARTEMENT ORDER BY DEP_NOM";
										$resultat=mysql_query($req);
										while($ligne=mysql_fetch_array($resultat))
										{
										?>
											<option value="<?=$ligne["DEP_CODE"]?>">
												<?=$ligne["DEP_NOM"]?>
											</option>
										<?php	
										}
									   	?>
									</select>	
									<input type ="submit" name="recupDep" value="Rechercher">
								</td>
							</tr>
							</form>
						<?php
						}
						?>
				</table>
<?php include_once("styles/bas.html"); ?>
	</body>
</html>
<?php
}//fin if connecté
else
{
	?>
	<meta http-equiv="refresh" content="0; index.php">
	<?php
}
?>
				