/*!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.8-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: demo
-- ------------------------------------------------------
-- Server version	11.6.2-MariaDB-ubu2404

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `user_detail`
--

DROP TABLE IF EXISTS `user_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `creation_time` datetime NOT NULL DEFAULT current_timestamp(),
  `modification_time` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_detail`
--

LOCK TABLES `user_detail` WRITE;
/*!40000 ALTER TABLE `user_detail` DISABLE KEYS */;
INSERT INTO `user_detail` VALUES
(2,'sagar',NULL,NULL,'2025-03-07 17:16:25','2025-03-07 17:16:25');
/*!40000 ALTER TABLE `user_detail` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_uca1400_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER trg_user_detail_audit_insert
AFTER INSERT ON demo.user_detail
FOR EACH ROW
BEGIN

        INSERT INTO demo.user_detail_audit_log 
        (operation_type, before_operation, after_operation, operation_datetime, user)
        VALUES 
        ('INSERT', NULL, 
            JSON_OBJECT(
                'user_id', NEW.id, 
                'name', NEW.name, 
                'email', NEW.email,
                'phone', NEW.phone,
                'creation_time', NEW.creation_time,
                'modification_time', NEW.modification_time
            ), 
            CURRENT_TIMESTAMP(), CURRENT_USER()
        );
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_uca1400_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER trg_user_detail_audit_update
AFTER UPDATE ON demo.user_detail
FOR EACH ROW
BEGIN
        INSERT INTO demo.user_detail_audit_log 
        (operation_type, before_operation, after_operation, operation_datetime, user)
        VALUES 
        ('UPDATE',  
            JSON_OBJECT(
                'user_id', OLD.id, 
                'name', OLD.name, 
                'email', OLD.email,
                'phone', OLD.phone,
                'creation_time', OLD.creation_time,
                'modification_time', OLD.modification_time
            ),
            JSON_OBJECT(
                'user_id', NEW.id, 
                'name', NEW.name, 
                'email', NEW.email,
                'phone', NEW.phone,
                'creation_time', NEW.creation_time,
                'modification_time', NEW.modification_time
            ),
            CURRENT_TIMESTAMP, CURRENT_USER()
        );
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_uca1400_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER trg_user_detail_audit_delete
AFTER DELETE ON demo.user_detail
FOR EACH ROW
BEGIN
        INSERT INTO demo.user_detail_audit_log 
        (operation_type, before_operation, after_operation, operation_datetime, user)
        VALUES 
        ('DELETE',  
            JSON_OBJECT(
                'user_id', OLD.id, 
                'name', OLD.name, 
                'email', OLD.email,
                'phone', OLD.phone,
                'creation_time', OLD.creation_time,
                'modification_time', OLD.modification_time
            ), 
            NULL,
            CURRENT_TIMESTAMP, CURRENT_USER()
        );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user_detail_audit_log`
--

DROP TABLE IF EXISTS `user_detail_audit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_detail_audit_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operation_type` varchar(100) NOT NULL,
  `before_operation` varchar(1000) DEFAULT NULL,
  `after_operation` varchar(1000) DEFAULT NULL,
  `operation_datetime` datetime NOT NULL DEFAULT current_timestamp(),
  `user` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_detail_audit_log`
--

LOCK TABLES `user_detail_audit_log` WRITE;
/*!40000 ALTER TABLE `user_detail_audit_log` DISABLE KEYS */;
INSERT INTO `user_detail_audit_log` VALUES
(1,'INSERT',NULL,'{\"user_id\": 1, \"name\": \"sagar\", \"email\": null, \"phone\": null, \"creation_time\": \"2025-03-07 17:12:43\", \"modification_time\": \"2025-03-07 17:12:43\"}','2025-03-07 17:12:43','root@%'),
(2,'UPDATE','{\"user_id\": 1, \"name\": \"sagar\", \"email\": null, \"phone\": null, \"creation_time\": \"2025-03-07 17:12:43\", \"modification_time\": \"2025-03-07 17:12:43\"}','{\"user_id\": 1, \"name\": \"sagarr\", \"email\": null, \"phone\": null, \"creation_time\": \"2025-03-07 17:14:20\", \"modification_time\": \"2025-03-07 17:14:20\"}','2025-03-07 17:14:20','root@%'),
(3,'DELETE','{\"user_id\": 1, \"name\": \"sagarr\", \"email\": null, \"phone\": null, \"creation_time\": \"2025-03-07 17:14:20\", \"modification_time\": \"2025-03-07 17:14:20\"}',NULL,'2025-03-07 17:15:15','root@%'),
(4,'INSERT',NULL,'{\"user_id\": 2, \"name\": \"sagar\", \"email\": null, \"phone\": null, \"creation_time\": \"2025-03-07 17:16:25\", \"modification_time\": \"2025-03-07 17:16:25\"}','2025-03-07 17:16:25','root@%');
/*!40000 ALTER TABLE `user_detail_audit_log` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-07 23:25:17
