<?session_start();
include("includes/classConnexion.php");
$logOK=require("includes/coSite.php");
if($logOK==true)
{
?>
<html>
<head>
	<title>CONSULTER LES RAPPORTS</title>
	<link href="styles/style.css" rel="stylesheet" type="text/css">
		<script language = "javascript">
		function chercher($mNumero) {  
			var xhr_object = null; 	    
			if(window.XMLHttpRequest) // Firefox 
				xhr_object = new XMLHttpRequest(); 
			else if(window.ActiveXObject) // Internet Explorer 
					xhr_object = new ActiveXObject("Microsoft.XMLHTTP"); 
				else { // XMLHttpRequest non supporté par le navigateur 
					alert("Votre navigateur ne supporte pas les objets XMLHTTPRequest..."); 
					return; 
				}   
			//traitement à la réception des données
		   xhr_object.onreadystatechange = function() { 
			if(xhr_object.readyState == 4 && xhr_object.status == 200) { 
				 var formulaire = document.getElementById("formRap");
				formulaire.innerHTML=xhr_object.responseText;			} 
		   }
		   //communication vers le serveur
		   xhr_object.open("POST", "chercheRapport.php", true); 
		   xhr_object.setRequestHeader("Content-type", "application/x-www-form-urlencoded"); 
		   var data = "rapNum=" + $mNumero ;
		   xhr_object.send(data); 
		   
	   }
		</script>
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
			liste.innerHTML=formRap.elements["PRA_ECH1"].innerHTML;
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
	<meta http-equiv="content-type" content="text/html ; charset=utf-8">
</head>
<body>
		<?php include_once("styles/haut.html"); ?>
		<h1> Liste de vos rapports </h1>	
		<?  
		 	$req="select * FROM RAPPORT_VISITE where VIS_MATRICULE='".$_SESSION["matricule"]."';";
			$resultat=mysql_query($req);
			if(@mysql_fetch_row($resultat)==NULL)
			{
				echo "Vous n'avez pas de rapport à consulter";
			}
			else
			{
				?>
				<!-- <form action="chercheRapport.php" method="post"> -->
				<form>
					<select name="lstRap" class="titre" onClick="chercher(this.value);">
						<option>Choisissez l'un de vos rapports</options>
						<?
						$req2="select RAP_CODE, PRA_CODE,PRA_NOM, RAP_DATE_VISITE FROM RAPPORT_VISITE NATURAL JOIN PRATICIEN where VIS_MATRICULE='".$_SESSION["matricule"]."';";
						$resultat2=mysql_query($req2);
						while($ligne=mysql_fetch_row($resultat2))
						{
						?>
							<option value="<?=$ligne[0]?>"><?=$ligne[2]?>, <?=date('d-m-Y',strtotime($ligne[3]))?></option>
						<?php
						}
						?>
					</select>
					<!--<input type="submit" name="action" value="Consulter"/>-->
				</form>
				<form id="formRap" method="POST" action="modifierRapport.php">
				</form>
				<?php
			}
			?>
<!-- 	</div>
</div> -->
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