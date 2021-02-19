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
				//on interroge la base
				$reqMed = $laBase->requeteSelect("select * from MEDICAMENT where MED_DEPOTLEGAL='".$_POST["medNum"]."';"); 
				$resultat=mysql_fetch_array($reqMed);
				$reqFam = $laBase->requeteSelect("select FAM_LIBELLE from FAMILLE where FAM_CODE='".$resultat["FAM_CODE"]."';");
				$resFam = mysql_fetch_array($reqFam);

				//s'il reste un enregistrement non lu
				if ($resultat != "") 
				{
					//on positionne les champs avec les valeurs de la table
					echo '
					<div name="med" style="float:left">
						<label class="titre">DEPOT LEGAL :</label><label size="5" name="PRA_CODE" class="zone" >'.$resultat["MED_DEPOTLEGAL"].'</label>
						<label class="titre">NOM COMMERCIAL :</label><label size="25" name="PRA_NOM" class="zone" >'.$resultat["MED_NOMCOMMERCIAL"].'</label>
						<label class="titre">FAMILLE :</label><label size="30" name="PRA_PRENOM" class="zone" >'.$resFam["FAM_LIBELLE"].'</label>
						<label class="titre">COMPOSITION :</label><label size="50" name="PRA_ADRESSE" class="zone" >'.$resultat["MED_COMPOSITION"].'</label>
						<label class="titre">EFFETS :</label><label size="6" name="PRA_CP" class="zone" >'.$resultat["MED_EFFETS"].'</label>
						<label class="titre">CONTRE-INDICATIONS :</label><label size="7" name="PRA_COEFNOTORIETE" class="zone" >'.$resultat["MED_CONTREINDIC"].'</label>
						<label class="titre">PRIX ECHANTILLON :</label><label size="3" name="TYP_CODE" class="zone" >'.$resultat["MED_PRIXECHANTILLON"].'</label>
					</div>';
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
