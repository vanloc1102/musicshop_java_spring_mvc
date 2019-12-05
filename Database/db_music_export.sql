-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: db_musicshop
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `acc_role_relationship`
--

DROP TABLE IF EXISTS `acc_role_relationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `acc_role_relationship` (
  `acc_id` int(11) NOT NULL,
  `acc_role_id` int(11) NOT NULL,
  KEY `FKsg4ai4lpnrnkamw2oqour5xha` (`acc_role_id`),
  KEY `FKnx5qy8hfguywr0qcniarcs1fu` (`acc_id`),
  CONSTRAINT `FKnx5qy8hfguywr0qcniarcs1fu` FOREIGN KEY (`acc_id`) REFERENCES `account` (`id`),
  CONSTRAINT `FKsg4ai4lpnrnkamw2oqour5xha` FOREIGN KEY (`acc_role_id`) REFERENCES `account_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_role_relationship`
--

LOCK TABLES `acc_role_relationship` WRITE;
/*!40000 ALTER TABLE `acc_role_relationship` DISABLE KEYS */;
INSERT INTO `acc_role_relationship` VALUES (1,1),(2,2),(3,2),(12,7);
/*!40000 ALTER TABLE `acc_role_relationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isEnabled` bit(1) DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `passwordConfirm` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,_binary '','123456','admin',NULL),(2,_binary '','123456','user01',NULL),(3,_binary '\0','123456','user02',NULL),(12,_binary '','123456','user03',NULL);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_role`
--

