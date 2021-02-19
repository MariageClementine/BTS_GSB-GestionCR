<?session_start();
include("includes/classConnexion.php");
$logOK=require("includes/coSite.php");
if($logOK==true)
{
	?>
	<html>
	<head>

</head>
<body>
    <?php
//Vérifier le bouton saisie définitive. si non coché, proposer modif (afficher dans txtEdit enabled true/false?)
	$laBase = new clstBDD;
	$laBase->connecte("localhost","GSBVisiteur","");
	if ($laBase->getConnexion() != null) 
	{ 
		$laBase->connecteBdd("GSB_gestionCR");
		if($laBase->getConnexionBdd() != null)
		{
			//pour éviter l'affichage d'un message d'erreur en cas de non choix
			if($_POST["rapNum"]!="Choisissez l'un de vos rapports")
			{

				//on interroge la base
				$reqRapport = $laBase->requeteSelect('select * from RAPPORT_VISITE where RAP_CODE='.$_POST["rapNum"]); 
				$resultat=mysql_fetch_array($reqRapport);
				$reqPrat = $laBase->requeteSelect("select PRA_NOM, PRA_PRENOM from PRATICIEN where PRA_CODE=".$resultat["PRA_CODE"].";");
				$resPrat = mysql_fetch_array($reqPrat);
				$reqRemplacant=$laBase->requeteSelect('select REMPLACANT from TRAVAILLE where PRA_CODE='.$resultat["PRA_CODE"]);
				$resRemplacant=mysql_fetch_array($reqRemplacant);
				if($resRemplacant["REMPLACANT"]==1){$rem="Oui";}
				else {$rem="Non";}
				$reqMotif= $laBase->requeteSelect("select MOTIF_LIB FROM MOTIF_VISITE INNER JOIN RAPPORT_VISITE ON RAP_MOTIF=MOTIF_CODE WHERE RAP_CODE=".$_POST["rapNum"]);
				$resMotif = mysql_fetch_array($reqMotif);
				$reqProd= $laBase->requeteSelect('select DOC_OFFERTE, MED_DEPOTLEGAL,MED_NOMCOMMERCIAL from PRESENTE NATURAL JOIN MEDICAMENT WHERE VISITE_NUM='.$_POST['rapNum']);
				$reqEchantillon = $laBase->requeteSelect("select MED_DEPOTLEGAL,MED_NOMCOMMERCIAL,OFF_QTE FROM MEDICAMENT NATURAL JOIN OFFRIR WHERE RAP_CODE=".$_POST['rapNum']);
			
				//s'il reste un enregistrement non lu
				if ($resultat != "") 
				{
					if($resultat['SAISIE_FINIE']==true)
					{
						//on positionne les champs avec les valeurs de la table
						echo '
						<div name="prat" style="float:left">
							<label class="titre"><h3>Rapport de Visite</h3></label>
							<label class="titre">NUMERO :</label><label class="zone" >'.$resultat["RAP_CODE"].'</label>
							<label class="titre">DATE VISITE :</label><label class="zone" >'.date('d-m-Y',strtotime($resultat["RAP_DATE_VISITE"])).'</label>
							<label class="titre">PRATICIEN :</label><label class="zone" >'.$resPrat["PRA_NOM"].' '.$resPrat["PRA_PRENOM"].'</label>
							<label class="titre">COEF :</label><label class="zone" >'.$resultat["RAP_COEF_CONFIANCE"].'</label>
							<label class="titre">REMPLACANT :</label><label class="zone" >'.$rem.'</label>
							<label class="titre">DATE SAISIE :</label><label class="zone" >'.$resultat["RAP_DATE_SAISIE"].'</label>
							<label class="titre">MOTIF :</label><label class="zone" >'.$resMotif["MOTIF_LIB"].'</label>
							';
							if(isset ($resultat['RAP_MOTIFAUTRE']))
							{
								echo '<label class="titre">PRECISION</label><label class="zone">'.$resultat['RAP_MOTIFAUTRE'].'</label>';
							}
							echo 
							'
							<label class="titre">BILAN :</label><label class="zone">'.$resultat["RAP_BILAN"].'</label>
							<label class="titre">IMPACT :</label><label class="zone">'.$resultat["RAP_IMPACT"].'</label>
							<label class="titre">CONCURRENCE :</label><label class="zone">'.$resultat["RAP_CONCURRENCE"].'</label>
							<label class="titre"><h3>El&eacute;ments pr&eacute;sent&eacute;s :</h3></label>
							<label class="titre"></label>';
							while ($resProd= mysql_fetch_array($reqProd))
							{
								if($resProd['DOC_OFFERTE']==1) $doc="oui";
								else $doc="non";
								echo '
								<label class="titre">PRODUIT:</label><label class="zone">'.$resProd["MED_NOMCOMMERCIAL"].'</label>
								<label class="titre">DOC OFFERTE :</label><label class="zone">'.$doc.'</label>
								<label class="titre"></label>';
							}
							echo '
							<label class="titre"><h3>Echantillons :</h3></label>';
							while($resEchantillon=mysql_fetch_array($reqEchantillon))
							{
								echo '
								<label class="titre">PRODUIT :</label><label class="zone">'.$resEchantillon["MED_NOMCOMMERCIAL"].'</label>
								<label class="titre">QUANTITE OFFERTE :</label><label class="zone">'.$resEchantillon["OFF_QTE"].'</label>';
							}
							echo '
							<label class="titre"><h3>Divers</h3></label>
							<label class="titre">DUREE SAISIE :</label><label class="zone">'.$resultat["RAP_DUREE_SAISIE"].'</label>
							<label class="titre">BILAN :</label><label class="zone">'.$resultat["RAP_BILAN"].'</label>

						</div>';
					}
					//pb au niveau des checks
					elseif($resultat['SAISIE_FINIE']==false)
					{
					?>
						<label class="titre">NUMERO : </label><input type="text" size="10" name="RAP_NUM" class="zone" value="<?=$_POST['rapNum']?>" READONLY/>
						<label class="titre">DATE VISITE :<p>(au format jj-mm-aaaa)</p></label><input type="text" size="10" name="RAP_DATEVISITE" class="zone" value="<?=$resultat['RAP_DATE_VISITE']?>"/>
						<label class="titre">PRATICIEN :</label><select name="PRA_NUM" class="zone" >
						<option value="<?=$resultat['PRA_CODE']?>"><?=$resPrat['PRA_NOM'].' '.$resPrat['PRA_PRENOM']?></option>
						<?php
								//récupération du praticien
								$reqPrat2=mysql_query("select PRA_CODE,PRA_NOM, PRA_PRENOM from PRATICIEN");
								while($praticien=mysql_fetch_row($reqPrat))
								{
									?>
									<option value="<?=$praticien[0]?>">
										<?=$praticien[1]?>' '<?=$praticien[2]?>	
									</option>
									<?php
								}
							?>
						</select>
						<label class="titre">COEFFICIENT :</label><input type="text" size="6" name="PRA_COEFF" class="zone" value="<?=$resultat['RAP_COEF_CONFIANCE']?>"/>
						<!-- met à jour le remplacant-->
						<label class="titre">REMPLACANT : </label>
						<input type="checkbox" name="REMPLACANT" class="zone" <?php if($resRemplacant["REMPLACANT"]==1) echo " checked=\"on\""; ?> />
						<label class="titre">DATE SAISIE:</label><input type="text" size="19" name="RAP_DATE" class="zone" value="<?=date("d-m-Y")?>"/>
						<label class="titre">MOTIF (verifier "autre et enable le champ"):</label><select  name="RAP_MOTIF" class="zone">
						<option value="<?=$resultat['RAP_MOTIF']?>"><?=$resMotif['MOTIF_LIB']?></option>
														<?php
															$reqMotif=mysql_query("select MOTIF_CODE,MOTIF_LIB FROM MOTIF_VISITE");
															while($motif=mysql_fetch_row($reqMotif))
															{
																?>
																<option value="<?=$motif[0]?>"><?=$motif[1]?></option>
																<?php
															}
														?>
														
													</select>
						<label class="titre">BILAN :</label><textarea rows="5" cols="50" name="RAP_BILAN" class="zone" value="<?=$resultat['RAP_BILAN']?>"></textarea>
						<label class="titre">IMPACT :</label><textarea rows="5" cols="50" name="RAP_IMPACT" class="zone" value="<?=$resultat['RAP_IMPACT']?>"></textarea>
						<label class="titre">CONCURRENCE :</label><textarea rows="5" cols="50" name="RAP_CONCURRENCE" class="zone" value="<?=$resultat['RAP_CONCURRENCE']?>"></textarea>
						<label class="titre" ><h3>Veuillez ressaisir les &eacute;l&eacute;ments pr&eacute;sent&eacute;s </h3></label>
						<label class="titre" >PRODUIT 1 : </label>
						<select name="PROD1" class="zone">
							<?php
								$reqMed=mysql_query("select MED_DEPOTLEGAL,MED_NOMCOMMERCIAL FROM MEDICAMENT");
								while($med=mysql_fetch_row($reqMed))
								{
									?>
									<option value="<?=$med[0]?>"><?=$med[1]?></option>
									<?php
								}
							?>	
						</select>
						<label class="titre">DOCUMENTATION OFFERTE :</label><input name="RAP_DOC" type="checkbox" class="zone" />
						<label class="titre" >PRODUIT 2 : </label>
						<select name="PROD2" class="zone">
							<option value="0">...</option>
							<?php
							$reqMed=mysql_query("select MED_DEPOTLEGAL,MED_NOMCOMMERCIAL FROM MEDICAMENT");
								while($med=mysql_fetch_row($reqMed))
								{
									?>
									<option value="<?=$med[0]?>"><?=$med[1]?></option>
									<?php
								}
								?>
						</select>
						<label class="titre">DOCUMENTATION OFFERTE :</label><input name="RAP_DOC2" type="checkbox" class="zone"/>
						<label class="titre"><h3>Veuillez ressaisir les &eacute;chantillons pr&eacute;sent&eacute;</h3></label>
						<div class="titre" id="lignes">
							<label class="titre" >Produit : </label>
							<select name="PRA_ECH1" class="zone">
								<option value="0">...</option>
							<?php
							$reqMed=mysql_query("select MED_DEPOTLEGAL,MED_NOMCOMMERCIAL FROM MEDICAMENT");
								while($med=mysql_fetch_row($reqMed))
								{
									?>
									<option value="<?=$med[0]?>"><?=$med[1]?></option>
									<?php
								}
								?>
							</select><input type="text" name="PRA_QTE1" size="2" class="zone"/>
							<input type="button" id="but1" value="+" onclick="ajoutLigne(1);" class="zone" />	
						</div>		
						<label class="titre"><h3>Divers</h3></label>
						<label class="titre">DUREE SAISIE (en minutes):</label><input name="RAP_DUREE" type="text" class="zone" value="<?=$resultat['RAP_DUREE_SAISIE']?>">
						<label class="titre">SAISIE DEFINITIVE :</label><input name="RAP_LOCK" type="checkbox" class="zone"/>
						<label class="titre"></label><div class="zone"><input type="reset" value="Annuler"></input><input type="submit" name="action" value="Valider"></input>
					
					<?php
					}
				}
			}
		}	
		$laBase->close();
	}
	?>
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

