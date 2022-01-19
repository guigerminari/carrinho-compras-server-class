-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: carrinho_compras_bd
-- ------------------------------------------------------
-- Server version	5.7.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `order_buy`
--

DROP TABLE IF EXISTS `order_buy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_buy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `payment_form` varchar(100) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_buy`
--

LOCK TABLES `order_buy` WRITE;
/*!40000 ALTER TABLE `order_buy` DISABLE KEYS */;
INSERT INTO `order_buy` VALUES (85,NULL,'cash','2022-01-19 01:21:33'),(86,NULL,'credit','2022-01-19 01:35:32'),(87,NULL,'debit','2022-01-19 01:36:53'),(88,NULL,'credit','2022-01-19 01:50:05'),(89,NULL,'cash','2022-01-19 01:50:40'),(90,NULL,'credit','2022-01-19 01:51:17'),(91,NULL,'credit','2022-01-19 01:51:56'),(92,NULL,'cash','2022-01-19 01:55:54'),(93,NULL,'debit','2022-01-19 02:02:58'),(94,NULL,'debit','2022-01-19 02:13:58'),(95,NULL,'cash','2022-01-19 02:19:04'),(96,NULL,'credit','2022-01-19 02:23:43'),(97,NULL,'credit','2022-01-19 02:23:58'),(98,NULL,'credit','2022-01-19 02:24:14'),(99,NULL,'credit','2022-01-19 02:24:31'),(100,NULL,'cash','2022-01-19 02:24:39'),(101,NULL,'debit','2022-01-19 02:24:53'),(102,NULL,'credit','2022-01-19 02:41:50');
/*!40000 ALTER TABLE `order_buy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_products`
--

DROP TABLE IF EXISTS `order_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_products` (
  `id_product` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_product`,`id_order`),
  KEY `order_products_FK_1` (`id_order`),
  CONSTRAINT `order_products_FK` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`),
  CONSTRAINT `order_products_FK_1` FOREIGN KEY (`id_order`) REFERENCES `order_buy` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_products`
--

LOCK TABLES `order_products` WRITE;
/*!40000 ALTER TABLE `order_products` DISABLE KEYS */;
INSERT INTO `order_products` VALUES (1,85,1),(1,90,5),(1,94,1),(1,95,1),(1,96,1),(2,85,2),(2,89,1),(2,90,9),(3,85,1),(3,89,1),(3,90,4),(3,91,1),(3,92,1),(3,93,2),(3,94,1),(4,86,1),(4,90,2),(4,97,1),(4,100,1),(4,101,6),(5,87,1),(5,90,2),(5,98,2),(5,102,1),(6,88,1),(6,90,4),(6,91,1),(6,98,1),(6,99,1),(6,102,1);
/*!40000 ALTER TABLE `order_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `price` float DEFAULT '0',
  `image` varchar(250) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` text,
  `active` enum('y','n') NOT NULL DEFAULT 'y',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Tênis de Caminhada Leve Confortável',179.9,'https://rocketseat-cdn.s3-sa-east-1.amazonaws.com/modulo-redux/tenis1.jpg','2021-12-27 15:20:32',NULL,'y'),(2,'Tênis VR Caminhada Confortável Borracha',139.9,'https://rocketseat-cdn.s3-sa-east-1.amazonaws.com/modulo-redux/tenis2.jpg','2021-12-27 15:20:32',NULL,'y'),(3,'Tênis Adidas Duramo Lite 2.0',219.9,'https://rocketseat-cdn.s3-sa-east-1.amazonaws.com/modulo-redux/tenis3.jpg','2021-12-27 15:20:32',NULL,'y'),(4,'Tênis VR Caminhada Confortável Detalhes Couro Masculino',149.9,'https://rocketseat-cdn.s3-sa-east-1.amazonaws.com/modulo-redux/tenis2.jpg','2021-12-27 15:20:32',NULL,'y'),(5,'Tênis Adidas Duramo Lite 3.0',159.9,'https://rocketseat-cdn.s3-sa-east-1.amazonaws.com/modulo-redux/tenis3.jpg','2021-12-27 15:20:32',NULL,'y'),(6,'Tênis de Caminhada Profissional',329,'https://rocketseat-cdn.s3-sa-east-1.amazonaws.com/modulo-redux/tenis2.jpg','2021-12-27 15:20:32',NULL,'y');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `stock_FK` FOREIGN KEY (`id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,0),(2,0),(3,0),(4,0),(5,5),(6,2);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-18 23:49:32
