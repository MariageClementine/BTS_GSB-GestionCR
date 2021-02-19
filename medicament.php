<?session_start();
include("includes/classConnexion.php");
$logOK=require("includes/coSite.php");
if($logOK==true)
{
?>
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8"/>
	<title>MEDICAMENTS</title>
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
				 var formulaire = document.getElementById("formMed");
				formulaire.innerHTML=xhr_object.responseText;			} 
		   }
		   //communication vers le serveur
		   xhr_object.open("POST", "chercheMed.php", true); 
		   xhr_object.setRequestHeader("Content-type", "application/x-www-form-urlencoded"); 
		   var data = "medNum=" + $mNumero ;
		   xhr_object.send(data); 
		   
	   }
	</script>
</head>

<body>
	<?php include_once("styles/haut.html"); ?>

	<h1> Pharmacop&eacute;e </h1>
	<form name="formMEDICAMENT" >
		<select name="lstMed" class="titre" onClick="chercher(this.value);">
			<option>Choisir...</option>
			<?php
			$req=mysql_query("select MED_DEPOTLEGAL,MED_NOMCOMMERCIAL FROM MEDICAMENT;");
			while($ligne=mysql_fetch_row($req))
			{
				?>
				<option value="<?=$ligne[0]?>">
					<?=$ligne[1]?>
				</option>
				<?php
			}
			?>
		</select>
	</form>
	<form id="formMed">
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
