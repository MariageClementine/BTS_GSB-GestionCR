-- MySQL dump 10.13  Distrib 5.1.72, for debian-linux-gnu (i486)
--
-- Host: localhost    Database: GSB_gestionCR
-- ------------------------------------------------------
-- Server version	5.1.72-2-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `GSB_gestionCR`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `GSB_gestionCR` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `GSB_gestionCR`;

--
-- Table structure for table `ACTIVITE_COMPL`
--

DROP TABLE IF EXISTS `ACTIVITE_COMPL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACTIVITE_COMPL` (
  `AC_CODE` int(11) NOT NULL,
  `AC_DATE` date DEFAULT NULL,
  `AC_LIEU` varchar(50) DEFAULT NULL,
  `AC_THEME` varchar(20) DEFAULT NULL,
  `AC_MOTIF` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`AC_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACTIVITE_COMPL`
--

LOCK TABLES `ACTIVITE_COMPL` WRITE;
/*!40000 ALTER TABLE `ACTIVITE_COMPL` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACTIVITE_COMPL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ADMIN`
--

DROP TABLE IF EXISTS `ADMIN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ADMIN` (
  `AD_CODE` tinyint(4) NOT NULL DEFAULT '0',
  `AD_NOM` varchar(30) DEFAULT NULL,
  `AD_PRENOM` varchar(30) DEFAULT NULL,
  `DATE_EMBAUCHE` date DEFAULT NULL,
  PRIMARY KEY (`AD_CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN`
--

LOCK TABLES `ADMIN` WRITE;
/*!40000 ALTER TABLE `ADMIN` DISABLE KEYS */;
INSERT INTO `ADMIN` VALUES (1,'Mariage','Clémentine','1993-10-06');
/*!40000 ALTER TABLE `ADMIN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CABINET`
--

DROP TABLE IF EXISTS `CABINET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CABINET` (
  `CAB_ID` int(11) NOT NULL DEFAULT '0',
  `CAB_LOCAL` varchar(30) DEFAULT NULL,
  `CAB_TEL` varchar(13) DEFAULT NULL,
  `CAB_VILLE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CAB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CABINET`
--

LOCK TABLES `CABINET` WRITE;
/*!40000 ALTER TABLE `CABINET` DISABLE KEYS */;
INSERT INTO `CABINET` VALUES (1,'Hôpital de la roche','01-xx-xx-xx-x','la Roche sur Yon'),(2,'Cabinet Gosselin','02-xx-xx-xx-x','Blois');
/*!40000 ALTER TABLE `CABINET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPOSANT`
--

DROP TABLE IF EXISTS `COMPOSANT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMPOSANT` (
  `CMP_CODE` varchar(8) NOT NULL,
  `CMP_LIBELLE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CMP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPOSANT`
--

LOCK TABLES `COMPOSANT` WRITE;
/*!40000 ALTER TABLE `COMPOSANT` DISABLE KEYS */;
/*!40000 ALTER TABLE `COMPOSANT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CONSTITUER`
--

DROP TABLE IF EXISTS `CONSTITUER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CONSTITUER` (
  `MED_DEPOTLEGAL` varchar(20) NOT NULL DEFAULT '',
  `CMP_CODE` varchar(8) NOT NULL DEFAULT '',
  `CST_QTE` float DEFAULT NULL,
  PRIMARY KEY (`MED_DEPOTLEGAL`,`CMP_CODE`),
  KEY `CMP_CODE` (`CMP_CODE`),
  CONSTRAINT `CONSTITUER_ibfk_1` FOREIGN KEY (`MED_DEPOTLEGAL`) REFERENCES `MEDICAMENT` (`MED_DEPOTLEGAL`),
  CONSTRAINT `CONSTITUER_ibfk_2` FOREIGN KEY (`CMP_CODE`) REFERENCES `COMPOSANT` (`CMP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CONSTITUER`
--

LOCK TABLES `CONSTITUER` WRITE;
/*!40000 ALTER TABLE `CONSTITUER` DISABLE KEYS */;
/*!40000 ALTER TABLE `CONSTITUER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DELEGUE`
--

DROP TABLE IF EXISTS `DELEGUE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DELEGUE` (
  `DEL_MATRICULE` varchar(20) NOT NULL,
  `DEL_REGION` varchar(4) NOT NULL,
  PRIMARY KEY (`DEL_MATRICULE`,`DEL_REGION`),
  KEY `DEL_REGION` (`DEL_REGION`),
  CONSTRAINT `DELEGUE_ibfk_1` FOREIGN KEY (`DEL_MATRICULE`) REFERENCES `VISITEUR` (`VIS_MATRICULE`),
  CONSTRAINT `DELEGUE_ibfk_2` FOREIGN KEY (`DEL_REGION`) REFERENCES `REGION` (`REG_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DELEGUE`
--

LOCK TABLES `DELEGUE` WRITE;
/*!40000 ALTER TABLE `DELEGUE` DISABLE KEYS */;
/*!40000 ALTER TABLE `DELEGUE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEPARTEMENT`
--

DROP TABLE IF EXISTS `DEPARTEMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEPARTEMENT` (
  `DEP_CODE` varchar(3) NOT NULL,
  `DEP_NOM` varchar(30) DEFAULT NULL,
  `DEP_CHEFVENTE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`DEP_CODE`),
  KEY `DEP_CHEFVENTE` (`DEP_CHEFVENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPARTEMENT`
--

LOCK TABLES `DEPARTEMENT` WRITE;
/*!40000 ALTER TABLE `DEPARTEMENT` DISABLE KEYS */;
INSERT INTO `DEPARTEMENT` VALUES ('01','Ain','Villars'),('02','Aisne','Lepic');
/*!40000 ALTER TABLE `DEPARTEMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DOSAGE`
--

DROP TABLE IF EXISTS `DOSAGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DOSAGE` (
  `DOS_CODE` varchar(20) NOT NULL,
  `DOS_QUANTITE` varchar(20) DEFAULT NULL,
  `DOS_UNITE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`DOS_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DOSAGE`
--

LOCK TABLES `DOSAGE` WRITE;
/*!40000 ALTER TABLE `DOSAGE` DISABLE KEYS */;
/*!40000 ALTER TABLE `DOSAGE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FAMILLE`
--

DROP TABLE IF EXISTS `FAMILLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FAMILLE` (
  `FAM_CODE` varchar(6) NOT NULL,
  `FAM_LIBELLE` varchar(160) DEFAULT NULL,
  PRIMARY KEY (`FAM_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FAMILLE`
--

LOCK TABLES `FAMILLE` WRITE;
/*!40000 ALTER TABLE `FAMILLE` DISABLE KEYS */;
INSERT INTO `FAMILLE` VALUES ('AA','Antalgiques en association'),('AAA','Antalgiques antipyrétiques en association'),('AAC','Antidépresseur d\'action centrale'),('AAH','Antivertigineux antihistaminique H1'),('ABA','Antibiotique antituberculeux'),('ABC','Antibiotique antiacnéique local'),('ABP','Antibiotique de la famille des béta-lactamines (pénicilline A)'),('AFC','Antibiotique de la famille des cyclines'),('AFM','Antibiotique de la famille des macrolides'),('AH','Antihistaminique H1 local'),('AIM','Antidépresseur imipraminique (tricyclique)'),('AIN','Antidépresseur inhibiteur sélectif de la recapture de la sérotonine'),('ALO','Antibiotique local (ORL)'),('ANS','Antidépresseur IMAO non sélectif'),('AO','Antibiotique ophtalmique'),('AP','Antipsychotique normothymique'),('AUM','Antibiotique urinaire minute'),('CRT','Corticoïde, antibiotique et antifongique à  usage local'),('HYP','Hypnotique antihistaminique'),('PSA','Psychostimulant, antiasthénique');
/*!40000 ALTER TABLE `FAMILLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FORMULER`
--

DROP TABLE IF EXISTS `FORMULER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FORMULER` (
  `MED_DEPOTLEGAL` varchar(20) NOT NULL DEFAULT '',
  `PRE_CODE` varchar(4) NOT NULL DEFAULT '',
  PRIMARY KEY (`MED_DEPOTLEGAL`,`PRE_CODE`),
  KEY `PRE_CODE` (`PRE_CODE`),
  CONSTRAINT `FORMULER_ibfk_1` FOREIGN KEY (`MED_DEPOTLEGAL`) REFERENCES `MEDICAMENT` (`MED_DEPOTLEGAL`),
  CONSTRAINT `FORMULER_ibfk_2` FOREIGN KEY (`PRE_CODE`) REFERENCES `PRESENTATION` (`PRE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FORMULER`
--

LOCK TABLES `FORMULER` WRITE;
/*!40000 ALTER TABLE `FORMULER` DISABLE KEYS */;
/*!40000 ALTER TABLE `FORMULER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INTERAGIR`
--

DROP TABLE IF EXISTS `INTERAGIR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INTERAGIR` (
  `MED_PERTURBATEUR` varchar(20) NOT NULL DEFAULT '',
  `MED_MED_PERTURBE` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`MED_PERTURBATEUR`,`MED_MED_PERTURBE`),
  KEY `MED_MED_PERTURBE` (`MED_MED_PERTURBE`),
  CONSTRAINT `INTERAGIR_ibfk_1` FOREIGN KEY (`MED_PERTURBATEUR`) REFERENCES `MEDICAMENT` (`MED_DEPOTLEGAL`),
  CONSTRAINT `INTERAGIR_ibfk_2` FOREIGN KEY (`MED_MED_PERTURBE`) REFERENCES `MEDICAMENT` (`MED_DEPOTLEGAL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INTERAGIR`
--

LOCK TABLES `INTERAGIR` WRITE;
/*!40000 ALTER TABLE `INTERAGIR` DISABLE KEYS */;
/*!40000 ALTER TABLE `INTERAGIR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INVITER`
--

DROP TABLE IF EXISTS `INVITER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INVITER` (
  `AC_CODE` int(11) NOT NULL DEFAULT '0',
  `PRA_CODE` int(11) NOT NULL DEFAULT '0',
  `SPECIALISTEON` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`AC_CODE`,`PRA_CODE`),
  KEY `PRA_CODE` (`PRA_CODE`),
  CONSTRAINT `INVITER_ibfk_1` FOREIGN KEY (`AC_CODE`) REFERENCES `ACTIVITE_COMPL` (`AC_CODE`),
  CONSTRAINT `INVITER_ibfk_2` FOREIGN KEY (`PRA_CODE`) REFERENCES `PRATICIEN` (`PRA_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INVITER`
--

LOCK TABLES `INVITER` WRITE;
/*!40000 ALTER TABLE `INVITER` DISABLE KEYS */;
/*!40000 ALTER TABLE `INVITER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LABO`
--

DROP TABLE IF EXISTS `LABO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LABO` (
  `LAB_CODE` varchar(4) NOT NULL,
  `LAB_NOM` varchar(20) DEFAULT NULL,
  `LAB_CHEFVENTE` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`LAB_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LABO`
--

LOCK TABLES `LABO` WRITE;
/*!40000 ALTER TABLE `LABO` DISABLE KEYS */;
INSERT INTO `LABO` VALUES ('BC','Bichat','Suzanne Terminus'),('GY','Gyverny','Marcel MacDouglas'),('SW','Swiss Kane','Alain Poutre');
/*!40000 ALTER TABLE `LABO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MEDICAMENT`
--

DROP TABLE IF EXISTS `MEDICAMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MEDICAMENT` (
  `MED_DEPOTLEGAL` varchar(20) NOT NULL,
  `MED_NOMCOMMERCIAL` varchar(50) DEFAULT NULL,
  `FAM_CODE` varchar(6) DEFAULT NULL,
  `MED_COMPOSITION` text,
  `MED_EFFETS` text,
  `MED_CONTREINDIC` text,
  `MED_PRIXECHANTILLON` float DEFAULT NULL,
  PRIMARY KEY (`MED_DEPOTLEGAL`),
  KEY `FAM_CODE` (`FAM_CODE`),
  CONSTRAINT `MEDICAMENT_ibfk_1` FOREIGN KEY (`FAM_CODE`) REFERENCES `FAMILLE` (`FAM_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MEDICAMENT`
--

LOCK TABLES `MEDICAMENT` WRITE;
/*!40000 ALTER TABLE `MEDICAMENT` DISABLE KEYS */;
INSERT INTO `MEDICAMENT` VALUES ('3MYC7','TRIMYCINE','CRT','Triamcinolone (acétonide) + Néomycine + Nystatine','Ce médicament est un corticoïde à  activité forte ou très forte associé à  un antibiotique et un antifongique, utilisé en application locale dans certaines atteintes cutanées surinfectées.','Ce médicament est contre-indiqué en cas d\'allergie à  l\'un des constituants, d\'infections de la peau ou de parasitisme non traités, d\'acné. Ne pas appliquer sur une plaie, ni sous un pansement occlusif.',NULL),('ADIMOL9','ADIMOL','ABP','Amoxicilline + Acide clavulanique','Ce médicament, plus puissant que les pénicillines simples, est utilisé pour traiter des infections bactériennes spécifiques.','Ce médicament est contre-indiqué en cas d\'allergie aux pénicillines ou aux céphalosporines.',NULL),('AMOPIL7','AMOPIL','ABP','Amoxicilline','Ce médicament, plus puissant que les pénicillines simples, est utilisé pour traiter des infections bactériennes spécifiques.','Ce médicament est contre-indiqué en cas d\'allergie aux pénicillines. Il doit être administré avec prudence en cas d\'allergie aux céphalosporines.',NULL),('AMOX45','AMOXAR','ABP','Amoxicilline','Ce médicament, plus puissant que les pénicillines simples, est utilisé pour traiter des infections bactériennes spécifiques.','La prise de ce médicament peut rendre positifs les tests de dépistage du dopage.',NULL),('AMOXIG12','AMOXI Gé','ABP','Amoxicilline','Ce médicament, plus puissant que les pénicillines simples, est utilisé pour traiter des infections bactériennes spécifiques.','Ce médicament est contre-indiqué en cas d\'allergie aux pénicillines. Il doit être administré avec prudence en cas d\'allergie aux céphalosporines.',NULL),('APATOUX22','APATOUX Vitamine C','ALO','Tyrothricine + Tétracaïne + Acide ascorbique (Vitamine C)','Ce médicament est utilisé pour traiter les affections de la bouche et de la gorge.','Ce médicament est contre-indiqué en cas d\'allergie à  l\'un des constituants, en cas de phénylcétonurie et chez l\'enfant de moins de 6 ans.',NULL),('BACTIG10','BACTIGEL','ABC','Erythromycine','Ce médicament est utilisé en application locale pour traiter l\'acné et les infections cutanées bactériennes associées.','Ce médicament est contre-indiqué en cas d\'allergie aux antibiotiques de la famille des macrolides ou des lincosanides.',NULL),('BACTIV13','BACTIVIL','AFM','Erythromycine','Ce médicament est utilisé pour traiter des infections bactériennes spécifiques.','Ce médicament est contre-indiqué en cas d\'allergie aux macrolides (dont le chef de file est l\'érythromycine).',NULL),('BITALV','BIVALIC','AAA','Dextropropoxyphène + Paracétamol','Ce médicament est utilisé pour traiter les douleurs d\'intensité modérée ou intense.','Ce médicament est contre-indiqué en cas d\'allergie aux médicaments de cette famille, d\'insuffisance hépatique ou d\'insuffisance rénale.',NULL),('CARTION6','CARTION','AAA','Acide acétylsalicylique (aspirine) + Acide ascorbique (Vitamine C) + Paracétamol','Ce médicament est utilisé dans le traitement symptomatique de la douleur ou de la fièvre.','Ce médicament est contre-indiqué en cas de troubles de la coagulation (tendances aux hémorragies), d\'ulcère gastroduodénal, maladies graves du foie.',NULL),('CLAZER6','CLAZER','AFM','Clarithromycine','Ce médicament est utilisé pour traiter des infections bactériennes spécifiques. Il est également utilisé dans le traitement de l\'ulcère gastro-duodénal, en association avec d\'autres médicaments.','Ce médicament est contre-indiqué en cas d\'allergie aux macrolides (dont le chef de file est l\'érythromycine).',NULL),('DEPRIL9','DEPRAMIL','AIM','Clomipramine','Ce médicament est utilisé pour traiter les épisodes dépressifs sévères, certaines douleurs rebelles, les troubles obsessionnels compulsifs et certaines énurésies chez l\'enfant.','Ce médicament est contre-indiqué en cas de glaucome ou d\'adénome de la prostate, d\'infarctus récent, ou si vous avez reà§u un traitement par IMAO durant les 2 semaines précédentes ou en cas d\'allergie aux antidépresseurs imipraminiques.',NULL),('DIMIRTAM6','DIMIRTAM','AAC','Mirtazapine','Ce médicament est utilisé pour traiter les épisodes dépressifs sévères.','La prise de ce produit est contre-indiquée en cas de d\'allergie à  l\'un des constituants.',NULL),('DOLRIL7','DOLORIL','AAA','Acide acétylsalicylique (aspirine) + Acide ascorbique (Vitamine C) + Paracétamol','Ce médicament est utilisé dans le traitement symptomatique de la douleur ou de la fièvre.','Ce médicament est contre-indiqué en cas d\'allergie au paracétamol ou aux salicylates.',NULL),('DORNOM8','NORMADOR','HYP','Doxylamine','Ce médicament est utilisé pour traiter l\'insomnie chez l\'adulte.','Ce médicament est contre-indiqué en cas de glaucome, de certains troubles urinaires (rétention urinaire) et chez l\'enfant de moins de 15 ans.',NULL),('EQUILARX6','EQUILAR','AAH','Méclozine','Ce médicament est utilisé pour traiter les vertiges et pour prévenir le mal des transports.','Ce médicament ne doit pas être utilisé en cas d\'allergie au produit, en cas de glaucome ou de rétention urinaire.',NULL),('EVILR7','EVEILLOR','PSA','Adrafinil','Ce médicament est utilisé pour traiter les troubles de la vigilance et certains symptomes neurologiques chez le sujet agé.','Ce médicament est contre-indiqué en cas d\'allergie à  l\'un des constituants.',NULL),('INSXT5','INSECTIL','AH','Diphénydramine','Ce médicament est utilisé en application locale sur les piqûres d\'insecte et l\'urticaire.','Ce médicament est contre-indiqué en cas d\'allergie aux antihistaminiques.',NULL),('JOVAI8','JOVENIL','AFM','Josamycine','Ce médicament est utilisé pour traiter des infections bactériennes spécifiques.','Ce médicament est contre-indiqué en cas d\'allergie aux macrolides (dont le chef de file est l\'érythromycine).',NULL),('LIDOXY23','LIDOXYTRACINE','AFC','Oxytétracycline +Lidocaïne','Ce médicament est utilisé en injection intramusculaire pour traiter certaines infections spécifiques.','Ce médicament est contre-indiqué en cas d\'allergie à  l\'un des constituants. Il ne doit pas être associé aux rétinoïdes.',NULL),('LITHOR12','LITHORINE','AP','Lithium','Ce médicament est indiqué dans la prévention des psychoses maniaco-dépressives ou pour traiter les états maniaques.','Ce médicament ne doit pas être utilisé si vous êtes allergique au lithium. Avant de prendre ce traitement, signalez à  votre médecin traitant si vous souffrez d\'insuffisance rénale, ou si vous avez un régime sans sel.',NULL),('PARMOL16','PARMOCODEINE','AA','Codéine + Paracétamol','Ce médicament est utilisé pour le traitement des douleurs lorsque des antalgiques simples ne sont pas assez efficaces.','Ce médicament est contre-indiqué en cas d\'allergie à  l\'un des constituants, chez l\'enfant de moins de 15 Kg, en cas d\'insuffisance hépatique ou respiratoire, d\'asthme, de phénylcétonurie et chez la femme qui allaite.',NULL),('PHYSOI8','PHYSICOR','PSA','Sulbutiamine','Ce médicament est utilisé pour traiter les baisses d\'activité physique ou psychique, souvent dans un contexte de dépression.','Ce médicament est contre-indiqué en cas d\'allergie à  l\'un des constituants.',NULL),('PIRIZ8','PIRIZAN','ABA','Pyrazinamide','Ce médicament est utilisé, en association à  d\'autres antibiotiques, pour traiter la tuberculose.','Ce médicament est contre-indiqué en cas d\'allergie à  l\'un des constituants, d\'insuffisance rénale ou hépatique, d\'hyperuricémie ou de porphyrie.',NULL),('POMDI20','POMADINE','AO','Bacitracine','Ce médicament est utilisé pour traiter les infections oculaires de la surface de l\'oeil.','Ce médicament est contre-indiqué en cas d\'allergie aux antibiotiques appliqués localement.',NULL),('TROXT21','TROXADET','AIN','Paroxétine','Ce médicament est utilisé pour traiter la dépression et les troubles obsessionnels compulsifs. Il peut également être utilisé en prévention des crises de panique avec ou sans agoraphobie.','Ce médicament est contre-indiqué en cas d\'allergie au produit.',NULL),('TXISOL22','TOUXISOL Vitamine C','ALO','Tyrothricine + Acide ascorbique (Vitamine C)','Ce médicament est utilisé pour traiter les affections de la bouche et de la gorge.','Ce médicament est contre-indiqué en cas d\'allergie à  l\'un des constituants et chez l\'enfant de moins de 6 ans.',NULL),('URIEG6','URIREGUL','AUM','Fosfomycine trométamol','Ce médicament est utilisé pour traiter les infections urinaires simples chez la femme de moins de 65 ans.','La prise de ce médicament est contre-indiquée en cas d\'allergie à  l\'un des constituants et d\'insuffisance rénale.',NULL);
/*!40000 ALTER TABLE `MEDICAMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MOTIF_VISITE`
--

DROP TABLE IF EXISTS `MOTIF_VISITE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MOTIF_VISITE` (
  `MOTIF_CODE` tinyint(4) NOT NULL DEFAULT '0',
  `MOTIF_LIB` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`MOTIF_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MOTIF_VISITE`
--

LOCK TABLES `MOTIF_VISITE` WRITE;
/*!40000 ALTER TABLE `MOTIF_VISITE` DISABLE KEYS */;
INSERT INTO `MOTIF_VISITE` VALUES (0,'Périodicité'),(1,'Actualisatisation'),(2,'Relance'),(3,'Sollicitation praticien'),(4,'Autre');
/*!40000 ALTER TABLE `MOTIF_VISITE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFRIR`
--

DROP TABLE IF EXISTS `OFFRIR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OFFRIR` (
  `VIS_MATRICULE` varchar(20) NOT NULL DEFAULT '',
  `RAP_CODE` int(11) NOT NULL DEFAULT '0',
  `MED_DEPOTLEGAL` varchar(20) NOT NULL DEFAULT '',
  `OFF_QTE` int(11) DEFAULT NULL,
  PRIMARY KEY (`MED_DEPOTLEGAL`,`RAP_CODE`,`VIS_MATRICULE`),
  KEY `VIS_MATRICULE` (`VIS_MATRICULE`,`RAP_CODE`),
  CONSTRAINT `OFFRIR_ibfk_1` FOREIGN KEY (`VIS_MATRICULE`, `RAP_CODE`) REFERENCES `RAPPORT_VISITE` (`VIS_MATRICULE`, `RAP_CODE`),
  CONSTRAINT `OFFRIR_ibfk_2` FOREIGN KEY (`MED_DEPOTLEGAL`) REFERENCES `MEDICAMENT` (`MED_DEPOTLEGAL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFRIR`
--

LOCK TABLES `OFFRIR` WRITE;
/*!40000 ALTER TABLE `OFFRIR` DISABLE KEYS */;
INSERT INTO `OFFRIR` VALUES ('a17',4,'3MYC7',3),('a17',4,'AMOX45',12);
/*!40000 ALTER TABLE `OFFRIR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POSSEDER`
--

DROP TABLE IF EXISTS `POSSEDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `POSSEDER` (
  `PRA_CODE` int(11) NOT NULL DEFAULT '0',
  `SPE_CODE` varchar(10) NOT NULL DEFAULT '',
  `POS_DIPLOME` varchar(20) DEFAULT NULL,
  `POS_COEFPRESCRIPTION` float DEFAULT NULL,
  PRIMARY KEY (`PRA_CODE`,`SPE_CODE`),
  KEY `SPE_CODE` (`SPE_CODE`),
  CONSTRAINT `POSSEDER_ibfk_1` FOREIGN KEY (`PRA_CODE`) REFERENCES `PRATICIEN` (`PRA_CODE`),
  CONSTRAINT `POSSEDER_ibfk_2` FOREIGN KEY (`SPE_CODE`) REFERENCES `SPECIALITE` (`SPE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POSSEDER`
--

LOCK TABLES `POSSEDER` WRITE;
/*!40000 ALTER TABLE `POSSEDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `POSSEDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRATICIEN`
--

DROP TABLE IF EXISTS `PRATICIEN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRATICIEN` (
  `PRA_CODE` int(11) NOT NULL,
  `PRA_NOM` varchar(50) DEFAULT NULL,
  `PRA_PRENOM` varchar(60) DEFAULT NULL,
  `PRA_ADRESSE` varchar(100) DEFAULT NULL,
  `PRA_CP` varchar(10) DEFAULT NULL,
  `PRA_VILLE` varchar(50) DEFAULT NULL,
  `PRA_COEFNOTORIETE` float DEFAULT NULL,
  `TYP_CODE` varchar(6) DEFAULT NULL,
  `PRA_COEFPRESCRIPTION` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`PRA_CODE`),
  KEY `TYP_CODE` (`TYP_CODE`),
  CONSTRAINT `PRATICIEN_ibfk_1` FOREIGN KEY (`TYP_CODE`) REFERENCES `TYPE_PRATICIEN` (`TYP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRATICIEN`
--

LOCK TABLES `PRATICIEN` WRITE;
/*!40000 ALTER TABLE `PRATICIEN` DISABLE KEYS */;
INSERT INTO `PRATICIEN` VALUES (1,'Notini','Alain','114 r Authie','85000','LA ROCHE SUR YON',290.03,'MH',NULL),(2,'Gosselin','Albert','13 r Devon','41000','BLOIS',307.49,'MV',NULL),(3,'Delahaye','André','36 av 6 Juin','25000','BESANCON',185.79,'PS',NULL),(4,'Leroux','André','47 av Robert Schuman','60000','BEAUVAIS',172.04,'PH',NULL),(5,'Desmoulins','Anne','31 r St Jean','30000','NIMES',94.75,'PO',NULL),(6,'Mouel','Anne','27 r Auvergne','80000','AMIENS',45.2,'MH',NULL),(7,'Desgranges-Lentz','Antoine','1 r Albert de Mun','29000','MORLAIX',20.07,'MV',NULL),(8,'Marcouiller','Arnaud','31 r St Jean','68000','MULHOUSE',396.52,'PS',NULL),(9,'Dupuy','Benoit','9 r Demolombe','34000','MONTPELLIER',395.66,'PH',NULL),(10,'Lerat','Bernard','31 r St Jean','59000','LILLE',257.79,'PO',NULL),(11,'Marçais-Lefebvre','Bertrand','86Bis r Basse','67000','STRASBOURG',450.96,'MH',NULL),(12,'Boscher','Bruno','94 r Falaise','10000','TROYES',356.14,'MV',NULL),(13,'Morel','Catherine','21 r Chateaubriand','75000','PARIS',379.57,'PS',NULL),(14,'Guivarch','Chantal','4 av Gén Laperrine','45000','ORLEANS',114.56,'PH',NULL),(15,'Bessin-Grosdoit','Christophe','92 r Falaise','6000','NICE',222.06,'PO',NULL),(16,'Rossa','Claire','14 av Thiès','06000','NICE',529.78,'MH',NULL),(17,'Cauchy','Denis','5 av Ste Thérèse','11000','NARBONNE',458.82,'MV',NULL),(18,'Gaffé','Dominique','9 av 1ère Armée Française','35000','RENNES',213.4,'PS',NULL),(19,'Guenon','Dominique','98 bd Mar Lyautey','44000','NANTES',175.89,'PH',NULL),(20,'Prévot','Dominique','29 r Lucien Nelle','87000','LIMOGES',151.36,'PO',NULL),(21,'Houchard','Eliane','9 r Demolombe','49100','ANGERS',436.96,'MH',NULL),(22,'Desmons','Elisabeth','51 r Bernières','29000','QUIMPER',281.17,'MV',NULL),(23,'Flament','Elisabeth','11 r Pasteur','35000','RENNES',315.6,'PS',NULL),(24,'Goussard','Emmanuel','9 r Demolombe','41000','BLOIS',40.72,'PH',NULL),(25,'Desprez','Eric','9 r Vaucelles','33000','BORDEAUX',406.85,'PO',NULL),(26,'Coste','Evelyne','29 r Lucien Nelle','19000','TULLE',441.87,'MH',NULL),(27,'Lefebvre','Frédéric','2 pl Wurzburg','55000','VERDUN',573.63,'MV',NULL),(28,'Lemée','Frédéric','29 av 6 Juin','56000','VANNES',326.4,'PS',NULL),(29,'Martin','Frédéric','Bât A 90 r Bayeux','70000','VESOUL',506.06,'PH',NULL),(30,'Marie','Frédérique','172 r Caponière','70000','VESOUL',313.31,'PO',NULL),(31,'Rosenstech','Geneviève','27 r Auvergne','75000','PARIS',366.82,'MH',NULL),(32,'Pontavice','Ghislaine','8 r Gaillon','86000','POITIERS',265.58,'MV',NULL),(33,'Leveneur-Mosquet','Guillaume','47 av Robert Schuman','64000','PAU',184.97,'PS',NULL),(34,'Blanchais','Guy','30 r Authie','08000','SEDAN',502.48,'PH',NULL),(35,'Leveneur','Hugues','7 pl St Gilles','62000','ARRAS',7.39,'PO',NULL),(36,'Mosquet','Isabelle','22 r Jules Verne','76000','ROUEN',77.1,'MH',NULL),(37,'Giraudon','Jean-Christophe','1 r Albert de Mun','38100','VIENNE',92.62,'MV',NULL),(38,'Marie','Jean-Claude','26 r Hérouville','69000','LYON',120.1,'PS',NULL),(39,'Maury','Jean-François','5 r Pierre Girard','71000','CHALON SUR SAONE',13.73,'PH',NULL),(40,'Dennel','Jean-Louis','7 pl St Gilles','28000','CHARTRES',550.69,'PO',NULL),(41,'Ain','Jean-Pierre','4 résid Olympia','02000','LAON',5.59,'MH',NULL),(42,'Chemery','Jean-Pierre','51 pl Ancienne Boucherie','14000','CAEN',396.58,'MV',NULL),(43,'Comoz','Jean-Pierre','35 r Auguste Lechesne','18000','BOURGES',340.35,'PS',NULL),(44,'Desfaudais','Jean-Pierre','7 pl St Gilles','29000','BREST',71.76,'PH',NULL),(45,'Phan','Jérôme','9 r Clos Caillet','79000','NIORT',451.61,'PO',NULL),(46,'Riou','Line','43 bd Gén Vanier','77000','MARNE LA VALLEE',193.25,'MH',NULL),(47,'Chubilleau','Louis','46 r Eglise','17000','SAINTES',202.07,'MV',NULL),(48,'Lebrun','Lucette','178 r Auge','54000','NANCY',410.41,'PS',NULL),(49,'Goessens','Marc','6 av 6 Juin','39000','DOLE',548.57,'PH',NULL),(50,'Laforge','Marc','5 résid Prairie','50000','SAINT LO',265.05,'PO',NULL),(51,'Millereau','Marc','36 av 6 Juin','72000','LA FERTE BERNARD',430.42,'MH',NULL),(52,'Dauverne','Marie-Christine','69 av Charlemagne','21000','DIJON',281.05,'MV',NULL),(53,'Vittorio','Myriam','3 pl Champlain','94000','BOISSY SAINT LEGER',356.23,'PS',NULL),(54,'Lapasset','Nhieu','31 av 6 Juin','52000','CHAUMONT',107,'PH',NULL),(55,'Plantet-Besnier','Nicole','10 av 1ère Armée Française','86000','CHATELLEREAULT',369.94,'PO',NULL),(56,'Chubilleau','Pascal','3 r Hastings','15000','AURRILLAC',290.75,'MH',NULL),(57,'Robert','Pascal','31 r St Jean','93000','BOBIGNY',162.41,'MV',NULL),(58,'Jean','Pascale','114 r Authie','49100','SAUMUR',375.52,'PS',NULL),(59,'Chanteloube','Patrice','14 av Thiès','13000','MARSEILLE',478.01,'PH',NULL),(60,'Lecuirot','Patrice','résid St Pères 55 r Pigacière','54000','NANCY',239.66,'PO',NULL),(61,'Gandon','Patrick','47 av Robert Schuman','37000','TOURS',599.06,'MH',NULL),(62,'Mirouf','Patrick','22 r Puits Picard','74000','ANNECY',458.42,'MV',NULL),(63,'Boireaux','Philippe','14 av Thiès','10000','CHALON EN CHAMPAGNE',454.48,'PS',NULL),(64,'Cendrier','Philippe','7 pl St Gilles','12000','RODEZ',164.16,'PH',NULL),(65,'Duhamel','Philippe','114 r Authie','34000','MONTPELLIER',98.62,'PO',NULL),(66,'Grigy','Philippe','15 r Mélingue','44000','CLISSON',285.1,'MH',NULL),(67,'Linard','Philippe','1 r Albert de Mun','81000','ALBI',486.3,'MV',NULL),(68,'Lozier','Philippe','8 r Gaillon','31000','TOULOUSE',48.4,'PS',NULL),(69,'Dechâtre','Pierre','63 av Thiès','23000','MONTLUCON',253.75,'PH',NULL),(70,'Goessens','Pierre','22 r Jean Romain','40000','MONT DE MARSAN',426.19,'PO',NULL),(71,'Leménager','Pierre','39 av 6 Juin','57000','METZ',118.7,'MH',NULL),(72,'Née','Pierre','39 av 6 Juin','82000','MONTAUBAN',72.54,'MV',NULL),(73,'Guyot','Pierre-Laurent','43 bd Gén Vanier','48000','MENDE',352.31,'PS',NULL),(74,'Chauchard','Roger','9 r Vaucelles','13000','MARSEILLE',552.19,'PH',NULL),(75,'Mabire','Roland','11 r Boutiques','67000','STRASBOURG',422.39,'PO',NULL),(76,'Leroy','Soazig','45 r Boutiques','61000','ALENCON',570.67,'MH',NULL),(77,'Guyot','Stéphane','26 r Hérouville','46000','FIGEAC',28.85,'MV',NULL),(78,'Delposen','Sylvain','39 av 6 Juin','27000','DREUX',292.01,'PS',NULL),(79,'Rault','Sylvie','15 bd Richemond','02000','SOISSON',526.6,'PH',NULL),(80,'Renouf','Sylvie','98 bd Mar Lyautey','88000','EPINAL',425.24,'PO',NULL),(81,'Alliet-Grach','Thierry','14 av Thiès','07000','PRIVAS',451.31,'MH',NULL),(82,'Bayard','Thierry','92 r Falaise','42000','SAINT ETIENNE',271.71,'MV',NULL),(83,'Gauchet','Thierry','7 r Desmoueux','38100','GRENOBLE',406.1,'PS',NULL),(84,'Bobichon','Tristan','219 r Caponière','09000','FOIX',218.36,'PH',NULL),(85,'Duchemin-Laniel','Véronique','130 r St Jean','33000','LIBOURNE',265.61,'PO',NULL),(86,'Laurent','Younès','34 r Demolombe','53000','MAYENNE',496.1,'MH',NULL);
/*!40000 ALTER TABLE `PRATICIEN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRESCRIRE`
--

DROP TABLE IF EXISTS `PRESCRIRE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRESCRIRE` (
  `MED_DEPOTLEGAL` varchar(20) NOT NULL DEFAULT '',
  `TIN_CODE` varchar(10) NOT NULL DEFAULT '',
  `DOS_CODE` varchar(20) NOT NULL DEFAULT '',
  `PRE_POSOLOGIE` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`MED_DEPOTLEGAL`,`TIN_CODE`,`DOS_CODE`),
  KEY `TIN_CODE` (`TIN_CODE`),
  KEY `DOS_CODE` (`DOS_CODE`),
  CONSTRAINT `PRESCRIRE_ibfk_1` FOREIGN KEY (`MED_DEPOTLEGAL`) REFERENCES `MEDICAMENT` (`MED_DEPOTLEGAL`),
  CONSTRAINT `PRESCRIRE_ibfk_2` FOREIGN KEY (`TIN_CODE`) REFERENCES `TYPE_INDIVIDU` (`TIN_CODE`),
  CONSTRAINT `PRESCRIRE_ibfk_3` FOREIGN KEY (`DOS_CODE`) REFERENCES `DOSAGE` (`DOS_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRESCRIRE`
--

LOCK TABLES `PRESCRIRE` WRITE;
/*!40000 ALTER TABLE `PRESCRIRE` DISABLE KEYS */;
/*!40000 ALTER TABLE `PRESCRIRE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRESENTATION`
--

DROP TABLE IF EXISTS `PRESENTATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRESENTATION` (
  `PRE_CODE` varchar(4) NOT NULL,
  `PRE_LIBELLE` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`PRE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRESENTATION`
--

LOCK TABLES `PRESENTATION` WRITE;
/*!40000 ALTER TABLE `PRESENTATION` DISABLE KEYS */;
/*!40000 ALTER TABLE `PRESENTATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRESENTE`
--

DROP TABLE IF EXISTS `PRESENTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRESENTE` (
  `VISITE_NUM` int(11) NOT NULL,
  `MED_DEPOTLEGAL` varchar(20) NOT NULL,
  `NOTE` tinyint(4) DEFAULT NULL,
  `DOC_OFFERTE` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`VISITE_NUM`,`MED_DEPOTLEGAL`),
  KEY `MED_DEPOTLEGAL` (`MED_DEPOTLEGAL`),
  CONSTRAINT `PRESENTE_ibfk_1` FOREIGN KEY (`VISITE_NUM`) REFERENCES `RAPPORT_VISITE` (`RAP_CODE`),
  CONSTRAINT `PRESENTE_ibfk_2` FOREIGN KEY (`MED_DEPOTLEGAL`) REFERENCES `MEDICAMENT` (`MED_DEPOTLEGAL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRESENTE`
--

LOCK TABLES `PRESENTE` WRITE;
/*!40000 ALTER TABLE `PRESENTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `PRESENTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RAPPORT_VISITE`
--

DROP TABLE IF EXISTS `RAPPORT_VISITE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RAPPORT_VISITE` (
  `VIS_MATRICULE` varchar(20) NOT NULL DEFAULT '',
  `RAP_CODE` int(11) NOT NULL,
  `PRA_CODE` int(11) DEFAULT NULL,
  `RAP_DATE_VISITE` date DEFAULT NULL,
  `RAP_BILAN` text,
  `RAP_MOTIF` tinyint(4) DEFAULT NULL,
  `RAP_IMPACT` varchar(30) DEFAULT NULL,
  `RAP_CONCURRENCE` varchar(50) DEFAULT NULL,
  `RAP_DATE_SAISIE` date DEFAULT NULL,
  `RAP_DUREE_SAISIE` varchar(3) DEFAULT NULL,
  `RAP_COEF_CONFIANCE` smallint(6) DEFAULT NULL,
  `SAISIE_FINIE` tinyint(1) DEFAULT NULL,
  `MOTIF_AUTRE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`RAP_CODE`,`VIS_MATRICULE`),
  KEY `VIS_MATRICULE` (`VIS_MATRICULE`),
  KEY `PRA_CODE` (`PRA_CODE`),
  KEY `RAP_MOTIF` (`RAP_MOTIF`),
  CONSTRAINT `RAPPORT_VISITE_ibfk_1` FOREIGN KEY (`VIS_MATRICULE`) REFERENCES `VISITEUR` (`VIS_MATRICULE`),
  CONSTRAINT `RAPPORT_VISITE_ibfk_2` FOREIGN KEY (`PRA_CODE`) REFERENCES `PRATICIEN` (`PRA_CODE`),
  CONSTRAINT `RAPPORT_VISITE_ibfk_3` FOREIGN KEY (`RAP_MOTIF`) REFERENCES `MOTIF_VISITE` (`MOTIF_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RAPPORT_VISITE`
--

LOCK TABLES `RAPPORT_VISITE` WRITE;
/*!40000 ALTER TABLE `RAPPORT_VISITE` DISABLE KEYS */;
INSERT INTO `RAPPORT_VISITE` VALUES ('a131',3,23,'2002-04-18','Médecin curieux, à recontacer en décembre pour réunion',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('a17',4,4,'2003-05-21','Changement de direction, redéfinition de la politique médicamenteuse, recours au générique',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `RAPPORT_VISITE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALISER`
--

DROP TABLE IF EXISTS `REALISER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALISER` (
  `AC_CODE` int(11) NOT NULL DEFAULT '0',
  `VIS_MATRICULE` varchar(20) NOT NULL DEFAULT '',
  `REA_MTTFRAIS` float DEFAULT NULL,
  PRIMARY KEY (`AC_CODE`,`VIS_MATRICULE`),
  KEY `VIS_MATRICULE` (`VIS_MATRICULE`),
  CONSTRAINT `REALISER_ibfk_1` FOREIGN KEY (`AC_CODE`) REFERENCES `ACTIVITE_COMPL` (`AC_CODE`),
  CONSTRAINT `REALISER_ibfk_2` FOREIGN KEY (`VIS_MATRICULE`) REFERENCES `VISITEUR` (`VIS_MATRICULE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALISER`
--

LOCK TABLES `REALISER` WRITE;
/*!40000 ALTER TABLE `REALISER` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALISER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REGION`
--

DROP TABLE IF EXISTS `REGION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REGION` (
  `REG_CODE` varchar(4) NOT NULL DEFAULT '',
  `SEC_CODE` varchar(2) DEFAULT NULL,
  `REG_NOM` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`REG_CODE`),
  KEY `SEC_CODE` (`SEC_CODE`),
  CONSTRAINT `REGION_ibfk_1` FOREIGN KEY (`SEC_CODE`) REFERENCES `SECTEUR` (`SEC_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REGION`
--

LOCK TABLES `REGION` WRITE;
/*!40000 ALTER TABLE `REGION` DISABLE KEYS */;
INSERT INTO `REGION` VALUES ('AL','E','Alsace Lorraine'),('AQ','S','Aquitaine'),('AU','P','Auvergne'),('BG','O','Bretagne'),('BN','O','Basse Normandie'),('BO','E','Bourgogne'),('CA','N','Champagne Ardennes'),('CE','P','Centre'),('FC','E','Franche Comté'),('HN','N','Haute Normandie'),('IF','P','Ile de France'),('LG','S','Languedoc'),('LI','P','Limousin'),('MP','S','Midi Pyrénée'),('NP','N','Nord Pas de Calais'),('PA','S','Provence Alpes Cote d\'Azur'),('PC','O','Poitou Charente'),('PI','N','Picardie'),('PL','O','Pays de Loire'),('RA','E','Rhone Alpes'),('RO','S','Roussilon'),('VD','O','Vendée');
/*!40000 ALTER TABLE `REGION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESPONSABLE`
--

DROP TABLE IF EXISTS `RESPONSABLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESPONSABLE` (
  `RESP_MATRICULE` varchar(20) NOT NULL DEFAULT '',
  `RESP_NOM` varchar(50) DEFAULT NULL,
  `RESP_PRENOM` varchar(100) DEFAULT NULL,
  `RESP_ADRESSE` varchar(100) DEFAULT NULL,
  `RESP_CP` varchar(10) DEFAULT NULL,
  `RESP_VILLE` varchar(60) DEFAULT NULL,
  `RESP_DATEEMBAUCHE` date DEFAULT NULL,
  `RESP_SECTEUR` varchar(2) NOT NULL,
  PRIMARY KEY (`RESP_MATRICULE`),
  KEY `RESP_SECTEUR` (`RESP_SECTEUR`),
  CONSTRAINT `RESPONSABLE_ibfk_1` FOREIGN KEY (`RESP_SECTEUR`) REFERENCES `REGION` (`SEC_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESPONSABLE`
--

LOCK TABLES `RESPONSABLE` WRITE;
/*!40000 ALTER TABLE `RESPONSABLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESPONSABLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SECTEUR`
--

DROP TABLE IF EXISTS `SECTEUR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SECTEUR` (
  `SEC_CODE` varchar(2) NOT NULL,
  `SEC_LIBELLE` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`SEC_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SECTEUR`
--

LOCK TABLES `SECTEUR` WRITE;
/*!40000 ALTER TABLE `SECTEUR` DISABLE KEYS */;
INSERT INTO `SECTEUR` VALUES ('E','Est'),('N','Nord'),('O','Ouest'),('P','Paris centre'),('S','Sud');
/*!40000 ALTER TABLE `SECTEUR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SPECIALITE`
--

DROP TABLE IF EXISTS `SPECIALITE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SPECIALITE` (
  `SPE_CODE` varchar(10) NOT NULL,
  `SPE_LIBELLE` text,
  PRIMARY KEY (`SPE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SPECIALITE`
--

LOCK TABLES `SPECIALITE` WRITE;
/*!40000 ALTER TABLE `SPECIALITE` DISABLE KEYS */;
INSERT INTO `SPECIALITE` VALUES ('ACP','anatomie et cytologie pathologiques'),('AMV','angéiologie, médecine vasculaire'),('ARC','anesthésiologie et réanimation chirurgicale'),('BM','biologie médicale'),('CAC','cardiologie et affections cardio-vasculaires'),('CCT','chirurgie cardio-vasculaire et thoracique'),('CG','chirurgie générale'),('CMF','chirurgie maxillo-faciale'),('COM','cancérologie, oncologie médicale'),('COT','chirurgie orthopédique et traumatologie'),('CPR','chirurgie plastique reconstructrice et esthétique'),('CU','chirurgie urologique'),('CV','chirurgie vasculaire'),('DN','diabétologie-nutrition, nutrition'),('DV','dermatologie et vénéréologie'),('EM','endocrinologie et métabolismes'),('ETD','évaluation et traitement de la douleur'),('GEH','gastro-entérologie et hépatologie (appareil digestif)'),('GMO','gynécologie médicale, obstétrique'),('GO','gynécologie-obstétrique'),('HEM','maladies du sang (hématologie)'),('MBS','médecine et biologie du sport'),('MDT','médecine du travail'),('MMO','médecine manuelle - ostéopathie'),('MN','médecine nucléaire'),('MPR','médecine physique et de réadaptation'),('MTR','médecine tropicale, pathologie infectieuse et tropicale'),('NEP','néphrologie'),('NRC','neurochirurgie'),('NRL','neurologie'),('ODM','orthopédie dento maxillo-faciale'),('OPH','ophtalmologie'),('ORL','oto-rhino-laryngologie'),('PEA','psychiatrie de l\'enfant et de l\'adolescent'),('PME','pédiatrie maladies des enfants'),('PNM','pneumologie'),('PSC','psychiatrie'),('RAD','radiologie (radiodiagnostic et imagerie médicale)'),('RDT','radiothérapie (oncologie option radiothérapie)'),('RGM','reproduction et gynécologie médicale'),('RHU','rhumatologie'),('STO','stomatologie'),('SXL','sexologie'),('TXA','toxicomanie et alcoologie');
/*!40000 ALTER TABLE `SPECIALITE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SUIVI_ECHANTILLONS_DISTRIBUES`
--

DROP TABLE IF EXISTS `SUIVI_ECHANTILLONS_DISTRIBUES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SUIVI_ECHANTILLONS_DISTRIBUES` (
  `QTE_DEMANDEE` int(11) DEFAULT NULL,
  `QTE_ACCORDEE` int(11) DEFAULT NULL,
  `VIS_MATRICULE` varchar(20) NOT NULL,
  `MED_DEPOTLEGAL` varchar(20) NOT NULL,
  PRIMARY KEY (`VIS_MATRICULE`,`MED_DEPOTLEGAL`),
  KEY `MED_DEPOTLEGAL` (`MED_DEPOTLEGAL`),
  CONSTRAINT `SUIVI_ECHANTILLONS_DISTRIBUES_ibfk_1` FOREIGN KEY (`VIS_MATRICULE`) REFERENCES `VISITEUR` (`VIS_MATRICULE`),
  CONSTRAINT `SUIVI_ECHANTILLONS_DISTRIBUES_ibfk_2` FOREIGN KEY (`MED_DEPOTLEGAL`) REFERENCES `MEDICAMENT` (`MED_DEPOTLEGAL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SUIVI_ECHANTILLONS_DISTRIBUES`
--

LOCK TABLES `SUIVI_ECHANTILLONS_DISTRIBUES` WRITE;
/*!40000 ALTER TABLE `SUIVI_ECHANTILLONS_DISTRIBUES` DISABLE KEYS */;
/*!40000 ALTER TABLE `SUIVI_ECHANTILLONS_DISTRIBUES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Switchboard Items`
--

DROP TABLE IF EXISTS `Switchboard Items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Switchboard Items` (
  `SwitchboardID` int(11) DEFAULT NULL,
  `ItemNumber` int(11) DEFAULT NULL,
  `ItemText` varchar(100) DEFAULT NULL,
  `Command` int(11) DEFAULT NULL,
  `Argument` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Switchboard Items`
--

LOCK TABLES `Switchboard Items` WRITE;
/*!40000 ALTER TABLE `Switchboard Items` DISABLE KEYS */;
INSERT INTO `Switchboard Items` VALUES (1,0,'Gestion des comptes rendus',NULL,'Par défaut'),(1,1,'Comptes-Rendus',3,'RAPPORT_VISITE'),(1,2,'Visiteurs',3,'F_VISITEUR'),(1,3,'Praticiens',3,'F_PRATICIEN'),(1,4,'Medicaments',3,'F_MEDICAMENT'),(1,5,'Quitter',8,'quitter');
/*!40000 ALTER TABLE `Switchboard Items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TRAVAILLE`
--

DROP TABLE IF EXISTS `TRAVAILLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TRAVAILLE` (
  `CAB_ID` int(11) NOT NULL,
  `PRA_CODE` int(11) NOT NULL,
  `REMPLACANT` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`CAB_ID`,`PRA_CODE`),
  KEY `PRA_CODE` (`PRA_CODE`),
  CONSTRAINT `TRAVAILLE_ibfk_1` FOREIGN KEY (`CAB_ID`) REFERENCES `CABINET` (`CAB_ID`),
  CONSTRAINT `TRAVAILLE_ibfk_2` FOREIGN KEY (`PRA_CODE`) REFERENCES `PRATICIEN` (`PRA_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRAVAILLE`
--

LOCK TABLES `TRAVAILLE` WRITE;
/*!40000 ALTER TABLE `TRAVAILLE` DISABLE KEYS */;
INSERT INTO `TRAVAILLE` VALUES (1,1,0),(2,2,0);
/*!40000 ALTER TABLE `TRAVAILLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TRAVAILLER`
--

DROP TABLE IF EXISTS `TRAVAILLER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TRAVAILLER` (
  `VIS_MATRICULE` varchar(20) NOT NULL DEFAULT '',
  `JJMMAA` date NOT NULL DEFAULT '0000-00-00',
  `REG_CODE` varchar(4) NOT NULL DEFAULT '',
  `TRA_ROLE` varchar(22) DEFAULT NULL,
  PRIMARY KEY (`VIS_MATRICULE`,`JJMMAA`,`REG_CODE`),
  KEY `REG_CODE` (`REG_CODE`),
  CONSTRAINT `TRAVAILLER_ibfk_1` FOREIGN KEY (`VIS_MATRICULE`) REFERENCES `VISITEUR` (`VIS_MATRICULE`),
  CONSTRAINT `TRAVAILLER_ibfk_2` FOREIGN KEY (`REG_CODE`) REFERENCES `REGION` (`REG_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRAVAILLER`
--

LOCK TABLES `TRAVAILLER` WRITE;
/*!40000 ALTER TABLE `TRAVAILLER` DISABLE KEYS */;
INSERT INTO `TRAVAILLER` VALUES ('a131','1992-12-11','BN','Visiteur'),('a131','1996-05-27','BG','Visiteur'),('a17','1991-08-26','RA','Visiteur'),('a17','1997-09-19','RA','Délégué'),('a55','1987-07-17','MP','Visiteur'),('a55','1995-05-19','RO','Visiteur'),('a55','1999-08-21','RO','Délégué'),('a93','1999-01-02','PC','Visiteur'),('b13','1996-03-11','AL','Visiteur'),('b16','1997-03-21','BG','Visiteur'),('b19','1999-01-31','PL','Visiteur'),('b25','1994-07-03','PL','Visiteur'),('b25','2000-01-01','PL','Délégué'),('b28','2000-08-02','LG','Visiteur'),('b34','1993-12-06','CE','Délégué'),('b34','1999-06-18','CE','Responsable'),('b4','1997-09-25','AQ','Visiteur'),('b50','1998-01-18','PA','Visiteur'),('b59','1995-10-21','RA','Visiteur'),('c14','1989-02-01','PA','Visiteur'),('c14','1997-02-01','PA','Délégué'),('c14','2001-03-03','PA','Responsable'),('c3','1992-05-05','CA','Visiteur'),('c54','1991-04-09','AL','Visiteur'),('d13','1991-12-05','PL','Visiteur'),('d51','1997-11-18','FC','Délégué'),('d51','2002-03-20','FC','Responsable'),('e22','1989-03-24','AL','Visiteur'),('e24','1993-05-17','AL','Délégué'),('e24','2000-02-29','AL','Responsable'),('e39','1988-04-26','IF','Visiteur'),('e49','1996-02-19','MP','Visiteur'),('e5','1990-11-27','MP','Visiteur'),('e5','1995-11-27','MP','Délégué'),('e5','2000-11-27','AQ','Responsable'),('e52','1991-10-31','HN','Visiteur'),('f21','1993-06-08','RA','Visiteur'),('f39','1997-02-15','RA','Visiteur'),('f4','1994-05-03','MP','Visiteur'),('g19','1996-01-18','IF','Visiteur'),('g30','1999-03-27','PI','Délégué'),('g30','2000-10-31','PI','Responsable'),('g53','1985-10-02','BG','Visiteur'),('g7','1996-01-13','LI','Visiteur'),('h13','1993-05-08','LI','Visiteur'),('h30','1998-04-26','IF','Visiteur'),('h35','1993-08-26','AU','Visiteur'),('h40','1992-11-01','CA','Visiteur'),('j45','1998-02-25','CA','Responsable'),('j50','1992-12-16','NP','Visiteur'),('j8','1998-06-18','IF','Responsable'),('k4','1996-11-21','LG','Visiteur'),('k53','1983-03-23','CA','Visiteur'),('k53','1992-04-03','AL','Délégué'),('l14','1995-02-02','PL','Visiteur'),('l23','1995-06-05','PC','Visiteur'),('l46','1997-01-24','PL','Visiteur'),('l56','1996-02-27','FC','Visiteur'),('m35','1987-10-06','MP','Visiteur'),('m45','1990-10-13','AL','Visiteur'),('m45','1999-04-08','AL','Délégué'),('n42','1996-03-06','HN','Visiteur'),('n58','1992-08-30','CE','Visiteur'),('n59','1994-12-19','PI','Visiteur'),('o26','1995-01-05','LG','Visiteur'),('p32','1992-12-24','IF','Visiteur'),('p40','1992-12-14','BN','Délégué'),('p40','1999-07-17','BN','Responsable'),('p41','1998-07-27','PC','Visiteur'),('p42','1994-12-12','PI','Visiteur'),('p49','1977-10-03','CE','Visiteur'),('p6','1997-03-30','AQ','Visiteur'),('p7','1990-03-01','RO','Visiteur'),('p8','1991-06-23','BO','Visiteur'),('q17','1997-09-06','BN','Visiteur'),('r24','1984-07-29','BN','Visiteur'),('r24','1998-05-25','BN','Responsable'),('r58','1990-06-30','BG','Visiteur'),('s10','1995-11-14','FC','Visiteur'),('s21','1992-09-25','LI','Visiteur'),('t43','1995-03-09','BO','Visiteur'),('t47','1997-08-29','PI','Visiteur'),('t55','1994-11-29','MP','Visiteur'),('t60','1991-03-29','CE','Visiteur');
/*!40000 ALTER TABLE `TRAVAILLER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TYPE_INDIVIDU`
--

DROP TABLE IF EXISTS `TYPE_INDIVIDU`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TYPE_INDIVIDU` (
  `TIN_CODE` varchar(10) NOT NULL,
  `TIN_LIBELLE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`TIN_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TYPE_INDIVIDU`
--

LOCK TABLES `TYPE_INDIVIDU` WRITE;
/*!40000 ALTER TABLE `TYPE_INDIVIDU` DISABLE KEYS */;
/*!40000 ALTER TABLE `TYPE_INDIVIDU` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TYPE_PRATICIEN`
--

DROP TABLE IF EXISTS `TYPE_PRATICIEN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TYPE_PRATICIEN` (
  `TYP_CODE` varchar(6) NOT NULL,
  `TYP_LIBELLE` varchar(50) DEFAULT NULL,
  `TYP_LIEU` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`TYP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TYPE_PRATICIEN`
--

LOCK TABLES `TYPE_PRATICIEN` WRITE;
/*!40000 ALTER TABLE `TYPE_PRATICIEN` DISABLE KEYS */;
INSERT INTO `TYPE_PRATICIEN` VALUES ('MH','Médecin Hospitalier','Hopital ou clinique'),('MV','Médecine de Ville','Cabinet'),('PH','Pharmacien Hospitalier','Hopital ou clinique'),('PO','Pharmacien Officine','Pharmacie'),('PS','Personnel de santé','Centre paramédical');
/*!40000 ALTER TABLE `TYPE_PRATICIEN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VISITEUR`
--

DROP TABLE IF EXISTS `VISITEUR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VISITEUR` (
  `VIS_MATRICULE` varchar(20) NOT NULL,
  `VIS_NOM` varchar(50) DEFAULT NULL,
  `VIS_PRENOM` varchar(100) DEFAULT NULL,
  `VIS_ADRESSE` varchar(100) DEFAULT NULL,
  `VIS_CP` varchar(10) DEFAULT NULL,
  `VIS_VILLE` varchar(60) DEFAULT NULL,
  `VIS_DATEEMBAUCHE` date DEFAULT NULL,
  `SEC_CODE` varchar(2) DEFAULT NULL,
  `LAB_CODE` varchar(4) DEFAULT NULL,
  `DEP_CODE` varchar(3) DEFAULT NULL,
  `DELEGUE` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`VIS_MATRICULE`),
  KEY `VISITEUR_FK_SECTEUR` (`SEC_CODE`),
  KEY `VISITEUR_FK_LABO` (`LAB_CODE`),
  KEY `VISITEUR_FK_DEPARTEMENT` (`DEP_CODE`),
  CONSTRAINT `VISITEUR_FK_DEPARTEMENT` FOREIGN KEY (`DEP_CODE`) REFERENCES `DEPARTEMENT` (`DEP_CODE`) ON DELETE CASCADE,
  CONSTRAINT `VISITEUR_FK_LABO` FOREIGN KEY (`LAB_CODE`) REFERENCES `LABO` (`LAB_CODE`) ON DELETE CASCADE,
  CONSTRAINT `VISITEUR_FK_SECTEUR` FOREIGN KEY (`SEC_CODE`) REFERENCES `SECTEUR` (`SEC_CODE`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VISITEUR`
--

LOCK TABLES `VISITEUR` WRITE;
/*!40000 ALTER TABLE `VISITEUR` DISABLE KEYS */;
INSERT INTO `VISITEUR` VALUES ('a131','Villechalane','Louis','8 cours Lafontaine','29000','BREST','1992-12-11',NULL,'SW',NULL,NULL),('a17','Andre','David','1 r Aimon de Chissée','38100','GRENOBLE','1991-08-26',NULL,'GY',NULL,NULL),('a55','Bedos','Christian','1 r Bénédictins','65000','TARBES','1987-07-17',NULL,'GY',NULL,NULL),('a93','Tusseau','Louis','22 r Renou','86000','POITIERS','1999-01-02',NULL,'SW',NULL,NULL),('b13','Bentot','Pascal','11 av 6 Juin','67000','STRASBOURG','1996-03-11',NULL,'GY',NULL,NULL),('b16','Bioret','Luc','1 r Linne','35000','RENNES','1997-03-21',NULL,'SW',NULL,NULL),('b19','Bunisset','Francis','10 r Nicolas Chorier','85000','LA ROCHE SUR YON','1999-01-31',NULL,'GY',NULL,NULL),('b25','Bunisset','Denise','1 r Lionne','49100','ANGERS','1994-07-03',NULL,'SW',NULL,NULL),('b28','Cacheux','Bernard','114 r Authie','34000','MONTPELLIER','2000-08-02',NULL,'GY',NULL,NULL),('b34','Cadic','Eric','123 r Caponière','41000','BLOIS','1993-12-06','P','SW',NULL,NULL),('b4','Charoze','Catherine','100 pl Géants','33000','BORDEAUX','1997-09-25',NULL,'SW',NULL,NULL),('b50','Clepkens','Christophe','12 r Fédérico Garcia Lorca','13000','MARSEILLE','1998-01-18',NULL,'SW',NULL,NULL),('b59','Cottin','Vincenne','36 sq Capucins','05000','GAP','1995-10-21',NULL,'GY',NULL,NULL),('c14','Daburon','François','13 r Champs Elysées','06000','NICE','1989-02-01','S','SW',NULL,NULL),('c3','De','Philippe','13 r Charles Peguy','10000','TROYES','1992-05-05',NULL,'SW',NULL,NULL),('c54','Debelle','Michel','181 r Caponière','88000','EPINAL','1991-04-09',NULL,'SW',NULL,NULL),('d13','Debelle','Jeanne','134 r Stalingrad','44000','NANTES','1991-12-05',NULL,'SW',NULL,NULL),('d51','Debroise','Michel','2 av 6 Juin','70000','VESOUL','1997-11-18','E','GY',NULL,NULL),('e22','Desmarquest','Nathalie','14 r Fédérico Garcia Lorca','54000','NANCY','1989-03-24',NULL,'GY',NULL,NULL),('e24','Desnost','Pierre','16 r Barral de Montferrat','55000','VERDUN','1993-05-17','E','SW',NULL,NULL),('e39','Dudouit','Frédéric','18 quai Xavier Jouvin','75000','PARIS','1988-04-26',NULL,'GY',NULL,NULL),('e49','Duncombe','Claude','19 av Alsace Lorraine','09000','FOIX','1996-02-19',NULL,'GY',NULL,NULL),('e5','Enault-Pascreau','Céline','25B r Stalingrad','40000','MONT DE MARSAN','1990-11-27','S','GY',NULL,NULL),('e52','Eynde','Valérie','3 r Henri Moissan','76000','ROUEN','1991-10-31',NULL,'GY',NULL,NULL),('f21','Finck','Jacques','rte Montreuil Bellay','74000','ANNECY','1993-06-08',NULL,'SW',NULL,NULL),('f39','Frémont','Fernande','4 r Jean Giono','69000','LYON','1997-02-15',NULL,'GY',NULL,NULL),('f4','Gest','Alain','30 r Authie','46000','FIGEAC','1994-05-03',NULL,'GY',NULL,NULL),('g19','Gheysen','Galassus','32 bd Mar Foch','75000','PARIS','1996-01-18',NULL,'SW',NULL,NULL),('g30','Girard','Yvon','31 av 6 Juin','80000','AMIENS','1999-03-27','N','GY',NULL,NULL),('g53','Gombert','Luc','32 r Emile Gueymard','56000','VANNES','1985-10-02',NULL,'GY',NULL,NULL),('g7','Guindon','Caroline','40 r Mar Montgomery','87000','LIMOGES','1996-01-13',NULL,'GY',NULL,NULL),('h13','Guindon','François','44 r Picotière','19000','TULLE','1993-05-08',NULL,'SW',NULL,NULL),('h30','Igigabel','Guy','33 gal Arlequin','94000','CRETEIL','1998-04-26',NULL,'SW',NULL,NULL),('h35','Jourdren','Pierre','34 av Jean Perrot','15000','AURRILLAC','1993-08-26',NULL,'GY',NULL,NULL),('h40','Juttard','Pierre-Raoul','34 cours Jean Jaurès','08000','SEDAN','1992-11-01',NULL,'GY',NULL,NULL),('j45','Labouré-Morel','Saout','38 cours Berriat','52000','CHAUMONT','1998-02-25','N','SW',NULL,NULL),('j50','Landré','Philippe','4 av Gén Laperrine','59000','LILLE','1992-12-16',NULL,'GY',NULL,NULL),('j8','Langeard','Hugues','39 av Jean Perrot','93000','BAGNOLET','1998-06-18','P','GY',NULL,NULL),('k4','Lanne','Bernard','4 r Bayeux','30000','NIMES','1996-11-21',NULL,'SW',NULL,NULL),('k53','Le','Noël','4 av Beauvert','68000','MULHOUSE','1983-03-23',NULL,'SW',NULL,NULL),('l14','Le','Jean','39 r Raspail','53000','LAVAL','1995-02-02',NULL,'SW',NULL,NULL),('l23','Leclercq','Servane','11 r Quinconce','18000','BOURGES','1995-06-05',NULL,'SW',NULL,NULL),('l46','Lecornu','Jean-Bernard','4 bd Mar Foch','72000','LA FERTE BERNARD','1997-01-24',NULL,'GY',NULL,NULL),('l56','Lecornu','Ludovic','4 r Abel Servien','25000','BESANCON','1996-02-27',NULL,'SW',NULL,NULL),('m35','Lejard','Agnès','4 r Anthoard','82000','MONTAUBAN','1987-10-06',NULL,'SW',NULL,NULL),('m45','Lesaulnier','Pascal','47 r Thiers','57000','METZ','1990-10-13',NULL,'SW',NULL,NULL),('n42','Letessier','Stéphane','5 chem Capuche','27000','EVREUX','1996-03-06',NULL,'GY',NULL,NULL),('n58','Loirat','Didier','Les Pêchers cité Bourg la Croix','45000','ORLEANS','1992-08-30',NULL,'GY',NULL,NULL),('n59','Maffezzoli','Thibaud','5 r Chateaubriand','02000','LAON','1994-12-19',NULL,'SW',NULL,NULL),('o26','Mancini','Anne','5 r D\'Agier','48000','MENDE','1995-01-05',NULL,'GY',NULL,NULL),('p32','Marcouiller','Gérard','7 pl St Gilles','91000','ISSY LES MOULINEAUX','1992-12-24',NULL,'GY',NULL,NULL),('p40','Michel','Jean-Claude','5 r Gabriel Péri','61000','FLERS','1992-12-14','O','SW',NULL,NULL),('p41','Montecot','Françoise','6 r Paul Valéry','17000','SAINTES','1998-07-27',NULL,'GY',NULL,NULL),('p42','Notini','Veronique','5 r Lieut Chabal','60000','BEAUVAIS','1994-12-12',NULL,'SW',NULL,NULL),('p49','Onfroy','Den','5 r Sidonie Jacolin','37000','TOURS','1977-10-03',NULL,'GY',NULL,NULL),('p6','Pascreau','Charles','57 bd Mar Foch','64000','PAU','1997-03-30',NULL,'SW',NULL,NULL),('p7','Pernot','Claude-Noël','6 r Alexandre 1 de Yougoslavie','11000','NARBONNE','1990-03-01',NULL,'SW',NULL,NULL),('p8','Perrier','Maître','6 r Aubert Dubayet','71000','CHALON SUR SAONE','1991-06-23',NULL,'GY',NULL,NULL),('q17','Petit','Jean-Louis','7 r Ernest Renan','50000','SAINT LO','1997-09-06',NULL,'GY',NULL,NULL),('r24','Piquery','Patrick','9 r Vaucelles','14000','CAEN','1984-07-29','O','GY',NULL,NULL),('r58','Quiquandon','Joël','7 r Ernest Renan','29000','QUIMPER','1990-06-30',NULL,'GY',NULL,NULL),('s10','Retailleau','Josselin','88Bis r Saumuroise','39000','DOLE','1995-11-14',NULL,'SW',NULL,NULL),('s21','Retailleau','Pascal','32 bd Ayrault','23000','MONTLUCON','1992-09-25',NULL,'SW',NULL,NULL),('t43','Souron','Maryse','7B r Gay Lussac','21000','DIJON','1995-03-09',NULL,'SW',NULL,NULL),('t47','Tiphagne','Patrick','7B r Gay Lussac','62000','ARRAS','1997-08-29',NULL,'SW',NULL,NULL),('t55','Tréhet','Alain','7D chem Barral','12000','RODEZ','1994-11-29',NULL,'SW','01',NULL),('t60','Tusseau','Josselin','63 r Bon Repos','28000','CHARTRES','1991-03-29',NULL,'GY','02',NULL),('zzz','swiss','bourdin',NULL,NULL,NULL,'2003-06-18',NULL,'BC',NULL,NULL);
/*!40000 ALTER TABLE `VISITEUR` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-02-21 10:35:08
