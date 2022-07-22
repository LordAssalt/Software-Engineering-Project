-- MySQL dump 10.13  Distrib 8.0.19, for macos10.15 (x86_64)
--
-- Host: localhost    Database: carsharing
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accessorio`
--

DROP TABLE IF EXISTS `accessorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accessorio` (
  `idaccessorio` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `postioccupati` int NOT NULL,
  `costo` decimal(5,2) NOT NULL,
  PRIMARY KEY (`idaccessorio`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accessorio`
--



--
-- Table structure for table `addetto`
--

DROP TABLE IF EXISTS `addetto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addetto` (
  `utente_idutente` int NOT NULL,
  `stazione_idstazione` int NOT NULL,
  PRIMARY KEY (`utente_idutente`),
  KEY `stazione_idstazione` (`stazione_idstazione`),
  CONSTRAINT `addetto_ibfk_1` FOREIGN KEY (`stazione_idstazione`) REFERENCES `stazione` (`idstazione`),
  CONSTRAINT `fk_addetto_utente1` FOREIGN KEY (`utente_idutente`) REFERENCES `utente` (`idutente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addetto`
--

LOCK TABLES `addetto` WRITE;
/*!40000 ALTER TABLE `addetto` DISABLE KEYS */;
INSERT INTO `addetto` VALUES (1,1),(5,2);
/*!40000 ALTER TABLE `addetto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amministratore`
--

DROP TABLE IF EXISTS `amministratore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amministratore` (
  `utente_idutente` int NOT NULL,
  PRIMARY KEY (`utente_idutente`),
  CONSTRAINT `fk_amministratore_utente1` FOREIGN KEY (`utente_idutente`) REFERENCES `utente` (`idutente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amministratore`
--

LOCK TABLES `amministratore` WRITE;
/*!40000 ALTER TABLE `amministratore` DISABLE KEYS */;
INSERT INTO `amministratore` VALUES (3);
/*!40000 ALTER TABLE `amministratore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `utente_idutente` int NOT NULL,
  `nome` varchar(45) NOT NULL,
  `cognome` varchar(45) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `citta` varchar(45) NOT NULL,
  `cap` varchar(5) NOT NULL,
  `indirizzo` varchar(45) NOT NULL,
  `eta` varchar(45) NOT NULL,
  `foto` longblob,
  PRIMARY KEY (`utente_idutente`),
  KEY `fk_cliente_utente1_idx` (`utente_idutente`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--



--
-- Table structure for table `localita`
--

DROP TABLE IF EXISTS `localita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localita` (
  `idlocalita` int NOT NULL AUTO_INCREMENT,
  `citta` varchar(45) DEFAULT NULL,
  `latitudine` double DEFAULT NULL,
  `longitudine` double DEFAULT NULL,
  PRIMARY KEY (`idlocalita`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localita`
--

LOCK TABLES `localita` WRITE;
/*!40000 ALTER TABLE `localita` DISABLE KEYS */;
INSERT INTO `localita` VALUES (1,'Lecce',40.358,18.1728),(2,'Milano',45.4773,9.1815),(3,'Roma',41.9109,12.4818);
/*!40000 ALTER TABLE `localita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messaggi`
--

DROP TABLE IF EXISTS `messaggi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messaggi` (
  `idmessaggi` int NOT NULL AUTO_INCREMENT,
  `testo` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `stato` enum('Letto','Non letto') CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `mittente` int NOT NULL,
  `destinatario` int NOT NULL,
  `dataInvio` datetime NOT NULL,
  PRIMARY KEY (`idmessaggi`),
  KEY `idutente_idx` (`mittente`,`destinatario`),
  KEY `idutente2_idx` (`destinatario`),
  CONSTRAINT `idutente` FOREIGN KEY (`mittente`) REFERENCES `utente` (`idutente`),
  CONSTRAINT `idutente2` FOREIGN KEY (`destinatario`) REFERENCES `utente` (`idutente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messaggi`
--

LOCK TABLES `messaggi` WRITE;
/*!40000 ALTER TABLE `messaggi` DISABLE KEYS */;
/*!40000 ALTER TABLE `messaggi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mezzi_da_preparare`
--

DROP TABLE IF EXISTS `mezzi_da_preparare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mezzi_da_preparare` (
  `idmezzi_da_preparare` int NOT NULL AUTO_INCREMENT,
  `mezzo_idmezzo` int NOT NULL,
  `dataInizio` datetime NOT NULL,
  `dataFine` datetime NOT NULL,
  `posti_occupati` int NOT NULL,
  `stato_addetto` enum('Pronto','Non pronto') NOT NULL DEFAULT 'Non pronto',
  `stato_operatore` enum('Partito','Non partito') DEFAULT 'Non partito',
  PRIMARY KEY (`idmezzi_da_preparare`),
  KEY `mezzo_idmezzo` (`mezzo_idmezzo`),
  CONSTRAINT `mezzi_da_preparare_ibfk_1` FOREIGN KEY (`mezzo_idmezzo`) REFERENCES `mezzo` (`idmezzo`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mezzi_da_preparare`
--



--
-- Table structure for table `mezzo`
--

DROP TABLE IF EXISTS `mezzo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mezzo` (
  `idmezzo` int NOT NULL AUTO_INCREMENT,
  `targa` varchar(10) NOT NULL,
  `modello_idmodello` int NOT NULL,
  `motorizzazione` enum('Benzina','Disel','Elettrica') NOT NULL,
  `offerta` enum('Si','No') NOT NULL DEFAULT 'No',
  PRIMARY KEY (`idmezzo`),
  UNIQUE KEY `targa_UNIQUE` (`targa`),
  KEY `fk_mezzo_modello1_idx` (`modello_idmodello`),
  CONSTRAINT `fk_mezzo_modello1` FOREIGN KEY (`modello_idmodello`) REFERENCES `modello` (`idmodello`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mezzo`
--



--
-- Table structure for table `modello`
--

DROP TABLE IF EXISTS `modello`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modello` (
  `idmodello` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `num_posti` int NOT NULL,
  `foto` longblob,
  `dimensione` enum('Piccola','Media','Grande') DEFAULT NULL,
  `tipologia` enum('Auto','Furgone','Camion','Camper') NOT NULL DEFAULT 'Auto',
  `tariffa_base` decimal(6,2) NOT NULL,
  PRIMARY KEY (`idmodello`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modello`
--


--
-- Table structure for table `operatore`
--

DROP TABLE IF EXISTS `operatore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operatore` (
  `utente_idutente` int NOT NULL,
  `stazione_idstazione` int NOT NULL,
  PRIMARY KEY (`utente_idutente`),
  KEY `stazione_idstazione` (`stazione_idstazione`),
  CONSTRAINT `operatore_ibfk_1` FOREIGN KEY (`utente_idutente`) REFERENCES `utente` (`idutente`),
  CONSTRAINT `operatore_ibfk_2` FOREIGN KEY (`stazione_idstazione`) REFERENCES `stazione` (`idstazione`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operatore`
--

LOCK TABLES `operatore` WRITE;
/*!40000 ALTER TABLE `operatore` DISABLE KEYS */;
INSERT INTO `operatore` VALUES (6,1),(7,2);
/*!40000 ALTER TABLE `operatore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pren_acc`
--

DROP TABLE IF EXISTS `pren_acc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pren_acc` (
  `prenotazione_idprenotazione` int NOT NULL,
  `accessorio_idaccessorio` int NOT NULL,
  KEY `prenotazione_idprenotazione` (`prenotazione_idprenotazione`),
  KEY `accessorio_idaccessorio` (`accessorio_idaccessorio`),
  CONSTRAINT `pren_acc_ibfk_1` FOREIGN KEY (`prenotazione_idprenotazione`) REFERENCES `prenotazione` (`idprenotazione`),
  CONSTRAINT `pren_acc_ibfk_2` FOREIGN KEY (`accessorio_idaccessorio`) REFERENCES `accessorio` (`idaccessorio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pren_acc`
--



--
-- Table structure for table `prenotazione`
--

DROP TABLE IF EXISTS `prenotazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prenotazione` (
  `idprenotazione` int NOT NULL AUTO_INCREMENT,
  `data` datetime NOT NULL,
  `cliente_idcliente` int NOT NULL,
  `mezzo_idmezzo` int NOT NULL,
  `num_posti_occupati` int NOT NULL,
  `idstazione_partenza` int NOT NULL,
  `idstazione_arrivo` int NOT NULL,
  `localita_idlocalita` int NOT NULL,
  `dataInizio` datetime NOT NULL,
  `dataFine` datetime NOT NULL,
  `idproposta_condivisione` int NOT NULL,
  `costo_tot` decimal(6,2) NOT NULL,
  `pagamento_ok` tinyint NOT NULL DEFAULT '0',
  `prenotazionevalida` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`idprenotazione`),
  KEY `fk_prenotazione_cliente_idx` (`cliente_idcliente`),
  KEY `fk_prenotazione_mezzo1_idx` (`mezzo_idmezzo`),
  KEY `fk_prenotazione_stazione1_idx` (`idstazione_partenza`),
  KEY `fk_prenotazione_stazione2_idx` (`idstazione_arrivo`),
  KEY `fk_prenotazione_localita1_idx` (`localita_idlocalita`),
  CONSTRAINT `fk_prenotazione_cliente` FOREIGN KEY (`cliente_idcliente`) REFERENCES `cliente` (`utente_idutente`),
  CONSTRAINT `fk_prenotazione_localita1` FOREIGN KEY (`localita_idlocalita`) REFERENCES `localita` (`idlocalita`),
  CONSTRAINT `fk_prenotazione_mezzo1` FOREIGN KEY (`mezzo_idmezzo`) REFERENCES `mezzo` (`idmezzo`),
  CONSTRAINT `fk_prenotazione_stazione1` FOREIGN KEY (`idstazione_partenza`) REFERENCES `stazione` (`idstazione`),
  CONSTRAINT `fk_prenotazione_stazione2` FOREIGN KEY (`idstazione_arrivo`) REFERENCES `stazione` (`idstazione`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prenotazione`
--


--
-- Table structure for table `proposta_condivisione`
--

DROP TABLE IF EXISTS `proposta_condivisione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proposta_condivisione` (
  `idproposta_condivisione` int NOT NULL AUTO_INCREMENT,
  `data` datetime DEFAULT NULL,
  `cliente_idcliente` int NOT NULL,
  `mezzo_idmezzo` int NOT NULL,
  `num_posti_occupati` int DEFAULT NULL,
  `idstazione_partenza` int NOT NULL,
  `idstazione_arrivo` int NOT NULL,
  `localita_idlocalita` int NOT NULL,
  `dataInizio` datetime NOT NULL,
  `dataFine` datetime NOT NULL,
  `propostavalida` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`idproposta_condivisione`),
  KEY `fk_prenotazione_cliente_idx` (`cliente_idcliente`),
  KEY `fk_prenotazione_mezzo1_idx` (`mezzo_idmezzo`),
  KEY `fk_prenotazione_stazione1_idx` (`idstazione_partenza`),
  KEY `fk_prenotazione_stazione2_idx` (`idstazione_arrivo`),
  KEY `fk_prenotazione_localita1_idx` (`localita_idlocalita`),
  CONSTRAINT `proposta_condivisione_ibfk_1` FOREIGN KEY (`cliente_idcliente`) REFERENCES `cliente` (`utente_idutente`),
  CONSTRAINT `proposta_condivisione_ibfk_2` FOREIGN KEY (`localita_idlocalita`) REFERENCES `localita` (`idlocalita`),
  CONSTRAINT `proposta_condivisione_ibfk_3` FOREIGN KEY (`mezzo_idmezzo`) REFERENCES `mezzo` (`idmezzo`),
  CONSTRAINT `proposta_condivisione_ibfk_4` FOREIGN KEY (`idstazione_partenza`) REFERENCES `stazione` (`idstazione`),
  CONSTRAINT `proposta_condivisione_ibfk_5` FOREIGN KEY (`idstazione_arrivo`) REFERENCES `stazione` (`idstazione`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposta_condivisione`
--



--
-- Table structure for table `rich_acc`
--

DROP TABLE IF EXISTS `rich_acc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rich_acc` (
  `idrichiesta_condivisione` int NOT NULL,
  `idaccessorio` int NOT NULL,
  KEY `idrichiesta_condivisione` (`idrichiesta_condivisione`),
  KEY `idaccessorio` (`idaccessorio`),
  CONSTRAINT `rich_acc_ibfk_1` FOREIGN KEY (`idrichiesta_condivisione`) REFERENCES `richiesta_condivisione` (`idrichiesta_condivisione`),
  CONSTRAINT `rich_acc_ibfk_2` FOREIGN KEY (`idrichiesta_condivisione`) REFERENCES `richiesta_condivisione` (`idrichiesta_condivisione`),
  CONSTRAINT `rich_acc_ibfk_3` FOREIGN KEY (`idaccessorio`) REFERENCES `accessorio` (`idaccessorio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rich_acc`
--



--
-- Table structure for table `richiesta_condivisione`
--

DROP TABLE IF EXISTS `richiesta_condivisione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `richiesta_condivisione` (
  `idrichiesta_condivisione` int NOT NULL AUTO_INCREMENT,
  `data` datetime NOT NULL,
  `idproposta_condivisione` int NOT NULL,
  `cliente_idcliente` int NOT NULL,
  `posti_richiesti` int NOT NULL,
  `stato` enum('Accettata','Attesa','Rifiutata') NOT NULL DEFAULT 'Attesa',
  PRIMARY KEY (`idrichiesta_condivisione`),
  KEY `idproposta_condivisione` (`idproposta_condivisione`),
  KEY `cliente_idcliente` (`cliente_idcliente`),
  CONSTRAINT `richiesta_condivisione_ibfk_1` FOREIGN KEY (`idproposta_condivisione`) REFERENCES `proposta_condivisione` (`idproposta_condivisione`),
  CONSTRAINT `richiesta_condivisione_ibfk_2` FOREIGN KEY (`cliente_idcliente`) REFERENCES `cliente` (`utente_idutente`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `richiesta_condivisione`
--


--
-- Table structure for table `stazione`
--

DROP TABLE IF EXISTS `stazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stazione` (
  `idstazione` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `latitudine` double DEFAULT NULL,
  `longitudine` double DEFAULT NULL,
  `addetto_utente_idutente` int NOT NULL,
  PRIMARY KEY (`idstazione`),
  KEY `fk_stazione_addetto1_idx` (`addetto_utente_idutente`),
  CONSTRAINT `fk_stazione_addetto1` FOREIGN KEY (`addetto_utente_idutente`) REFERENCES `addetto` (`utente_idutente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stazione`
--

LOCK TABLES `stazione` WRITE;
/*!40000 ALTER TABLE `stazione` DISABLE KEYS */;
INSERT INTO `stazione` VALUES (1,'Brindisi Casale',40.6287,17.9376,1),(2,'Bergamo Orio al Serio',45.4773,9.1815,5);
/*!40000 ALTER TABLE `stazione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utente`
--

DROP TABLE IF EXISTS `utente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utente` (
  `idutente` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`idutente`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente`
--

LOCK TABLES `utente` WRITE;
/*!40000 ALTER TABLE `utente` DISABLE KEYS */;
INSERT INTO `utente` VALUES (1,'ciccio','ciccio123','gc.pps1920+4@gmail.com'),(3,'pino','pino123','DB'),(5,'tizio','tizio123','gc.pps1920+3@gmail.com'),(6,'caio','caio123','gc.pps1920+5@gmail.com'),(7,'rosa','rosa123','gc.pps1920+6@gmail.com');
/*!40000 ALTER TABLE `utente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-29 18:49:55
