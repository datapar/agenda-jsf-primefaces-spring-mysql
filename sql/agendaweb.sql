-- MySQL dump 10.13  Distrib 5.6.16, for Win64 (x86_64)
-- Fazer backup
-- mysqldump -uroot -p1234 academia > academia.sql

-- Restaurar
-- mysql -uroot -p1234 academia --routines < academia.sql

--
-- Host: localhost    Database: agendaweb
-- ------------------------------------------------------
-- Server version	5.6.16

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
-- Table structure for table `authority`
--

DROP TABLE IF EXISTS `authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authority` (
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authority`
--

LOCK TABLES `authority` WRITE;
/*!40000 ALTER TABLE `authority` DISABLE KEYS */;
INSERT INTO `authority` VALUES ('ROLE_USER');
/*!40000 ALTER TABLE `authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tab_agenda`
--

DROP TABLE IF EXISTS `tab_agenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tab_agenda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dataFim` datetime DEFAULT NULL,
  `dataInicio` datetime DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `diaTodo` bit(1) NOT NULL,
  `tipoAgenda` int(11) DEFAULT NULL,
  `evento_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_4pjmbtj49h5ry0d7pmru778hp` (`evento_id`),
  CONSTRAINT `FK_4pjmbtj49h5ry0d7pmru778hp` FOREIGN KEY (`evento_id`) REFERENCES `tab_evento` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tab_agenda`
--

LOCK TABLES `tab_agenda` WRITE;
/*!40000 ALTER TABLE `tab_agenda` DISABLE KEYS */;
INSERT INTO `tab_agenda` VALUES (1,'2014-07-13 20:00:00','2014-07-13 20:00:00','Aniversário do Joni','\0',0,1),(2,'2014-07-14 20:00:00','2014-07-14 20:00:00','Reunião','\0',1,2);
/*!40000 ALTER TABLE `tab_agenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tab_contato`
--

DROP TABLE IF EXISTS `tab_contato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tab_contato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dataCadastro` date DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `info` longtext,
  `nome` varchar(100) DEFAULT NULL,
  `sexo` int(11) NOT NULL,
  `situacao` int(2) DEFAULT '0',
  `telefone` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tab_contato`
--

LOCK TABLES `tab_contato` WRITE;
/*!40000 ALTER TABLE `tab_contato` DISABLE KEYS */;
INSERT INTO `tab_contato` VALUES (1,'2014-07-07','lyndon@gmail.com',NULL,'','Lyndon Tavares',0,-1,'9999.6565'),(2,'2014-07-07','daniel@gmail.com',NULL,'','Daniel Alencar',0,0,'9090.009'),(3,'2014-07-07','cassio@gmail.com',NULL,'','Willian Cássio',0,1,'9898.0909'),(4,'2014-07-07','email@gmail.com',NULL,'','Contato 4',0,0,'9090.0909'),(5,'2014-07-08','w@gmail.com',NULL,'','2w',0,0,'2w'),(6,'2014-07-08','er@gmail.com',NULL,'','er',0,0,'er'),(7,'2014-07-08','qwe@gmail.com',NULL,'','qwe',0,0,'qwe');
/*!40000 ALTER TABLE `tab_contato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tab_evento`
--

DROP TABLE IF EXISTS `tab_evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tab_evento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dataInicio` datetime NOT NULL,
  `dataTermino` datetime DEFAULT NULL,
  `info` varchar(100) DEFAULT NULL,
  `nome` varchar(200) DEFAULT NULL,
  `situacao` int(11) DEFAULT '0',
  `valor` decimal(19,2) DEFAULT NULL,
  `contato_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_8y95m9hhvcymey2s2aqk8uj1v` (`contato_id`),
  CONSTRAINT `FK_8y95m9hhvcymey2s2aqk8uj1v` FOREIGN KEY (`contato_id`) REFERENCES `tab_contato` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tab_evento`
--

LOCK TABLES `tab_evento` WRITE;
/*!40000 ALTER TABLE `tab_evento` DISABLE KEYS */;
INSERT INTO `tab_evento` VALUES (1,'2014-07-07 00:00:00',NULL,'','Evento 1',1,10000.00,1),(2,'2014-07-07 00:00:00',NULL,'','Evento 2',2,10000.00,2),(3,'2014-07-07 00:00:00',NULL,'','Evento 3',0,30000.00,3),(4,'2014-07-07 00:00:00',NULL,'','evento 4',0,20000.00,2);
/*!40000 ALTER TABLE `tab_evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tab_evento_tab_pagamento`
--

DROP TABLE IF EXISTS `tab_evento_tab_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tab_evento_tab_pagamento` (
  `tab_evento_id` int(11) NOT NULL,
  `pagamentos_id` int(11) NOT NULL,
  UNIQUE KEY `UK_gl13o29oy07v37ne653u2lay4` (`pagamentos_id`),
  KEY `FK_crlxrl9pwe9po45aig5jgqbp1` (`tab_evento_id`),
  CONSTRAINT `FK_crlxrl9pwe9po45aig5jgqbp1` FOREIGN KEY (`tab_evento_id`) REFERENCES `tab_evento` (`id`),
  CONSTRAINT `FK_gl13o29oy07v37ne653u2lay4` FOREIGN KEY (`pagamentos_id`) REFERENCES `tab_pagamento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tab_evento_tab_pagamento`
--

LOCK TABLES `tab_evento_tab_pagamento` WRITE;
/*!40000 ALTER TABLE `tab_evento_tab_pagamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `tab_evento_tab_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tab_funcionalidade`
--

DROP TABLE IF EXISTS `tab_funcionalidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tab_funcionalidade` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tab_funcionalidade`
--

LOCK TABLES `tab_funcionalidade` WRITE;
/*!40000 ALTER TABLE `tab_funcionalidade` DISABLE KEYS */;
INSERT INTO `tab_funcionalidade` VALUES (1,'Incluir Contato'),(2,'Editar Contato'),(3,'Confirmar Contato'),(4,'Cancelar Contato'),(5,'Expurgar Contatos Cancelado'),(6,'Incluir Evento'),(7,'Editar Evento'),(8,'Confirmar Evento'),(9,'Realizar Evento'),(10,'Cancelar Evento'),(11,'Expurgar Evento Cancelado'),(12,'Quitar Evento'),(13,'Gerar Parcela Evento'),(14,'Incluir Parcela Evento'),(15,'Editar Parcela Evento'),(16,'Quitar Parcela Evento'),(17,'Cancelar Parcela Evento'),(18,'Expugar Parcela Evento'),(19,'Tipo Contato Incluir'),(20,'Tipo Contato Editar'),(21,'Tipo Contato Ativar'),(22,'Tipo Contato Inativar'),(23,'Tipo Contato Cancelar'),(24,'Tipo Contato Expurgar'),(25,'Usuario Incluir'),(26,'Usuario Editar'),(27,'Usuario Ativar'),(28,'Usuario Inativar'),(29,'Usuario Cancelar'),(30,'Usuario Expurgar');
/*!40000 ALTER TABLE `tab_funcionalidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tab_pagamento`
--

DROP TABLE IF EXISTS `tab_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tab_pagamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dataPagamento` date DEFAULT NULL,
  `dataVencimento` date DEFAULT NULL,
  `info` longtext,
  `nome` varchar(100) DEFAULT NULL,
  `situacao` int(11) DEFAULT '0',
  `valor` decimal(10,2) DEFAULT '0.00',
  `evento_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_7noh8s9hu3ck7541r04g9ln5f` (`evento_id`),
  CONSTRAINT `FK_7noh8s9hu3ck7541r04g9ln5f` FOREIGN KEY (`evento_id`) REFERENCES `tab_evento` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tab_pagamento`
--

LOCK TABLES `tab_pagamento` WRITE;
/*!40000 ALTER TABLE `tab_pagamento` DISABLE KEYS */;
INSERT INTO `tab_pagamento` VALUES (1,NULL,'2014-07-07','Parcela - 1/10','Parcela - 1/10',0,1000.00,1),(2,NULL,'2014-08-06','Parcela - 2/10','Parcela - 2/10',0,1000.00,1),(3,NULL,'2014-09-05','Parcela - 3/10','Parcela - 3/10',0,1000.00,1),(4,NULL,'2014-10-05','Parcela - 4/10','Parcela - 4/10',0,1000.00,1),(5,NULL,'2014-11-04','Parcela - 5/10','Parcela - 5/10',0,1000.00,1),(6,NULL,'2014-12-04','Parcela - 6/10','Parcela - 6/10',1,1000.00,1),(7,NULL,'2015-01-03','Parcela - 7/10','Parcela - 7/10',0,1000.00,1),(8,NULL,'2015-02-02','Parcela - 8/10','Parcela - 8/10',0,1000.00,1),(9,NULL,'2015-03-04','Parcela - 9/10','Parcela - 9/10',0,1000.00,1),(10,NULL,'2015-04-03','Parcela - 10/10','Parcela - 10/10',0,1000.00,1),(11,NULL,'2014-07-07','Parcela - 1/10','Parcela - 1/10',0,1000.00,2),(12,NULL,'2014-08-06','Parcela - 2/10','Parcela - 2/10',0,1000.00,2),(13,NULL,'2014-09-05','Parcela - 3/10','Parcela - 3/10',0,1000.00,2),(14,NULL,'2014-10-05','Parcela - 4/10','Parcela - 4/10',0,1000.00,2),(15,NULL,'2014-11-04','Parcela - 5/10','Parcela - 5/10',0,1000.00,2),(16,NULL,'2014-12-04','Parcela - 6/10','Parcela - 6/10',0,1000.00,2),(17,NULL,'2015-01-03','Parcela - 7/10','Parcela - 7/10',0,1000.00,2),(18,NULL,'2015-02-02','Parcela - 8/10','Parcela - 8/10',0,1000.00,2),(19,NULL,'2015-03-04','Parcela - 9/10','Parcela - 9/10',0,1000.00,2),(20,NULL,'2015-04-03','Parcela - 10/10','Parcela - 10/10',0,1000.00,2),(21,NULL,'2014-07-07','Parcela - 1/10','Parcela - 1/10',0,3000.00,3),(22,NULL,'2014-08-06','Parcela - 2/10','Parcela - 2/10',0,3000.00,3),(23,NULL,'2014-09-05','Parcela - 3/10','Parcela - 3/10',0,3000.00,3),(24,NULL,'2014-10-05','Parcela - 4/10','Parcela - 4/10',0,3000.00,3),(25,NULL,'2014-11-04','Parcela - 5/10','Parcela - 5/10',0,3000.00,3),(26,NULL,'2014-12-04','Parcela - 6/10','Parcela - 6/10',0,3000.00,3),(27,NULL,'2015-01-03','Parcela - 7/10','Parcela - 7/10',0,3000.00,3),(28,NULL,'2015-02-02','Parcela - 8/10','Parcela - 8/10',0,3000.00,3),(29,NULL,'2015-03-04','Parcela - 9/10','Parcela - 9/10',0,3000.00,3),(30,NULL,'2015-04-03','Parcela - 10/10','Parcela - 10/10',0,3000.00,3),(31,NULL,'2014-07-07','Parcela - 1/10','Parcela - 1/10',0,1000.00,1),(32,NULL,'2014-08-06','Parcela - 2/10','Parcela - 2/10',0,1000.00,1),(33,NULL,'2014-09-05','Parcela - 3/10','Parcela - 3/10',0,1000.00,1),(34,NULL,'2014-10-05','Parcela - 4/10','Parcela - 4/10',0,1000.00,1),(35,NULL,'2014-11-04','Parcela - 5/10','Parcela - 5/10',0,1000.00,1),(36,NULL,'2014-12-04','Parcela - 6/10','Parcela - 6/10',0,1000.00,1),(37,NULL,'2015-01-03','Parcela - 7/10','Parcela - 7/10',0,1000.00,1),(38,NULL,'2015-02-02','Parcela - 8/10','Parcela - 8/10',0,1000.00,1),(39,NULL,'2015-03-04','Parcela - 9/10','Parcela - 9/10',0,1000.00,1),(40,NULL,'2015-04-03','Parcela - 10/10','Parcela - 10/10',0,1000.00,1),(41,NULL,'2014-07-07','Parcela - 1/10','Parcela - 1/10',0,1000.00,2),(42,NULL,'2014-08-06','Parcela - 2/10','Parcela - 2/10',0,1000.00,2),(43,NULL,'2014-09-05','Parcela - 3/10','Parcela - 3/10',0,1000.00,2),(44,NULL,'2014-10-05','Parcela - 4/10','Parcela - 4/10',0,1000.00,2),(45,NULL,'2014-11-04','Parcela - 5/10','Parcela - 5/10',0,1000.00,2),(46,NULL,'2014-12-04','Parcela - 6/10','Parcela - 6/10',0,1000.00,2),(47,NULL,'2015-01-03','Parcela - 7/10','Parcela - 7/10',0,1000.00,2),(48,NULL,'2015-02-02','Parcela - 8/10','Parcela - 8/10',0,1000.00,2),(49,NULL,'2015-03-04','Parcela - 9/10','Parcela - 9/10',0,1000.00,2),(50,NULL,'2015-04-03','Parcela - 10/10','Parcela - 10/10',0,1000.00,2),(51,NULL,'2014-07-07','Parcela - 1/10','Parcela - 1/10',0,3000.00,3),(52,NULL,'2014-08-06','Parcela - 2/10','Parcela - 2/10',0,3000.00,3),(53,NULL,'2014-09-05','Parcela - 3/10','Parcela - 3/10',0,3000.00,3),(54,NULL,'2014-10-05','Parcela - 4/10','Parcela - 4/10',0,3000.00,3),(55,NULL,'2014-11-04','Parcela - 5/10','Parcela - 5/10',0,3000.00,3),(56,NULL,'2014-12-04','Parcela - 6/10','Parcela - 6/10',0,3000.00,3),(57,NULL,'2015-01-03','Parcela - 7/10','Parcela - 7/10',0,3000.00,3),(58,NULL,'2015-02-02','Parcela - 8/10','Parcela - 8/10',0,3000.00,3),(59,NULL,'2015-03-04','Parcela - 9/10','Parcela - 9/10',0,3000.00,3),(60,NULL,'2015-04-03','Parcela - 10/10','Parcela - 10/10',0,3000.00,3),(61,NULL,'2014-07-07','Parcela - 1/10','Parcela - 1/10',0,2000.00,4),(62,NULL,'2014-08-31','Parcela - 2/10','Parcela - 2/10',0,2000.00,4),(63,NULL,'2014-10-01','Parcela - 3/10','Parcela - 3/10',0,2000.00,4),(64,NULL,'2014-12-01','Parcela - 4/10','Parcela - 4/10',0,2000.00,4),(65,NULL,'2015-01-31','Parcela - 5/10','Parcela - 5/10',0,2000.00,4),(66,NULL,'2015-03-03','Parcela - 6/10','Parcela - 6/10',0,2000.00,4),(67,NULL,'2015-05-01','Parcela - 7/10','Parcela - 7/10',0,2000.00,4),(68,NULL,'2015-07-01','Parcela - 8/10','Parcela - 8/10',0,2000.00,4),(69,NULL,'2015-08-31','Parcela - 9/10','Parcela - 9/10',0,2000.00,4),(70,NULL,'2015-10-01','Parcela - 10/10','Parcela - 10/10',0,2000.00,4);
/*!40000 ALTER TABLE `tab_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tab_permissao`
--

DROP TABLE IF EXISTS `tab_permissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tab_permissao` (
  `user_id` varchar(40) NOT NULL,
  `funcionalidade_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`funcionalidade_id`),
  KEY `FK_e51sus6tft6q0a03y9k7rnonp` (`funcionalidade_id`),
  CONSTRAINT `FK_e51sus6tft6q0a03y9k7rnonp` FOREIGN KEY (`funcionalidade_id`) REFERENCES `tab_funcionalidade` (`id`),
  CONSTRAINT `FK_a0ixxqbvl8vjswnti1lssmaxu` FOREIGN KEY (`user_id`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tab_permissao`
--

LOCK TABLES `tab_permissao` WRITE;
/*!40000 ALTER TABLE `tab_permissao` DISABLE KEYS */;
INSERT INTO `tab_permissao` VALUES ('123',1),('123',2),('123',3),('123',4),('123',5),('123',6),('123',7),('123',8),('123',9),('123',10),('123',11),('123',12),('123',13),('123',14),('123',15),('123',16),('123',17),('123',18),('123',19),('123',20),('123',21),('123',22),('123',23),('123',24),('123',25),('123',26),('123',27),('123',28),('123',29),('123',30);
/*!40000 ALTER TABLE `tab_permissao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tab_tipo_contato`
--

DROP TABLE IF EXISTS `tab_tipo_contato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tab_tipo_contato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tab_tipo_contato`
--

LOCK TABLES `tab_tipo_contato` WRITE;
/*!40000 ALTER TABLE `tab_tipo_contato` DISABLE KEYS */;
/*!40000 ALTER TABLE `tab_tipo_contato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `username` varchar(40) NOT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('123',1,'123');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_auth`
--

DROP TABLE IF EXISTS `user_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_auth` (
  `USER_Username` varchar(40) NOT NULL,
  `AUTH_authority` varchar(255) NOT NULL,
  KEY `FK_hwsoo8ndjbusrvfh4y8n9g802` (`AUTH_authority`),
  KEY `FK_615gg6dwlq6cao0b0n3sb504a` (`USER_Username`),
  CONSTRAINT `FK_615gg6dwlq6cao0b0n3sb504a` FOREIGN KEY (`USER_Username`) REFERENCES `user` (`username`),
  CONSTRAINT `FK_hwsoo8ndjbusrvfh4y8n9g802` FOREIGN KEY (`AUTH_authority`) REFERENCES `authority` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_auth`
--

LOCK TABLES `user_auth` WRITE;
/*!40000 ALTER TABLE `user_auth` DISABLE KEYS */;
INSERT INTO `user_auth` VALUES ('123','ROLE_USER');
/*!40000 ALTER TABLE `user_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'agendaweb'
--
/*!50003 DROP PROCEDURE IF EXISTS `contato_cancelar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `contato_cancelar`(in user int, in i_id int, inout msg varchar(100) )
BEGIN  DECLARE pode_cancelar INT;  DECLARE situacao_contato INT;  SET pode_cancelar = 0;  START TRANSACTION;  -- pode cancelar?  SELECT COUNT(*)  INTO pode_cancelar  FROM tab_permissao  WHERE user_id = user and funcionalidade_id=4;  if pode_cancelar = 0 then     set msg = concat(concat('usuário: ',user),' não tem tem permissao para cancelar aluno');  else      select situacao into situacao_contato from tab_contato where id = i_id;      if situacao_contato = 0 then         update tab_contato set situacao = -1 where id = i_id;         set msg = 'Contato cancelado com sucesso';      else         set msg = 'Contato não pode ser cancelado';      end if;  end if;  COMMIT;END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-07-09 10:45:41
