<?session_start();
include("includes/classConnexion.php");
$logOK=require("includes/coSite.php");
if($logOK==true)
{
	?>
	<html><head>
	<title>CREER UN RAPPORT</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8"/>
	<link href="styles/style.css" rel="stylesheet" type="text/css">
	<script language="javascript">
		function selectionne() {
			//active l'objet pObjet du formulaire si la valeur sélectionnée (pSelection) est égale à la valeur attendue (pValeur)
			/*if (pSelection==pValeur) 
				{ formRAPPORT_VISITE.elements[pObjet].disabled=false; }
			else { formRAPPORT_VISITE.elements[pObjet].disabled=true; }*/
			if (document.getElementsByName("RAP_MOTIF")[0].value == "4")
			{
				document.getElementsByName("RAP_MOTIFAUTRE")[0].disabled = false;
			}
			else
			{
				document.getElementsByName("RAP_MOTIFAUTRE")[0].disabled = true;
			}
		}
	</script>
	 <script language="javascript">
        function ajoutLigne( pNumero){//ajoute une ligne de produits/qté à la div "lignes"     
			//masque le bouton en cours
			document.getElementById("but"+pNumero).setAttribute("hidden","true");	
			pNumero++;										//incrémente le numéro de ligne
            var laDiv=document.getElementById("lignes");	//récupère l'objet DOM qui contient les données
			var titre = document.createElement("label") ;	//crée un label
			laDiv.appendChild(titre) ;						//l'ajoute à la DIV
			titre.setAttribute("class","titre") ;			//définit les propriétés
			titre.innerHTML= "   Produit : ";
			var liste = document.createElement("select");	//ajoute une liste pour proposer les produits
			laDiv.appendChild(liste) ;
			liste.setAttribute("name","PRA_ECH"+pNumero) ;
			liste.setAttribute("class","zone");
			//remplit la liste avec les valeurs de la première liste construite en PHP à partir de la base
			liste.innerHTML=formRAPPORT_VISITE.elements["PRA_ECH1"].innerHTML;
			var qte = document.createElement("input");
			laDiv.appendChild(qte);
			qte.setAttribute("name","PRA_QTE"+pNumero);
			qte.setAttribute("size","2"); 
			qte.setAttribute("class","zone");
			qte.setAttribute("type","text");
			var bouton = document.createElement("input");
			laDiv.appendChild(bouton);
			//ajoute une gestion évenementielle en faisant évoluer le numéro de la ligne
			bouton.setAttribute("onClick","ajoutLigne("+ pNumero +");");
			bouton.setAttribute("type","button");
			bouton.setAttribute("value","+");
			bouton.setAttribute("class","zone");	
			bouton.setAttribute("id","but"+ pNumero);				
        }
    </script>
</head>
<body>
	<?php
	//récupération du numéro
	$reqNum=mysql_query("select MAX(RAP_CODE)+1 FROM RAPPORT_VISITE");
	$rapNum=mysql_fetch_row($reqNum);

	include_once("styles/haut.html"); ?>
	<h1> Rapport de visite </h1>
		<form name="formRAPPORT_VISITE" method="post" action="ajoutRapport.php">
			
			<label class="titre">NUMERO : </label><input type="text" size="10" name="RAP_NUM" class="zone" value="<?=$rapNum[0]?>" READONLY/>
			<label class="titre">DATE VISITE :<p>(au format jj-mm-aaaa)</p></label><input type="text" size="10" name="RAP_DATEVISITE" class="zone" />
			<label class="titre">PRATICIEN :</label><select  name="PRA_NUM" class="zone" >
			<?php
					//récupération du praticien
					$reqPrat=mysql_query("select PRA_CODE,PRA_NOM, PRA_PRENOM from PRATICIEN");
					while($praticien=mysql_fetch_row($reqPrat))
					{
						?>
						<option value="<?=$praticien[0]?>">
							<?=$praticien[1]?> <?=$praticien[2]?>
						</option>
						<?php
					}
				?>
			</select>
			<label class="titre">COEFFICIENT :</label><input type="text" size="6" name="PRA_COEFF" class="zone" />
			<!-- met à jour le remplacant-->
			<label class="titre">REMPLACANT : </label>
			<input type="checkbox" name="REMPLACANT" class="zone" />
			<label class="titre">DATE SAISIE:</label><input type="text" size="19" name="RAP_DATE" class="zone" value="<?=date("d-m-Y")?>"/>
			<label class="titre">MOTIF (verifier "autre et enable le champ"):</label><select  name="RAP_MOTIF" class="zone" onChange="selectionne();">
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
										<input type="text" name="RAP_MOTIFAUTRE" class="zone" disabled="disabled" />
			<label class="titre">BILAN :</label><textarea rows="5" cols="50" name="RAP_BILAN" class="zone" ></textarea>
			<label class="titre">IMPACT :</label><textarea rows="5" cols="50" name="RAP_IMPACT" class="zone" ></textarea>
			<label class="titre">CONCURRENCE :</label><textarea rows="5" cols="50" name="RAP_CONCURRENCE" class="zone" ></textarea>
			<label class="titre" ><h3> El&eacute;ments pr&eacute;sent&eacute;s </h3></label>
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
			<label class="titre">DOCUMENTATION OFFERTE :</label><input name="RAP_DOC2" type="checkbox" class="zone"  />
			<label class="titre"><h3>Echantillons</h3></label>
			<div class="titre" id="lignes">
				<label class="titre" >Produit : </label>
				<select name="PRA_ECH1" class="zone">
					<option value="0">Produits</option>
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
			<label class="titre"><h3>Divers</h3>
			<label class="titre">DUREE SAISIE (en minutes):</label><input name="RAP_DUREE" type="text" class="zone">
			<label class="titre">SAISIE DEFINITIVE :</label><input name="RAP_LOCK" type="checkbox" class="zone"  />
			<label class="titre"></label><div class="zone"><input type="reset" value="Annuler"></input><input type="submit" name='action' value="Valider"></input>
		</form>
<?php include_once("styles/bas.html"); ?>
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