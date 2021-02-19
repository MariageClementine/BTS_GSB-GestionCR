<?session_start();
include("includes/classConnexion.php");
$logOK=require("includes/coSite.php");
if($logOK==true)
{
	$laBase = new clstBDD;
	$laBase->connecte("localhost","GSBVisiteur","");
	if ($laBase->getConnexion() != null) 
	{ 
		$laBase->connecteBdd("GSB_gestionCR");
		if($laBase->getConnexionBdd() != null)
		{
			//pour éviter l'affichage d'un message d'erreur en cas de non choix
			if($_POST["pratNum"]!="Choisissez un praticien")
			{
				//on interroge la base
				$reqPrat = $laBase->requeteSelect('select * from PRATICIEN where PRA_CODE='.$_POST["pratNum"]); 
				$resultat=mysql_fetch_array($reqPrat);
				$reqType = $laBase->requeteSelect("select TYP_LIBELLE from TYPE_PRATICIEN where TYP_CODE='".$resultat["TYP_CODE"]."'");
				$resType = mysql_fetch_array($reqType);
				$reqRemplacant=$laBase->requeteSelect('select REMPLACANT from TRAVAILLE where PRA_CODE='.$_POST["pratNum"]);
				$resRemplacant=mysql_fetch_array($reqRemplacant);
				if($resRemplacant["REMPLACANT"]==1){$rem="Oui";}
				else {$rem="Non";}
				$reqCab= $laBase->requeteSelect('select * from CABINET NATURAL JOIN TRAVAILLE WHERE PRA_CODE='.$_POST["pratNum"]);
				$resCab=mysql_fetch_array($reqCab);
				//s'il reste un enregistrement non lu
				if ($resultat != "") 
				{
					//on positionne les champs avec les valeurs de la table
					echo '
					<div name="prat" style="float:left">
						<label class="titre">NUMERO :</label><label size="5" name="PRA_CODE" class="zone" >'.$resultat["PRA_CODE"].'</label>
						<label class="titre">NOM :</label><label size="25" name="PRA_NOM" class="zone" >'.utf8_encode($resultat["PRA_NOM"]).'</label>
						<label class="titre">PRENOM :</label><label size="30" name="PRA_PRENOM" class="zone" >'.$resultat["PRA_PRENOM"].'</label>
						<label class="titre">ADRESSE :</label><label size="50" name="PRA_ADRESSE" class="zone" >'.$resultat["PRA_ADRESSE"].'</label>
						<label class="titre">CP :</label><label size="6" name="PRA_CP" class="zone" >'.$resultat["PRA_CP"].' '.$resultat["PRA_VILLE"].'</label>
						<label class="titre">COEFF. NOTORIETE :</label><label size="7" name="PRA_COEFNOTORIETE" class="zone" >'.$resultat["PRA_COEFNOTORIETE"].'</label>
						<label class="titre">TYPE :</label><label size="3" name="TYP_CODE" class="zone" >'.$resType["TYP_LIBELLE"].'</label>
						<label class="titre">Remplaçant:</label><label size="3" name="REMPLACANT" class="zone">'.$rem.'</label>
						<label class="titre">&nbsp;</label>
					<div class="zone">
						<input type="button" value="<" onClick="precedent();"></input><input type="button" value=">" onClick="suivant();"></input>
					</div>
					</div>
					<div name="cab" style="float:right; ">
						<label class="titre" style="font-size:2em; text-decoration:underline">Cabinet:</label><label>  </label>
						<label class="titre">NUMERO :</label><label size="5" name="CAB_ID" class="zone">'.$resCab["CAB_ID"].'</label>
						<label class="titre">LOCAL :</label><label size="30" name="CAB_LOCAL" class="zone">'.$resCab["CAB_LOCAL"].'</label>
						<label class="titre">TEL :</label><label size="13" name="CAB_TEL" class="zone">'.$resCab["CAB_TEL"].'</label>
						<label class="titre">VILLE :</label><label size="20" name="CAB_VILLE" class="zone">'.$resCab["CAB_VILLE"].'</label>
					</div>';
				}
			}
		}	
		$laBase->close();
	}
}
else
{
	?>
	<meta http-equiv="refresh" content="0; index.php">
	<?php
}
?>