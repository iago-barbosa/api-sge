CREATE DATABASE  IF NOT EXISTS `projeto_sge` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `projeto_sge`;
-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: localhost    Database: projeto_sge
-- ------------------------------------------------------
-- Server version	5.6.14

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
-- Table structure for table `alunos`
--

DROP TABLE IF EXISTS `alunos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alunos` (
  `id_alunos` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `sobrenome` varchar(100) NOT NULL,
  `cpf` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `alunoscol` varchar(45) NOT NULL,
  `imagem` text NOT NULL,
  PRIMARY KEY (`id_alunos`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alunos`
--

LOCK TABLES `alunos` WRITE;
/*!40000 ALTER TABLE `alunos` DISABLE KEYS */;
INSERT INTO `alunos` VALUES (1,'Carlos','Silva','12345678901','senha123','123456','url_da_imagem_1'),(2,'Maria','Santos','23456789012','senha456','234567','url_da_imagem_2'),(3,'João','Pereira','34567890123','senha789','345678','url_da_imagem_3');
/*!40000 ALTER TABLE `alunos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `descricao` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES (2,'matematica',''),(3,'portugues',''),(4,'geografia','');
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplina`
--

DROP TABLE IF EXISTS `disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disciplina` (
  `id_disciplina` int(11) NOT NULL AUTO_INCREMENT,
  `nome_disciplina` varchar(100) NOT NULL,
  `fk_id_area` int(11) NOT NULL,
  PRIMARY KEY (`id_disciplina`),
  KEY `fk_id_area_idx` (`fk_id_area`),
  CONSTRAINT `fk_id_area` FOREIGN KEY (`fk_id_area`) REFERENCES `area` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplina`
--

LOCK TABLES `disciplina` WRITE;
/*!40000 ALTER TABLE `disciplina` DISABLE KEYS */;
INSERT INTO `disciplina` VALUES (1,'Álgebra',2),(2,'Literatura',3),(3,'História',4);
/*!40000 ALTER TABLE `disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas`
--

DROP TABLE IF EXISTS `notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notas` (
  `id_notas` int(11) NOT NULL AUTO_INCREMENT,
  `nota` float NOT NULL,
  `fk_id_alunos` int(11) NOT NULL,
  `fk_id_disciplina` int(11) NOT NULL,
  PRIMARY KEY (`id_notas`),
  KEY `fk_id_alunos_idx` (`fk_id_alunos`),
  KEY `fk_id_disciplina_idx` (`fk_id_disciplina`),
  CONSTRAINT `fk_id_alunos` FOREIGN KEY (`fk_id_alunos`) REFERENCES `alunos` (`id_alunos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas`
--

LOCK TABLES `notas` WRITE;
/*!40000 ALTER TABLE `notas` DISABLE KEYS */;
INSERT INTO `notas` VALUES (1,8.5,1,1),(2,7,2,2),(3,9,3,3);
/*!40000 ALTER TABLE `notas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professor` (
  `id_professor` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `sobrenome` varchar(100) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `imagens` varchar(255) NOT NULL,
  PRIMARY KEY (`id_professor`),
  UNIQUE KEY `cpf_UNIQUE` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES (9,'vini','','1','12345678910',''),(14,'Robertinho Loko','','123','1','assets/Captura de tela 2024-09-12 152246.png'),(17,'troll','','123','1234','assets/download.png'),(18,'lasgosta','','123','12345','assets/lagosta.jpg'),(19,'Ana','Lima','senhaAna','98765432100','url_imagem_professor_1'),(20,'Pedro','Almeida','senhaPedro','87654321009','url_imagem_professor_2');
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor_disciplina`
--

DROP TABLE IF EXISTS `professor_disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professor_disciplina` (
  `fk_id_professor` int(11) NOT NULL,
  `fk_id_disciplina` int(11) NOT NULL,
  KEY `fk_id_professor_idx` (`fk_id_professor`),
  KEY `fk_id_disciplina_idx` (`fk_id_disciplina`),
  CONSTRAINT `fk_id_disciplina` FOREIGN KEY (`fk_id_disciplina`) REFERENCES `disciplina` (`id_disciplina`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_professor` FOREIGN KEY (`fk_id_professor`) REFERENCES `professor` (`id_professor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor_disciplina`
--

LOCK TABLES `professor_disciplina` WRITE;
/*!40000 ALTER TABLE `professor_disciplina` DISABLE KEYS */;
INSERT INTO `professor_disciplina` VALUES (20,1),(19,2),(18,3),(17,2),(14,1),(9,3);
/*!40000 ALTER TABLE `professor_disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarefa`
--

DROP TABLE IF EXISTS `tarefa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarefa` (
  `id_tarefa` int(11) NOT NULL AUTO_INCREMENT,
  `nome_tarefa` varchar(100) NOT NULL,
  `descricao` text NOT NULL,
  `data_entrega` date NOT NULL,
  `id_disciplina` int(11) NOT NULL,
  PRIMARY KEY (`id_tarefa`),
  KEY `id_disciplina_idx` (`id_disciplina`),
  CONSTRAINT `id_disciplina` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplina` (`id_disciplina`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarefa`
--

LOCK TABLES `tarefa` WRITE;
/*!40000 ALTER TABLE `tarefa` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarefa` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-07 17:37:59
