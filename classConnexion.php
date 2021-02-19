<?php
/*-------------------------- Déclaration de la classe -----------------------------*/
class clstBDD {
/*----------------Propriétés de la classe  -----------------------------------*/
var $connexion ; 
var $dsn ="localhost" ;
//modif du script de base
var $connexionBdd ;

/*---------------------- Accès aux propriétés --------------------------------------*/
	function getConnexion() {return $this->connexion;}
	function getConnexionBdd() {return $this->connexionBdd;}
/* --------------   Connexion à une base par un ODBC-------------- ------------------- */
	function connecte($pNomDSN, $pUtil, $pPasse) {
		//tente d'établir une connexion à une base de données 
		$this->connexion = mysql_connect( $pNomDSN , $pUtil, $pPasse );	
		return $this->connexion; 		
	}

//modif du script de base
	function connecteBdd($bdd)
	{
		$this ->connexionBdd = mysql_select_db($bdd);
		return $this->connexionBdd;
	}
/* --------------   Requetes sur la base -------------- ------------------- */
	function requeteAction($req) {
		//exécute une requête action (insert, update, delete), ne retourne pas de résultat
		mysql_query($this->connexion,$req);
	}
	function requeteSelect($req) {
		//interroge la base (select) et retourne le curseur correspondant
		$retour = mysql_query($req,$this->connexion);
		return $retour;
	}
	
	function close() {
		mysql_close($this->connexion);
	}
}
?>