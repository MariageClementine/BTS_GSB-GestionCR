<?php

	//formulaire de vérification de la connexion

		//on instancie une connexion
	$log = new clstBDD();
	$logOK=false;
	//on vérifie qu'il y a bien eu connexion
	if(isset($_SESSION['log']))
	{
		//on se connecte a la bdd
		$log->connecte("localhost","GSBVisiteur","");
		if ($log->getConnexion() != null) 
		{
			//echo "co mysql ok"; //debug
			$log->connecteBdd("GSB_gestionCR");
			//si on accede bien a la bdd
			if($log->getConnexionBdd() != null)
			{
				//echo "co bdd ok"; //debug
				//on récupère les infos nécessaires à la connexion de l'utilisateur
				$req=$log->requeteSelect("Select * FROM VISITEUR WHERE '".$_SESSION['mdp']."'=lower(date_format(VIS_DATEEMBAUCHE,'%d-%b-%Y')); " );
				//echo ($req);  //debug
				//$occur=mysql_query($req);
				$ligne=mysql_fetch_array($req);
				//echo $ligne['VIS_NOM'];  //debug
				if($ligne["VIS_NOM"] == $_SESSION['log'])
				{
					//echo "usr connecté";  //debug
					
					$logOK=true;	
					$_SESSION['matricule']=$ligne["VIS_MATRICULE"];				
				}	
				return $logOK;
			}
		}
	}
	else
	{
		return $logOK;
	}

?>