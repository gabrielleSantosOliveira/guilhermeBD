-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: outrofaithsec
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `chamada`
--

DROP TABLE IF EXISTS `chamada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chamada` (
  `idChamada` int NOT NULL AUTO_INCREMENT,
  `responsavel` varchar(45) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `criticidade` varchar(45) DEFAULT NULL,
  `inicio` time DEFAULT NULL,
  `termino` time DEFAULT NULL,
  `cpf_paciente` varchar(45) DEFAULT NULL,
  `nfc_enfermeiro` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`idChamada`),
  KEY `fk_cpf_paciente` (`cpf_paciente`),
  KEY `fk_nfc_enfermeiro` (`nfc_enfermeiro`),
  CONSTRAINT `fk_cpf_paciente` FOREIGN KEY (`cpf_paciente`) REFERENCES `paciente` (`cpf`) ON DELETE CASCADE,
  CONSTRAINT `fk_nfc_enfermeiro` FOREIGN KEY (`nfc_enfermeiro`) REFERENCES `enfermeiro` (`nfc`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chamada`
--

LOCK TABLES `chamada` WRITE;
/*!40000 ALTER TABLE `chamada` DISABLE KEYS */;
INSERT INTO `chamada` VALUES (2,'TesteEnfermeiro','2025-01-29','Normal','10:00:00','10:30:00','12345678990','ABC123'),(3,'E387322A','2025-01-29','Normal','12:00:00','12:00:00','12345678990','E387322A'),(4,'E387322A','2025-01-29','Normal','12:00:00','12:30:00','12345678990','E387322A'),(5,'E387322A','2025-01-29','Normal','12:00:00','12:30:00','12345678990','E387322A'),(7,'E387322A','2025-01-29','Normal','12:00:00','12:30:00','12345678990','E387322A'),(8,'E387322A','2025-01-29','Normal','12:00:00','12:30:00','12345678990','E387322A'),(9,'E387322A','2025-01-29','Normal','12:00:00','12:30:00','12345678990','E387322A'),(10,'E387322A','2025-01-29','Normal','12:00:00','12:30:00','12345678990','E387322A'),(12,'E387322A','2025-01-29','Normal','21:24:25','21:24:32','12345678990','E387322A'),(13,'E387322A','2025-01-29','Normal','21:25:35','21:25:38','12345678990','E387322A'),(16,'E387322A','2025-01-29','Normal','21:39:07','21:43:01','12345678990','E387322A'),(17,'636C0D2A','2025-01-29','Normal','21:45:51','21:45:51','12345678990','636C0D2A'),(18,'E387322A','2025-02-01','Normal','17:00:56','17:00:58','12345678990','E387322A'),(19,'636C0D2A','2025-02-01','Normal','17:08:40','17:08:43','12345678990','636C0D2A'),(20,'E387322A','2025-02-01','Normal','17:14:25','17:14:37','12345678990','E387322A'),(21,'E387322A','2025-02-03','Normal','18:40:53','18:40:55','12345678990','E387322A'),(22,'636C0D2A','2025-02-03','Normal','18:41:49','18:41:55','12345678990','636C0D2A');
/*!40000 ALTER TABLE `chamada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enfermeiro`
--

DROP TABLE IF EXISTS `enfermeiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enfermeiro` (
  `nfc` varchar(30) NOT NULL,
  `telefone1` varchar(20) DEFAULT NULL,
  `telefone2` varchar(20) DEFAULT NULL,
  `qtdAtend` int DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `senha` varchar(20) DEFAULT NULL,
  `dataNasc` date DEFAULT NULL,
  `cargo` varchar(45) DEFAULT NULL,
  `cpf` varchar(20) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `estadoCracha` enum('habilitado','desabilitado') NOT NULL DEFAULT 'habilitado',
  `ala` enum('UTI','Internação Geral','nenhum') NOT NULL DEFAULT 'nenhum',
  PRIMARY KEY (`nfc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enfermeiro`
--

LOCK TABLES `enfermeiro` WRITE;
/*!40000 ALTER TABLE `enfermeiro` DISABLE KEYS */;
INSERT INTO `enfermeiro` VALUES ('636C0D2A','(11) 98995-9921','(11) 97654-0000',2,'Lucas Yuri','senhaSegura123','1993-09-30','Enfermeiro','12345678922','Av. Paulista, 1000 - São Paulo, SP','desabilitado','nenhum'),('ABC123',NULL,NULL,NULL,'Enfermeiro Teste',NULL,NULL,'Enfermeiro','98765432100',NULL,'desabilitado','nenhum'),('E387322A','(11) 98765-4321','(11) 97654-3210',15,'Carlos Almeida','senhaSegura123','1990-03-25','Enfermeiro Chefe','12345678900','Av. Paulista, 1000 - São Paulo, SP','habilitado','nenhum'),('NFC123456','(11) 98765-4321','(11) 91234-5678',0,'Maria Silva Santos','senha123','1990-05-15','Enfermeira Sênior','123.456.789-00','Rua das Flores, 123 - Jardim Primavera, São Paulo - SP','habilitado','UTI');
/*!40000 ALTER TABLE `enfermeiro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente` (
  `nome` varchar(100) DEFAULT NULL,
  `datNasc` date DEFAULT NULL,
  `rg` char(9) DEFAULT NULL,
  `nmrCertidao` varchar(32) DEFAULT NULL,
  `telefone1` varchar(17) DEFAULT NULL,
  `telefone2` varchar(17) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `procedencia` varchar(100) DEFAULT NULL,
  `pessoaRespon` varchar(100) DEFAULT NULL,
  `profissao` varchar(50) DEFAULT NULL,
  `conjuge` varchar(100) DEFAULT NULL,
  `nomeMae` varchar(100) DEFAULT NULL,
  `nomePai` varchar(100) DEFAULT NULL,
  `estadoCivil` varchar(30) DEFAULT NULL,
  `cor` varchar(45) DEFAULT NULL,
  `sexo` varchar(45) DEFAULT NULL,
  `cpf` varchar(45) NOT NULL,
  PRIMARY KEY (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES ('João Silva','1985-06-15','123456789','12345678901234567890123456789012','(11) 91234-5678','(11) 92345-6789','Rua das Flores, 123 - São Paulo, SP','Hospital Central','Maria Oliveira','Engenheiro','Ana Souza','Maria Silva','Carlos Souza','Casado','Branco','Masculino','12345678900'),('Paciente Teste','1990-01-01','123456789',NULL,'1234567890',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12345678990');
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prontuario`
--

DROP TABLE IF EXISTS `prontuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prontuario` (
  `idProntuario` int NOT NULL,
  `nomeCompleto` varchar(100) DEFAULT NULL,
  `comorbidades` varchar(45) DEFAULT NULL,
  `alergia` varchar(45) DEFAULT NULL,
  `medicaAtuais` varchar(45) DEFAULT NULL,
  `tipoSanguineo` varchar(20) DEFAULT NULL,
  `peso` varchar(10) DEFAULT NULL,
  `idade` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idProntuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prontuario`
--

LOCK TABLES `prontuario` WRITE;
/*!40000 ALTER TABLE `prontuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `prontuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-04  8:21:43
