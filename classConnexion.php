<?php
/*-------------------------- D�claration de la classe -----------------------------*/
class clstBDD {
/*----------------Propri�t�s de la classe  -----------------------------------*/
var $connexion ; 
var $dsn ="localhost" ;
//modif du script de base
var $connexionBdd ;

/*---------------------- Acc�s aux propri�t�s --------------------------------------*/
	function getConnexion() {return $this->connexion;}
	function getConnexionBdd() {return $this->connexionBdd;}
/* --------------   Connexion � une base par un ODBC-------------- ------------------- */
	function connecte($pNomDSN, $pUtil, $pPasse) {
		//tente d'�tablir une connexion � une base de donn�es 
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
		//ex�cute une requ�te action (insert, update, delete), ne retourne pas de r�sultat
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