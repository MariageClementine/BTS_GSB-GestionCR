<?session_start();
include("includes/classConnexion.php");
$logOK=require("includes/coSite.php");
if($logOK==true)
{
?>
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8"/>
	<title>MODIFICATION RAPPORT</title>
	<link href="styles/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<?php include_once("styles/haut.html"); ?>
	<?php
	if(isset($_POST['action']) && $_POST['action']=="Valider")
	{
		//recup des données
		$matricule =  $_SESSION['matricule'];
		$rapNum=$_POST['RAP_NUM'];
		echo "rapNum : $rapNum </br>";
		$dateVis=date('Y-m-d',strtotime($_POST['RAP_DATEVISITE']));
		echo "dateVis : $dateVis ";
		$praNum=$_POST['PRA_NUM'];
		echo "praNum : $praNum </br>";
		$praCoef=$_POST['PRA_COEFF'];

		echo "praCoef: $praCoef </br>";
		if(isset($_POST['REMPLACANT']) && $_POST['REMPLACANT']=="on")
		{
			$rempl=1;
		}
		else
		{
			$rempl=0;
		}
		echo "rempl: $rempl </br>";
		

		$dateSaisie=date('Y-m-d',strtotime($_POST['RAP_DATE']));
		echo "dateSaisie: $dateSaisie</br>";
		$motifNum=$_POST['RAP_MOTIF'];
		echo "motifNum: $motifNum</br>";
		if($motifNum == 4 && isset($_POST['RAP_MOTIFAUTRE']))
		{
			$motifAutre=$_POST['RAP_MOTIFAUTRE'];
			echo"motif autre : $motifAutre</br>";
		}
		else
		{
			$motifAutre=null;
		}

		$bilan=$_POST['RAP_BILAN'];
		echo "bilan: $bilan</br>";
		$impact=$_POST['RAP_IMPACT'];
		echo "impact : $impact </br>";
		$concurrence=$_POST['RAP_CONCURRENCE'];
		echo "concurrence : $concurrence</br>";
		$prodPres1=$_POST['PROD1'];
		echo "prodPres1: $prodPres1</br>";

		if(isset($_POST['RAP_DOC']) && $_POST['RAP_DOC']=="on")
		{
			$doc=1;
		}
		else
		{
			$doc=0;
		}
		echo "doc: $doc</br>";
	

		if(isset($_POST['RAP_LOCK']) && $_POST['RAP_LOCK']=='on')
		{
			$saisieDef=1;
		}
		else {$saisieDef=0;}
		echo "saisie def: $saisieDef </br>";

		$dureeSaisie=$_POST['RAP_DUREE'];
		echo " durée saisie: $dureeSaisie";
		if(! mysql_query("UPDATE TRAVAILLE SET REMPLACANT=$rempl WHERE PRA_CODE=$praNum;"))
		{
			echo "oops! une erreur s'est produite! vérifiez vos champs au niveau du remplaçant.";
		}
		else
		{
			if(! mysql_query("update RAPPORT_VISITE set PRA_CODE =$praNum, RAP_DATE_VISITE='".$dateVis."',RAP_BILAN='".$bilan."',RAP_MOTIF=$motifNum,RAP_IMPACT='".$impact."',RAP_CONCURRENCE='".$concurrence."',RAP_DATE_SAISIE='".$dateSaisie."',RAP_DUREE_SAISIE='".$dureeSaisie."',RAP_COEF_CONFIANCE=$praCoef,SAISIE_FINIE=$saisieDef,MOTIF_AUTRE='".$motifAutre."' WHERE RAP_CODE=$rapNum AND VIS_MATRICULE='".$matricule."';"))
			{
				echo "oops! une erreur s'est produite! vérifiez vos champs !";
				echo mysql_error();
			}
			else
			{
				mysql_query("delete from PRESENTE where VISITE_NUM=$rapNum;");
				if(! mysql_query("insert into PRESENTE values($rapNum,'".$prodPres1."',null,$doc);")){
					echo "oops! une erreur s'est produite! vérifiez vos champs au niveau du 1erproduit pésenté.";
					echo mysql_error();
				}
				else
				{
					if($_POST['PROD2']!='0')
					{
						$prodPres2=$_POST['PROD2'];
						echo "prodPres2: $prodPres2</br>";
						if(isset($_POST['RAP_DOC2']) && $_POST['RAP_DOC2']=="on")
						{
							$doc2=1;
						}
						else
						{
							$doc2=0;
						}
						echo "doc2: $doc2</br>"	;
						if(! mysql_query("insert into PRESENTE values($rapNum,'".$prodPres2."',null,$doc2);"))
						{
							echo "oops! une erreur s'est produite! vérifiez vos champs au niveau du 2nd produit présenté.";
							echo mysql_error();
						}
					}
					if($_POST['PRA_ECH1']!='0')
					{
						$num=1;
						while(isset($_POST['PRA_ECH'.$num]))
						{
							$echantillon=$_POST['PRA_ECH'.$num];
							$qte=$_POST['PRA_QTE'.$num];
							echo "echantillon $num : $echantillon</br>";
							echo "quantite echantillon $num : $qte</br>";
							if(! mysql_query("update OFFRIR set MED_DEPOTLEGAL='$echantillon',OFF_QTE=$qte WHERE RAP_CODE=$rapNum"))
							{
								echo "oops! une erreur s'est produite! vérifiez vos champs au niveau des echantillons offerts.";
							}
							else
							{
								echo "mise à jour effectuée avec succès";
							}
							$num++;
						}
					}			
					else
					{
						echo "mise à jour effectuée avec succès";
					}		
				}
			}
		}
	}
	?>
	<p><a href="javascript:history.go(-1)">Retour</a></p>
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

