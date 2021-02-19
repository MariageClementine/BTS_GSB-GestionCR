<?session_start();
include("includes/classConnexion.php");
$logOK=require("includes/coSite.php");
if($logOK==true)
{
	?>
	<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8"/>
	<title>PRATICIENS</title>
	<link href="styles/style.css" rel="stylesheet" type="text/css">
	<script language = "javascript">
		function chercher($pNumero) {  
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
				 var formulaire = document.getElementById("formPraticien");
				formulaire.innerHTML=xhr_object.responseText;			} 
		   }
		   //communication vers le serveur
		   xhr_object.open("POST", "cherchePraticien.php", true); 
		   xhr_object.setRequestHeader("Content-type", "application/x-www-form-urlencoded"); 
		   var data = "pratNum=" + $pNumero ;
		   xhr_object.send(data); 
		   
	   }
	</script>
</head>
<body>	
<?php include_once("styles/haut.html"); ?>
		<h1> Praticiens </h1>
		<form name="formListeRecherche" >
			<select name="lstPrat" class="titre" onClick="chercher(this.value);">
				<option>Choisissez un praticien</option>
				<?php
				$req="select PRA_CODE,PRA_NOM,PRA_PRENOM FROM PRATICIEN order by PRA_NOM";
				   $resultat=mysql_query($req);
				   while($ligne=mysql_fetch_array($resultat))
				   {
				   	?>
				   		<option value="<?=$ligne["PRA_CODE"]?>"><?=$ligne["PRA_NOM"]?> <?=$ligne["PRA_PRENOM"]?></option>
				   	<?php	
				   }
				   	?>
			</select>	
		</form>
		<form id="formPraticien">	
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