DROP TABLE IF EXISTS `account_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `account_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_role`
--

LOCK TABLES `account_role` WRITE;
/*!40000 ALTER TABLE `account_role` DISABLE KEYS */;
INSERT INTO `account_role` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_USER'),(7,'ROLE_USER');
/*!40000 ALTER TABLE `account_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banner`
--

DROP TABLE IF EXISTS `banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `banner` (
  `bannerID` int(11) NOT NULL AUTO_INCREMENT,
  `bannerContent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `bannerDir` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `bannerName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `bannerTitle` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `bannerURL` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`bannerID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner`
--

LOCK TABLES `banner` WRITE;
/*!40000 ALTER TABLE `banner` DISABLE KEYS */;
INSERT INTO `banner` VALUES (1,'But that drummer – the one who could make his drum sound like water dropping into a bucket or like the footfalls of a giant or like rain scattering on a roof – he was the one to watch. He was the one who could make you forget yourself.','/resources/img/hero-bg-3.jpg',NULL,'Shannon L. Alder','/filter/category=Drums & Percussion'),(2,'Sometimes I feel like a melody doesn’t have anything to do with me, but it’s just something that comes, is accumulated from me playing on the piano, and then this little creature just appears. ','/resources/img/hero-bg.jpg',NULL,'Agnes Obel','/filter/category=Piano'),(3,'A guitar is a very personal extension of the person playing it. You have to be emotionally and spiritually connected to your instrument. I\'m very brutal on my instruments, but not all the time. ','/resources/img/hero-bg-2.jpg',NULL,'Eddie Van Halen','/filter/category=Guitar');
/*!40000 ALTER TABLE `banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `brand` (
  `brandID` int(11) NOT NULL AUTO_INCREMENT,
  `brandName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`brandID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'Kawai'),(2,'Boston'),(3,'Casio'),(4,'Roland'),(5,'Takamine'),(6,'Suzuki'),(7,'Fender'),(8,'Taylor'),(9,'Pearl'),(10,'SoundKing');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `category` (
  `categoryID` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`categoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Drums & Percussion'),(2,'Piano'),(3,'Guitar');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `confirmationtoken`
--

DROP TABLE IF EXISTS `confirmationtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `confirmationtoken` (
  `token_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `confirmation_token` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `username` int(11) NOT NULL,
  PRIMARY KEY (`token_id`),
  KEY `FK3h7iqkkcbl45r3poaycbho52b` (`username`),
  CONSTRAINT `FK3h7iqkkcbl45r3poaycbho52b` FOREIGN KEY (`username`) REFERENCES `customer` (`customerID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `confirmationtoken`
--

LOCK TABLES `confirmationtoken` WRITE;
/*!40000 ALTER TABLE `confirmationtoken` DISABLE KEYS */;
INSERT INTO `confirmationtoken` VALUES (5,'aba7166f-787e-4646-8c11-3d99b9615229','2019-11-26 09:19:06',8);
/*!40000 ALTER TABLE `confirmationtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer` (
  `customerID` int(11) NOT NULL AUTO_INCREMENT,
  `customerImg` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `firstName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `lastName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `accountID` int(11) DEFAULT NULL,
  PRIMARY KEY (`customerID`),
  KEY `FKhwdpask1hp64bt6ap9bm7g9n3` (`accountID`),
  CONSTRAINT `FKhwdpask1hp64bt6ap9bm7g9n3` FOREIGN KEY (`accountID`) REFERENCES `account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,NULL,'','Loc','Nguyen Van',1),(2,'avatar1.jpg','nguyenvanlocmmo@gmail.com','Loc','Nguyen Van',2),(3,NULL,'','Loc','Nguyen Van',3),(8,'avatar.jpg','nguyenloc2202@gmail.com','nguyen van ','loc',12),(9,NULL,'nguyenvanlocmmo@gmail.com','Loc','Nguyen Van',NULL);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerprofile`
--

DROP TABLE IF EXISTS `customerprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customerprofile` (
  `customerProfileID` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `firstName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `lastName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `zip` int(11) DEFAULT NULL,
  PRIMARY KEY (`customerProfileID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerprofile`
--

LOCK TABLES `customerprofile` WRITE;
/*!40000 ALTER TABLE `customerprofile` DISABLE KEYS */;
INSERT INTO `customerprofile` VALUES (1,'USA','Loc','Nguyen Van',123456,'Leningradsky prospect 80',70000),(2,'RUSSIA','Loc','Nguyen Van',123456,'Leningradsky prospect 95',70000),(3,'ENG','Loc','Nguyen Van',123456,'Leningradsky prospect 80',70000);
/*!40000 ALTER TABLE `customerprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `image` (
  `imageID` int(11) NOT NULL AUTO_INCREMENT,
  `imageURL` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `productID` int(11) DEFAULT NULL,
  PRIMARY KEY (`imageID`),
  KEY `FKi08mytk70mxol364rr43kcpy3` (`productID`),
  CONSTRAINT `FKi08mytk70mxol364rr43kcpy3` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,'/resources/img/kawai-nd-21-400x400.jpg',1),(2,'/resources/img/casio-cdp-235r-400x400.jpg',2),(3,'/resources/img/roland-rp-102-400x400.jpg',3),(4,'/resources/img/Kawai GL_20 400x400.jpg',4),(5,'/resources/img/dan-piano-boston-gp-156-pe-400x400.jpg',5),(6,'/resources/img/boston-up-132e-pe-400x400.jpg',6),(7,'/resources/img/takamine_D1N_dang_A.jpg',7),(8,'/resources/img/takamine-ed1nc-400x400.jpg',8),(9,'/resources/img/suzuki-sdg-6 400x400.jpg',9),(10,'/resources/img/fender-cd-140sce-nat.jpg',10),(11,'/resources/img/TAYLOR 214CE.jpg',11),(12,'/resources/img/taylor_114_kem_bao_dan-400x400.jpg',12),(13,'/resources/img/fender-cd-60sce-nat.jpg',13),(14,'/resources/img/suzuki-SDG-45CENL.jpg',14),(15,'/resources/img/suzuki-sng 6ce.jpg',15),(16,'/resources/img/takamine_p3ny_1_jpeg.jpg',16),(17,'/resources/img/takamine-th90-400x400.jpg',17),(18,'/resources/img/suzuki-sng 6.jpg',18),(19,'/resources/img/taylor_114_CE_N_1.jpg',19),(20,'/resources/img/cn-140sce-400x400.jpg',20),(21,'/resources/img/FENDER MC-1 34 NYLON.jpg',21),(22,'/resources/img/roland-g5-2.jpg',22),(23,'/resources/img/roland-boss-g5.jpg',23),(24,'/resources/img/TRADNL_70S_JAZZ_BASS-NAT.png',24),(25,'/resources/img/HYBRID_60S_JAZZ_BASS-3TSB.png',25),(26,'/resources/img/fender-american-professional-precision-bass-rosewood.jpg',26),(27,'/resources/img/RFP924XEPC103_Reference_Pur_103_Piano_Black-400x400.jpg',27),(28,'/resources/img/Pearl_RS585C-400x400.jpg',28),(29,'/resources/img/exl725s249.jpg',29),(30,'/resources/img/soundking-skd200-400x400.jpg',30),(31,'/resources/img/soundking-skd501-400x400.jpg',31),(32,'/resources/img/SPD-SX.jpg',32),(33,'/resources/img/HPD 20.jpg',33),(34,'/resources/img/octapad_spd-30.jpg',34),(35,'/resources/img/kawai-nd-21-400x400-2.jpg',1),(36,'/resources/img/kawai-nd-21-400x400-3.jpg',1);
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product` (
  `productID` int(11) NOT NULL AUTO_INCREMENT,
  `productName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `brandID` int(11) DEFAULT NULL,
  `categoryID` int(11) DEFAULT NULL,
  `typeID` int(11) DEFAULT NULL,
  PRIMARY KEY (`productID`),
  KEY `FKtd9m41h9vg10guumgssdy3sx8` (`brandID`),
  KEY `FKfnoqeyjj90xwm6mf9ieoxqjwq` (`categoryID`),
  KEY `FKojo9bbunhsx1cdjjhq47bvfca` (`typeID`),
  CONSTRAINT `FKfnoqeyjj90xwm6mf9ieoxqjwq` FOREIGN KEY (`categoryID`) REFERENCES `category` (`categoryID`),
  CONSTRAINT `FKojo9bbunhsx1cdjjhq47bvfca` FOREIGN KEY (`typeID`) REFERENCES `type` (`typeID`),
  CONSTRAINT `FKtd9m41h9vg10guumgssdy3sx8` FOREIGN KEY (`brandID`) REFERENCES `brand` (`brandID`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Kawai ND-21',1,2,7),(2,'Casio CDP-235R',3,2,9),(3,'Roland RP-102',4,2,9),(4,'Kawai GL-30',1,2,8),(5,'Boston GP-156',2,2,8),(6,'Boston UP-132E',2,2,7),(7,'Takamine D1N',5,3,4),(8,'Takamine ED1NC',5,3,4),(9,'Suzuki SDG-6NL',6,3,4),(10,'Fender CD-140SCE',7,3,4),(11,'Taylor 214CE',8,3,4),(12,'Taylor 114E',8,3,4),(13,'Fender CD-60SCE',7,3,4),(14,'SUZUKI SDG-45SCENL',6,3,4),(15,'Suzuki SCG-6CE',6,3,5),(16,'Takamine P3NY',5,3,5),(17,'Takamine TH90',5,3,5),(18,'Suzuki SNG-6',6,3,5),(19,'Taylor 114CE-N',8,3,5),(20,'Fender CN-140SCE',7,3,5),(21,'Fender MC-1 3/4 Nylon',7,3,5),(22,'Roland G-5 VG Stratocaster, G-5-3TS',4,3,6),(23,'Boss G5',4,3,6),(24,'FENDER TRADNL 70S JAZZ BASS-NAT',7,3,6),(25,'FENDER HYBRID 60S JAZZ BASS 3TSB',7,3,6),(26,'Fender Am Pro P Bass RW',7,3,6),(27,'Pearl Reference Pure RFP924XEP/C',9,1,3),(28,'Pearl Roadshow RS585C/C',9,1,3),(29,'PEARL Export Lacquer EXL725SP Standard',9,1,3),(30,'SOUNDKING SKD-200',10,1,1),(31,'SOUNDKING SKD-501',10,1,1),(32,'Roland SPD-SX',4,1,2),(33,'Roland HandSonic HPD-20',4,1,2),(34,'Roland SPD-30',4,1,2);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productdetail`
--

DROP TABLE IF EXISTS `productdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `productdetail` (
  `productDetailID` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  `orderedQuantity` int(11) DEFAULT '0',
  `publishedDate` date DEFAULT NULL,
  `unitPrice` float DEFAULT NULL,
  `view` int(11) DEFAULT '0',
  PRIMARY KEY (`productDetailID`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productdetail`
--

LOCK TABLES `productdetail` WRITE;
/*!40000 ALTER TABLE `productdetail` DISABLE KEYS */;
INSERT INTO `productdetail` VALUES (1,'A musical instrument is an instrument created or adapted to make musical sounds. In principle, any object that produces sound can be considered a musical instrument—it is through purpose that the object becomes a musical instrument. The history of musical instruments dates to the beginnings of human culture. Early musical instruments may have been used for ritual, such as a trumpet to signal success on the hunt, or a drum in a religious ceremony. Cultures eventually developed composition and performance of melodies for entertainment. Musical instruments evolved in step with changing applications.',20,'2019-10-20',299,5),(2,'A musical instrument is an instrument created or adapted to make musical sounds. In principle, any object that produces sound can be considered a musical instrument—it is through purpose that the object becomes a musical instrument. The history of musical instruments dates to the beginnings of human culture. Early musical instruments may have been used for ritual, such as a trumpet to signal success on the hunt, or a drum in a religious ceremony. Cultures eventually developed composition and performance of melodies for entertainment. Musical instruments evolved in step with changing applications.',21,'2019-09-20',399,6),(3,'A musical instrument is an instrument created or adapted to make musical sounds. In principle, any object that produces sound can be considered a musical instrument—it is through purpose that the object becomes a musical instrument. The history of musical instruments dates to the beginnings of human culture. Early musical instruments may have been used for ritual, such as a trumpet to signal success on the hunt, or a drum in a religious ceremony. Cultures eventually developed composition and performance of melodies for entertainment. Musical instruments evolved in step with changing applications.',97,'2019-09-20',499,7),(4,'A musical instrument is an instrument created or adapted to make musical sounds. In principle, any object that produces sound can be considered a musical instrument—it is through purpose that the object becomes a musical instrument. The history of musical instruments dates to the beginnings of human culture. Early musical instruments may have been used for ritual, such as a trumpet to signal success on the hunt, or a drum in a religious ceremony. Cultures eventually developed composition and performance of melodies for entertainment. Musical instruments evolved in step with changing applications.',25,'2019-10-22',199,8),(5,'A musical instrument is an instrument created or adapted to make musical sounds. In principle, any object that produces sound can be considered a musical instrument—it is through purpose that the object becomes a musical instrument. The history of musical instruments dates to the beginnings of human culture. Early musical instruments may have been used for ritual, such as a trumpet to signal success on the hunt, or a drum in a religious ceremony. Cultures eventually developed composition and performance of melodies for entertainment. Musical instruments evolved in step with changing applications.',101,'2019-09-20',369,9),(6,'A musical instrument is an instrument created or adapted to make musical sounds. In principle, any object that produces sound can be considered a musical instrument—it is through purpose that the object becomes a musical instrument. The history of musical instruments dates to the beginnings of human culture. Early musical instruments may have been used for ritual, such as a trumpet to signal success on the hunt, or a drum in a religious ceremony. Cultures eventually developed composition and performance of melodies for entertainment. Musical instruments evolved in step with changing applications.',23,'2019-09-20',249,10),(7,'A musical instrument is an instrument created or adapted to make musical sounds. In principle, any object that produces sound can be considered a musical instrument—it is through purpose that the object becomes a musical instrument. The history of musical instruments dates to the beginnings of human culture. Early musical instruments may have been used for ritual, such as a trumpet to signal success on the hunt, or a drum in a religious ceremony. Cultures eventually developed composition and performance of melodies for entertainment. Musical instruments evolved in step with changing applications.',24,'2019-10-20',99,11),(8,'A musical instrument is an instrument created or adapted to make musical sounds. In principle, any object that produces sound can be considered a musical instrument—it is through purpose that the object becomes a musical instrument. The history of musical instruments dates to the beginnings of human culture. Early musical instruments may have been used for ritual, such as a trumpet to signal success on the hunt, or a drum in a religious ceremony. Cultures eventually developed composition and performance of melodies for entertainment. Musical instruments evolved in step with changing applications.',25,'2019-09-20',88,12),(9,'A musical instrument is an instrument created or adapted to make musical sounds. In principle, any object that produces sound can be considered a musical instrument—it is through purpose that the object becomes a musical instrument. The history of musical instruments dates to the beginnings of human culture. Early musical instruments may have been used for ritual, such as a trumpet to signal success on the hunt, or a drum in a religious ceremony. Cultures eventually developed composition and performance of melodies for entertainment. Musical instruments evolved in step with changing applications.',26,'2019-09-20',49,13),(10,'A musical instrument is an instrument created or adapted to make musical sounds. In principle, any object that produces sound can be considered a musical instrument—it is through purpose that the object becomes a musical instrument. The history of musical instruments dates to the beginnings of human culture. Early musical instruments may have been used for ritual, such as a trumpet to signal success on the hunt, or a drum in a religious ceremony. Cultures eventually developed composition and performance of melodies for entertainment. Musical instruments evolved in step with changing applications.',50,'2019-09-20',199,14),(11,'A musical instrument is an instrument created or adapted to make musical sounds. In principle, any object that produces sound can be considered a musical instrument—it is through purpose that the object becomes a musical instrument. The history of musical instruments dates to the beginnings of human culture. Early musical instruments may have been used for ritual, such as a trumpet to signal success on the hunt, or a drum in a religious ceremony. Cultures eventually developed composition and performance of melodies for entertainment. Musical instruments evolved in step with changing applications.',28,'2019-09-20',299,15),(12,'A musical instrument is an instrument created or adapted to make musical sounds. In principle, any object that produces sound can be considered a musical instrument—it is through purpose that the object becomes a musical instrument. The history of musical instruments dates to the beginnings of human culture. Early musical instruments may have been used for ritual, such as a trumpet to signal success on the hunt, or a drum in a religious ceremony. Cultures eventually developed composition and performance of melodies for entertainment. Musical instruments evolved in step with changing applications.',100,'2019-09-20',69,16),(13,'A musical instrument is an instrument created or adapted to make musical sounds. In principle, any object that produces sound can be considered a musical instrument—it is through purpose that the object becomes a musical instrument. The history of musical instruments dates to the beginnings of human culture. Early musical instruments may have been used for ritual, such as a trumpet to signal success on the hunt, or a drum in a religious ceremony. Cultures eventually developed composition and performance of melodies for entertainment. Musical instruments evolved in step with changing applications.',29,'2019-09-20',96,17),(14,'A musical instrument is an instrument created or adapted to make musical sounds. In principle, any object that produces sound can be considered a musical instrument—it is through purpose that the object becomes a musical instrument. The history of musical instruments dates to the beginnings of human culture. Early musical instruments may have been used for ritual, such as a trumpet to signal success on the hunt, or a drum in a religious ceremony. Cultures eventually developed composition and performance of melodies for entertainment. Musical instruments evolved in step with changing applications.',30,'2019-09-20',150,18),(15,'A musical instrument is an instrument created or adapted to make musical sounds. In principle, any object that produces sound can be considered a musical instrument—it is through purpose that the object becomes a musical instrument. The history of musical instruments dates to the beginnings of human culture. Early musical instruments may have been used for ritual, such as a trumpet to signal success on the hunt, or a drum in a religious ceremony. Cultures eventually developed composition and performance of melodies for entertainment. Musical instruments evolved in step with changing applications.',31,'2019-10-20',300,19),(16,'A musical instrument is an instrument created or adapted to make musical sounds. In principle, any object that produces sound can be considered a musical instrument—it is through purpose that the object becomes a musical instrument. The history of musical instruments dates to the beginnings of human culture. Early musical instruments may have been used for ritual, such as a trumpet to signal success on the hunt, or a drum in a religious ceremony. Cultures eventually developed composition and performance of melodies for entertainment. Musical instruments evolved in step with changing applications.',96,'2019-09-20',250,20),(17,'A musical instrument is an instrument created or adapted to make musical sounds. In principle, any object that produces sound can be considered a musical instrument—it is through purpose that the object becomes a musical instrument. The history of musical instruments dates to the beginnings of human culture. Early musical instruments may have been used for ritual, such as a trumpet to signal success on the hunt, or a drum in a religious ceremony. Cultures eventually developed composition and performance of melodies for entertainment. Musical instruments evolved in step with changing applications.',32,'2019-09-20',499,21),(18,'A musical instrument is an instrument created or adapted to make musical sounds. In principle, any object that produces sound can be considered a musical instrument—it is through purpose that the object becomes a musical instrument. The history of musical instruments dates to the beginnings of human culture. Early musical instruments may have been used for ritual, such as a trumpet to signal success on the hunt, or a drum in a religious ceremony. Cultures eventually developed composition and performance of melodies for entertainment. Musical instruments evolved in step with changing applications.',20,'2019-09-20',399,22),(19,'A musical instrument is an instrument created or adapted to make musical sounds. In principle, any object that produces sound can be considered a musical instrument—it is through purpose that the object becomes a musical instrument. The history of musical instruments dates to the beginnings of human culture. Early musical instruments may have been used for ritual, such as a trumpet to signal success on the hunt, or a drum in a religious ceremony. Cultures eventually developed composition and performance of melodies for entertainment. Musical instruments evolved in step with changing applications.',34,'2019-09-20',299,23),(20,'A musical instrument is an instrument created or adapted to make musical sounds. In principle, any object that produces sound can be considered a musical instrument—it is through purpose that the object becomes a musical instrument. The history of musical instruments dates to the beginnings of human culture. Early musical instruments may have been used for ritual, such as a trumpet to signal success on the hunt, or a drum in a religious ceremony. Cultures eventually developed composition and performance of melodies for entertainment. Musical instruments evolved in step with changing applications.',35,'2019-09-20',199,24),(21,'A musical instrument is an instrument created or adapted to make musical sounds. In principle, any object that produces sound can be considered a musical instrument—it is through purpose that the object becomes a musical instrument. The history of musical instruments dates to the beginnings of human culture. Early musical instruments may have been used for ritual, such as a trumpet to signal success on the hunt, or a drum in a religious ceremony. Cultures eventually developed composition and performance of melodies for entertainment. Musical instruments evolved in step with changing applications.',36,'2019-09-20',99,25),(22,'A musical instrument is an instrument created or adapted to make musical sounds. In principle, any object that produces sound can be considered a musical instrument—it is through purpose that the object becomes a musical instrument. The history of musical instruments dates to the beginnings of human culture. Early musical instruments may have been used for ritual, such as a trumpet to signal success on the hunt, or a drum in a religious ceremony. Cultures eventually developed composition and performance of melodies for entertainment. Musical instruments evolved in step with changing applications.',42,'2019-10-22',69,26),(23,'A musical instrument is an instrument created or adapted to make musical sounds. In principle, any object that produces sound can be considered a musical instrument—it is through purpose that the object becomes a musical instrument. The history of musical instruments dates to the beginnings of human culture. Early musical instruments may have been used for ritual, such as a trumpet to signal success on the hunt, or a drum in a religious ceremony. Cultures eventually developed composition and performance of melodies for entertainment. Musical instruments evolved in step with changing applications.',38,'2019-09-20',96,27),(24,'A musical instrument is an instrument created or adapted to make musical sounds. In principle, any object that produces sound can be considered a musical instrument—it is through purpose that the object becomes a musical instrument. The history of musical instruments dates to the beginnings of human culture. Early musical instruments may have been used for ritual, such as a trumpet to signal success on the hunt, or a drum in a religious ceremony. Cultures eventually developed composition and performance of melodies for entertainment. Musical instruments evolved in step with changing applications.',39,'2019-09-20',349,28),(25,'A musical instrument is an instrument created or adapted to make musical sounds. In principle, any object that produces sound can be considered a musical instrument—it is through purpose that the object becomes a musical instrument. The history of musical instruments dates to the beginnings of human culture. Early musical instruments may have been used for ritual, such as a trumpet to signal success on the hunt, or a drum in a religious ceremony. Cultures eventually developed composition and performance of melodies for entertainment. Musical instruments evolved in step with changing applications.',40,'2019-09-20',249,29),(26,'A musical instrument is an instrument created or adapted to make musical sounds. In principle, any object that produces sound can be considered a musical instrument—it is through purpose that the object becomes a musical instrument. The history of musical instruments dates to the beginnings of human culture. Early musical instruments may have been used for ritual, such as a trumpet to signal success on the hunt, or a drum in a religious ceremony. Cultures eventually developed composition and performance of melodies for entertainment. Musical instruments evolved in step with changing applications.',41,'2019-09-20',369,30),(27,'A musical instrument is an instrument created or adapted to make musical sounds. In principle, any object that produces sound can be considered a musical instrument—it is through purpose that the object becomes a musical instrument. The history of musical instruments dates to the beginnings of human culture. Early musical instruments may have been used for ritual, such as a trumpet to signal success on the hunt, or a drum in a religious ceremony. Cultures eventually developed composition and performance of melodies for entertainment. Musical instruments evolved in step with changing applications.',42,'2019-10-22',396,31),(28,'A musical instrument is an instrument created or adapted to make musical sounds. In principle, any object that produces sound can be considered a musical instrument—it is through purpose that the object becomes a musical instrument. The history of musical instruments dates to the beginnings of human culture. Early musical instruments may have been used for ritual, such as a trumpet to signal success on the hunt, or a drum in a religious ceremony. Cultures eventually developed composition and performance of melodies for entertainment. Musical instruments evolved in step with changing applications.',99,'2019-09-20',496,32),(29,'A musical instrument is an instrument created or adapted to make musical sounds. In principle, any object that produces sound can be considered a musical instrument—it is through purpose that the object becomes a musical instrument. The history of musical instruments dates to the beginnings of human culture. Early musical instruments may have been used for ritual, such as a trumpet to signal success on the hunt, or a drum in a religious ceremony. Cultures eventually developed composition and performance of melodies for entertainment. Musical instruments evolved in step with changing applications.',95,'2019-09-20',599,33),(30,'A musical instrument is an instrument created or adapted to make musical sounds. In principle, any object that produces sound can be considered a musical instrument—it is through purpose that the object becomes a musical instrument. The history of musical instruments dates to the beginnings of human culture. Early musical instruments may have been used for ritual, such as a trumpet to signal success on the hunt, or a drum in a religious ceremony. Cultures eventually developed composition and performance of melodies for entertainment. Musical instruments evolved in step with changing applications.',48,'2019-10-22',699,34),(31,'A musical instrument is an instrument created or adapted to make musical sounds. In principle, any object that produces sound can be considered a musical instrument—it is through purpose that the object becomes a musical instrument. The history of musical instruments dates to the beginnings of human culture. Early musical instruments may have been used for ritual, such as a trumpet to signal success on the hunt, or a drum in a religious ceremony. Cultures eventually developed composition and performance of melodies for entertainment. Musical instruments evolved in step with changing applications.',94,'2019-09-20',799,35),(32,'A musical instrument is an instrument created or adapted to make musical sounds. In principle, any object that produces sound can be considered a musical instrument—it is through purpose that the object becomes a musical instrument. The history of musical instruments dates to the beginnings of human culture. Early musical instruments may have been used for ritual, such as a trumpet to signal success on the hunt, or a drum in a religious ceremony. Cultures eventually developed composition and performance of melodies for entertainment. Musical instruments evolved in step with changing applications.',20,'2019-10-20',899,36),(33,'A musical instrument is an instrument created or adapted to make musical sounds. In principle, any object that produces sound can be considered a musical instrument—it is through purpose that the object becomes a musical instrument. The history of musical instruments dates to the beginnings of human culture. Early musical instruments may have been used for ritual, such as a trumpet to signal success on the hunt, or a drum in a religious ceremony. Cultures eventually developed composition and performance of melodies for entertainment. Musical instruments evolved in step with changing applications.',98,'2019-09-20',999,37),(34,'A musical instrument is an instrument created or adapted to make musical sounds. In principle, any object that produces sound can be considered a musical instrument—it is through purpose that the object becomes a musical instrument. The history of musical instruments dates to the beginnings of human culture. Early musical instruments may have been used for ritual, such as a trumpet to signal success on the hunt, or a drum in a religious ceremony. Cultures eventually developed composition and performance of melodies for entertainment. Musical instruments evolved in step with changing applications.',45,'2019-09-20',969,38);
/*!40000 ALTER TABLE `productdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productorder`
--

DROP TABLE IF EXISTS `productorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `productorder` (
  `orderID` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `checkoutCode` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `firstName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  `lastName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `orderDate` date DEFAULT NULL,
  `orderStatus` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `totalPrice` double DEFAULT NULL,
  `zip` int(11) DEFAULT NULL,
  `customerID` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderID`),
  KEY `FKhcg9g27tvg3ywm9jbaikks37h` (`customerID`),
  CONSTRAINT `FKhcg9g27tvg3ywm9jbaikks37h` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productorder`
--

LOCK TABLES `productorder` WRITE;
/*!40000 ALTER TABLE `productorder` DISABLE KEYS */;
INSERT INTO `productorder` VALUES (3,'Leningradsky prospect 95',NULL,'nguyenvanlocmmo@gmail.com','Loc',_binary '\0','Nguyen Van','2019-11-30',NULL,123456,NULL,1666,70000,2),(4,'Leningradsky prospect 95',NULL,'nguyenvanlocmmo@gmail.com','Loc',_binary '\0','Nguyen Van','2019-11-30',NULL,123456,NULL,1097,70000,2);
/*!40000 ALTER TABLE `productorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productorderdetail`
--

DROP TABLE IF EXISTS `productorderdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `productorderdetail` (
  `orderDetailID` int(11) NOT NULL AUTO_INCREMENT,
  `orderDetailQuantity` int(11) DEFAULT NULL,
  `orderID` int(11) DEFAULT NULL,
  `productID` int(11) DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  PRIMARY KEY (`orderDetailID`),
  KEY `FKf11j08a7h81u0hrbst41w4t8k` (`orderID`),
  KEY `FK1mnx895t29e039tw81hrrlmnr` (`productID`),
  CONSTRAINT `FK1mnx895t29e039tw81hrrlmnr` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`),
  CONSTRAINT `FKf11j08a7h81u0hrbst41w4t8k` FOREIGN KEY (`orderID`) REFERENCES `productorder` (`orderID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productorderdetail`
--

LOCK TABLES `productorderdetail` WRITE;
/*!40000 ALTER TABLE `productorderdetail` DISABLE KEYS */;
INSERT INTO `productorderdetail` VALUES (2,1,3,22,69),(3,2,3,30,699),(4,1,3,4,199),(5,1,4,30,699),(6,2,4,4,199);
/*!40000 ALTER TABLE `productorderdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subbanner`
--

DROP TABLE IF EXISTS `subbanner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `subbanner` (
  `subbanerID` int(11) NOT NULL AUTO_INCREMENT,
  `subbannerTitle` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `subbannerUrl` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`subbanerID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subbanner`
--

LOCK TABLES `subbanner` WRITE;
/*!40000 ALTER TABLE `subbanner` DISABLE KEYS */;
INSERT INTO `subbanner` VALUES (1,'Piano','/resources/img/banner-1.jpg'),(2,'Guitar','/resources/img/banner-2.jpg'),(3,'Drums','/resources/img/banner-3.jpg');
/*!40000 ALTER TABLE `subbanner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `type` (
  `typeID` int(11) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`typeID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'Electric Drumset'),(2,'Digital Percussion'),(3,'Pearl Jazz'),(4,'Guitar Acoustic'),(5,'Guitar Classic'),(6,'Guitar Digital'),(7,'Piano Upright'),(8,'Piano Grand'),(9,'Digital Piano');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db_musicshop'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-05 22:15:37
