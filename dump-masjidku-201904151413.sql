-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: masjidku
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.16.04.2

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
-- Table structure for table `artikel_label`
--

DROP TABLE IF EXISTS `artikel_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artikel_label` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `artikel_id` int(11) DEFAULT NULL,
  `label_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artikel_label`
--

LOCK TABLES `artikel_label` WRITE;
/*!40000 ALTER TABLE `artikel_label` DISABLE KEYS */;
INSERT INTO `artikel_label` VALUES (1,1,1),(2,1,2),(3,2,2),(4,3,2),(5,4,1);
/*!40000 ALTER TABLE `artikel_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artikels`
--

DROP TABLE IF EXISTS `artikels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artikels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isi` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `gambar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artikels`
--

LOCK TABLES `artikels` WRITE;
/*!40000 ALTER TABLE `artikels` DISABLE KEYS */;
INSERT INTO `artikels` VALUES (1,'Artikel 1','Isi Artikel 1','2019-04-12 20:40:00','2019-04-12 21:27:33','artikels/April2019/2Sms73RRmMIhHdjp7qLi.jpg'),(2,'Artikel 2','Isi Artikel 2','2019-04-12 21:17:29','2019-04-12 21:17:29',NULL),(4,'Artikel 4','Isi Artikel 4 edit','2019-04-13 09:38:34','2019-04-13 21:27:31','artikels/April2019/lujWeazkEZQeHNcDdTQT.jpeg');
/*!40000 ALTER TABLE `artikels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_rows`
--

DROP TABLE IF EXISTS `data_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_rows`
--

LOCK TABLES `data_rows` WRITE;
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
INSERT INTO `data_rows` VALUES (1,1,'id','number','ID',1,0,0,0,0,0,NULL,1),(2,1,'name','text','Name',1,1,1,1,1,1,NULL,2),(3,1,'email','text','Email',1,1,1,1,1,1,NULL,3),(4,1,'password','password','Password',1,0,0,1,1,0,NULL,4),(5,1,'remember_token','text','Remember Token',0,0,0,0,0,0,NULL,5),(6,1,'created_at','timestamp','Created At',0,1,1,0,0,0,NULL,6),(7,1,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,7),(8,1,'avatar','image','Avatar',0,1,1,1,1,1,NULL,8),(9,1,'user_belongsto_role_relationship','relationship','Role',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}',10),(10,1,'user_belongstomany_role_relationship','relationship','Roles',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}',11),(11,1,'settings','hidden','Settings',0,0,0,0,0,0,NULL,12),(12,2,'id','number','ID',1,0,0,0,0,0,NULL,1),(13,2,'name','text','Name',1,1,1,1,1,1,NULL,2),(14,2,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),(15,2,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(16,3,'id','number','ID',1,0,0,0,0,0,NULL,1),(17,3,'name','text','Name',1,1,1,1,1,1,NULL,2),(18,3,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),(19,3,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(20,3,'display_name','text','Display Name',1,1,1,1,1,1,NULL,5),(21,1,'role_id','text','Role',1,1,1,1,1,1,NULL,9),(22,7,'id','text','Id',1,0,0,0,0,0,'{}',1),(23,7,'judul','text','Judul',0,1,1,1,1,1,'{}',2),(24,7,'isi','text','Isi',0,1,1,1,1,1,'{}',3),(25,7,'created_at','timestamp','Created At',0,0,0,0,0,0,'{}',4),(26,7,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',5),(27,8,'id','text','Id',1,0,0,0,0,0,'{}',1),(28,8,'nama_label','text','Nama Label',0,1,1,1,1,1,'{}',2),(29,7,'artikel_belongstomany_label_relationship','relationship','Labels',0,1,1,1,1,1,'{\"model\":\"App\\\\Label\",\"table\":\"labels\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"nama_label\",\"pivot_table\":\"artikel_label\",\"pivot\":\"1\",\"taggable\":\"0\"}',7),(30,8,'label_belongstomany_artikel_relationship','relationship','Artikels',0,1,1,1,1,1,'{\"model\":\"App\\\\Artikel\",\"table\":\"artikels\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"judul\",\"pivot_table\":\"artikel_label\",\"pivot\":\"1\",\"taggable\":\"0\"}',3),(31,8,'created_at','timestamp','Created At',0,0,0,0,0,0,'{}',3),(32,8,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',4),(33,7,'gambar','image','Gambar',0,1,1,1,1,1,'{}',6),(34,9,'id','text','Id',1,0,0,0,0,0,'{}',1),(35,9,'nama_lengkap','text','Nama Lengkap',0,1,1,1,1,1,'{}',2),(36,9,'alamat','text','Alamat',0,1,1,1,1,1,'{}',3),(37,9,'no_hp','text','No Hp',0,1,1,1,1,1,'{}',4),(38,9,'jenis_kelamin','select_dropdown','Jenis Kelamin',0,1,1,1,1,1,'{\"default\":\"option1\",\"options\":{\"option1\":\"Laki-laki\",\"option2\":\"Perempuan\"}}',5),(39,9,'status','select_dropdown','Status',0,1,1,1,1,1,'{\"default\":\"option1\",\"options\":{\"option1\":\"Pelajar\",\"option2\":\"Mahasiswa\",\"option3\":\"Pekerja\",\"option4\":\"Masih Menganggur\",\"option5\":\"Pensiunan\"}}',6),(40,10,'id','text','Id',1,0,0,0,0,0,'{}',1),(41,10,'deskripsi','text','Deskripsi',0,1,1,1,1,1,'{}',4),(42,10,'posisi','select_dropdown','Posisi',0,1,1,1,1,1,'{\"default\":\"option1\",\"options\":{\"option1\":\"Pembina\",\"option2\":\"Ketua Bidang\",\"option3\":\"Remaja Masjid\"}}',3),(43,10,'created_at','timestamp','Created At',0,0,0,0,0,0,'{}',5),(44,10,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',6),(45,10,'struktural_hasone_jamaah_relationship','relationship','Jamaah',0,1,1,1,1,1,'{\"model\":\"App\\\\Jamaah\",\"table\":\"jamaahs\",\"type\":\"belongsTo\",\"column\":\"id\",\"key\":\"id\",\"label\":\"nama_lengkap\",\"pivot_table\":\"artikel_label\",\"pivot\":\"0\",\"taggable\":\"0\"}',2),(46,11,'id','text','Id',1,0,0,0,0,0,'{}',1),(47,11,'jenis','select_dropdown','Jenis',0,1,1,1,1,1,'{\"default\":\"option1\",\"options\":{\"option1\":\"Infak Umum\",\"option2\":\"Zakat\",\"option3\":\"Shodaqoh\",\"option4\":\"Waqaf\"}}',2),(48,11,'nominal','text','Nominal',0,1,1,1,1,1,'{}',3),(49,11,'keterangan','text','Keterangan',0,1,1,1,1,1,'{}',4),(50,11,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',5),(51,11,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',6),(52,13,'id','text','Id',1,0,0,0,0,0,'{}',1),(53,13,'jenis','select_dropdown','Jenis',0,1,1,1,1,1,'{\"default\":\"option1\",\"options\":{\"option1\":\"Infak Umum\",\"option2\":\"Zakat\",\"option3\":\"Shodaqoh\",\"option4\":\"Waqaf\"}}',2),(54,13,'nominal','text','Nominal',0,1,1,1,1,1,'{}',3),(55,13,'keterangan','text','Keterangan',0,1,1,1,1,1,'{}',4),(56,13,'created_at','timestamp','Diterima Pada',0,1,1,1,1,1,'{}',6),(57,13,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',7),(58,13,'pemasukan_belongsto_jamaah_relationship','relationship','Penanggung Jawab',0,1,1,1,1,1,'{\"model\":\"App\\\\Jamaah\",\"table\":\"jamaahs\",\"type\":\"belongsTo\",\"column\":\"id\",\"key\":\"id\",\"label\":\"nama_lengkap\",\"pivot_table\":\"artikel_label\",\"pivot\":\"0\",\"taggable\":\"0\"}',5),(59,9,'created_at','timestamp','Created At',0,0,0,0,0,0,'{}',7),(60,9,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',8),(61,14,'id','text','Id',1,0,0,0,0,0,'{}',1),(62,14,'jenis','select_dropdown','Jenis',0,1,1,1,1,1,'{\"default\":\"option1\",\"options\":{\"option1\":\"Keperluan Masjid\",\"option2\":\"Kegiatan\",\"option3\":\"Kas\"}}',2),(63,14,'nominal','text','Nominal',0,1,1,1,1,1,'{}',3),(64,14,'keterangan','text','Keterangan',0,1,1,1,1,1,'{}',4),(65,14,'created_at','timestamp','Dikeluarkan Pada',0,1,1,1,1,1,'{}',6),(66,14,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',7),(67,14,'pengeluaran_belongsto_jamaah_relationship','relationship','Penanggung Jawab',0,1,1,1,1,1,'{\"model\":\"App\\\\Jamaah\",\"table\":\"jamaahs\",\"type\":\"belongsTo\",\"column\":\"id\",\"key\":\"id\",\"label\":\"nama_lengkap\",\"pivot_table\":\"artikel_label\",\"pivot\":\"0\",\"taggable\":\"0\"}',5),(68,15,'id','text','Id',1,0,0,0,0,0,'{}',1),(69,15,'nama_kegiatan','text','Nama Kegiatan',0,1,1,1,1,1,'{}',2),(70,15,'deskripsi','text','Deskripsi',0,1,1,1,1,1,'{}',3),(71,15,'lokasi','text','Lokasi',0,1,1,1,1,1,'{}',4),(72,15,'created_at','timestamp','Tanggal Kegiatan',0,1,1,1,1,1,'{}',7),(73,15,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',8),(74,16,'id','text','Id',1,0,0,0,0,0,'{}',1),(75,16,'nama_lengkap','text','Nama Lengkap',0,1,1,1,1,1,'{}',2),(76,16,'alamat','text','Alamat',0,1,1,1,1,1,'{}',3),(77,16,'no_hp','text','No Hp',0,1,1,1,1,1,'{}',4),(78,16,'jenis_kelamin','select_dropdown','Jenis Kelamin',0,1,1,1,1,1,'{\"default\":\"option1\",\"options\":{\"option1\":\"Laki-laki\",\"option2\":\"Perempuan\"}}',5),(79,16,'keterangan','text','Keterangan',0,1,1,1,1,1,'{}',6),(80,16,'created_at','timestamp','Created At',0,0,0,0,0,0,'{}',7),(81,16,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',8),(82,15,'kegiatan_belongsto_jamaah_relationship','relationship','Penanggung Jawab',0,1,1,1,1,1,'{\"model\":\"App\\\\Jamaah\",\"table\":\"jamaahs\",\"type\":\"belongsTo\",\"column\":\"id\",\"key\":\"id\",\"label\":\"nama_lengkap\",\"pivot_table\":\"artikel_label\",\"pivot\":\"0\",\"taggable\":\"0\"}',5),(83,15,'jenis','select_dropdown','Jenis',0,1,1,1,1,1,'{\"default\":\"option1\",\"options\":{\"option1\":\"Insidental\",\"option2\":\"Rutin\"}}',6),(84,17,'id','text','Id',1,0,0,0,0,0,'{}',1),(85,17,'kode','text','Kode',1,1,1,1,1,1,'{}',2),(86,17,'deskripsi','text','Deskripsi',1,1,1,1,1,1,'{}',4),(87,17,'asal','text','Asal',1,1,1,1,1,1,'{}',5),(88,17,'harga','text','Harga',0,1,1,1,1,1,'{}',6),(89,17,'kondisi','select_dropdown','Kondisi',0,1,1,1,1,1,'{\"default\":\"option1\",\"options\":{\"option1\":\"Baru\",\"option2\":\"Bekas\"}}',7),(90,17,'created_at','timestamp','Tanggal Pengadaan',0,1,1,1,1,1,'{}',8),(91,17,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',10),(92,17,'inventory_belongsto_jamaah_relationship','relationship','Penanggung Jawab',0,1,1,1,1,1,'{\"model\":\"App\\\\Jamaah\",\"table\":\"jamaahs\",\"type\":\"belongsTo\",\"column\":\"id\",\"key\":\"id\",\"label\":\"nama_lengkap\",\"pivot_table\":\"artikel_label\",\"pivot\":\"0\",\"taggable\":\"0\"}',9),(93,17,'gambar','image','Gambar',0,1,1,1,1,1,'{}',3);
/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_types`
--

DROP TABLE IF EXISTS `data_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_types`
--

LOCK TABLES `data_types` WRITE;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` VALUES (1,'users','users','User','Users','voyager-person','TCG\\Voyager\\Models\\User','TCG\\Voyager\\Policies\\UserPolicy','TCG\\Voyager\\Http\\Controllers\\VoyagerUserController','',1,0,NULL,'2019-04-12 20:02:58','2019-04-12 20:02:58'),(2,'menus','menus','Menu','Menus','voyager-list','TCG\\Voyager\\Models\\Menu',NULL,'','',1,0,NULL,'2019-04-12 20:02:58','2019-04-12 20:02:58'),(3,'roles','roles','Role','Roles','voyager-lock','TCG\\Voyager\\Models\\Role',NULL,'','',1,0,NULL,'2019-04-12 20:02:58','2019-04-12 20:02:58'),(7,'artikels','artikels','Artikel','Artikels','voyager-file-text','App\\Artikel',NULL,NULL,NULL,1,1,'{\"order_column\":\"id\",\"order_display_column\":\"judul\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2019-04-12 20:40:04','2019-04-13 21:24:22'),(8,'labels','labels','Label','Labels','voyager-tag','App\\Label',NULL,NULL,NULL,1,1,'{\"order_column\":\"id\",\"order_display_column\":\"nama_label\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2019-04-12 20:47:37','2019-04-13 09:39:13'),(9,'jamaahs','jamaahs','Jamaah','Jamaahs','voyager-home','App\\Jamaah',NULL,NULL,NULL,1,1,'{\"order_column\":\"id\",\"order_display_column\":\"nama_lengkap\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2019-04-13 08:53:00','2019-04-13 21:32:40'),(10,'strukturals','strukturals','Struktural','Strukturals','voyager-people','App\\Struktural',NULL,NULL,NULL,1,1,'{\"order_column\":\"id\",\"order_display_column\":\"posisi\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2019-04-13 09:08:01','2019-04-13 20:51:43'),(11,'keuangans','keuangans','Keuangan','Keuangans','voyager-dollar','App\\Keuangan',NULL,NULL,NULL,1,1,'{\"order_column\":\"id\",\"order_display_column\":\"jenis\",\"order_direction\":\"asc\",\"default_search_key\":null}','2019-04-13 09:24:58','2019-04-13 09:24:58'),(13,'pemasukans','pemasukans','Pemasukan','Pemasukans','voyager-double-left','App\\Pemasukan',NULL,NULL,NULL,1,1,'{\"order_column\":\"id\",\"order_display_column\":\"jenis\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2019-04-13 09:32:18','2019-04-13 10:08:25'),(14,'pengeluarans','pengeluarans','Pengeluaran','Pengeluarans','voyager-double-right','App\\Pengeluaran',NULL,NULL,NULL,1,1,'{\"order_column\":\"id\",\"order_display_column\":\"jenis\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2019-04-13 09:46:24','2019-04-13 10:11:48'),(15,'kegiatans','kegiatans','Kegiatan','Kegiatans','voyager-calendar','App\\Kegiatan',NULL,NULL,NULL,1,1,'{\"order_column\":\"id\",\"order_display_column\":\"nama_kegiatan\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2019-04-13 20:34:01','2019-04-13 22:42:13'),(16,'pemateris','pemateris','Pemateri','Pemateris','voyager-people','App\\Pemateri',NULL,NULL,NULL,1,1,'{\"order_column\":\"id\",\"order_display_column\":\"nama_lengkap\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2019-04-13 20:37:40','2019-04-13 21:33:05'),(17,'inventories','inventories','Inventory','Inventories','voyager-folder','App\\Inventory',NULL,NULL,NULL,1,1,'{\"order_column\":\"id\",\"order_display_column\":\"kode\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2019-04-13 22:50:03','2019-04-14 08:32:11');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventories`
--

DROP TABLE IF EXISTS `inventories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `asal` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` decimal(10,0) DEFAULT NULL,
  `kondisi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `gambar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `inventories_kode_unique` (`kode`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventories`
--

LOCK TABLES `inventories` WRITE;
/*!40000 ALTER TABLE `inventories` DISABLE KEYS */;
INSERT INTO `inventories` VALUES (1,'MJD-001','Speaker Simbadda','Beli',250000,'option1','2019-04-15 05:53:00','2019-04-14 08:33:00','inventories/April2019/0nNNZPCpZN5nG4p4vur1.jpg'),(2,'MJD-002','Karpet','Beli',283000,'option1','2019-04-14 15:34:00','2019-04-14 08:35:01','inventories/April2019/jKfxjLsv9ttQMqnZVoEm.jpeg');
/*!40000 ALTER TABLE `inventories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jamaahs`
--

DROP TABLE IF EXISTS `jamaahs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jamaahs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama_lengkap` text COLLATE utf8mb4_unicode_ci,
  `alamat` text COLLATE utf8mb4_unicode_ci,
  `no_hp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jenis_kelamin` tinytext COLLATE utf8mb4_unicode_ci,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jamaahs`
--

LOCK TABLES `jamaahs` WRITE;
/*!40000 ALTER TABLE `jamaahs` DISABLE KEYS */;
INSERT INTO `jamaahs` VALUES (1,'Fulan 1','Jl. Arif Rahman Hakim Deles 4 No. 13, Surabaya','0821356022990','option1','option3','2019-04-13 09:00:13','2019-04-13 22:30:06'),(2,'Fulan 2','Jl. Arif Rahman Hakim Deles 2 No. 7, Surabaya','081335204880','option1','option2','2019-04-13 09:48:15','2019-04-13 09:49:06'),(3,'Fulan 3','Jl. Arif Rahman Hakim Deles 1 No. 7, Surabaya','081396021990','option1','option3','2019-04-13 21:34:04','2019-04-13 21:34:04'),(4,'Fulan 4','Jl. Arif Rahman Hakim Deles 2 No. 6, Surabaya','0856335204880','option2','option1','2019-04-13 21:34:27','2019-04-13 21:34:27');
/*!40000 ALTER TABLE `jamaahs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kegiatans`
--

DROP TABLE IF EXISTS `kegiatans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kegiatans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama_kegiatan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci,
  `lokasi` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `jenis` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kegiatans`
--

LOCK TABLES `kegiatans` WRITE;
/*!40000 ALTER TABLE `kegiatans` DISABLE KEYS */;
INSERT INTO `kegiatans` VALUES (1,'Bukber on The Road','Buka bersama keliling Surabaya','Surabaya Timur','2019-04-13 20:53:00','2019-04-13 22:42:25','option1'),(2,'Distribusi Donasi Romadhon','Pembagian paket donasi per-tanggal 6 Mei-13Mei','Jl. Keputih Tegal','2019-05-30 03:54:00','2019-04-13 22:42:30','option1'),(3,'Distribusi Donasi Romadhon','Pembagian paket donasi per-tanggal 13 Mei-20Mei','Ngagel Jaya','2019-04-21 15:38:00','2019-04-14 08:39:01','option1');
/*!40000 ALTER TABLE `kegiatans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labels`
--

DROP TABLE IF EXISTS `labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `labels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama_label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labels`
--

LOCK TABLES `labels` WRITE;
/*!40000 ALTER TABLE `labels` DISABLE KEYS */;
INSERT INTO `labels` VALUES (1,'Kajian','2019-04-12 21:12:16','2019-04-12 21:12:16'),(2,'Teknologi','2019-04-12 21:15:28','2019-04-12 21:15:28');
/*!40000 ALTER TABLE `labels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES (1,1,'Dashboard','','_self','voyager-dashboard','#000000',NULL,1,'2019-04-12 20:02:59','2019-04-14 08:39:35','voyager.dashboard','null'),(2,1,'Media','','_self','voyager-images',NULL,NULL,8,'2019-04-12 20:02:59','2019-04-13 22:42:52','voyager.media.index',NULL),(3,1,'Users','','_self','voyager-person',NULL,13,1,'2019-04-12 20:02:59','2019-04-12 20:12:32','voyager.users.index',NULL),(4,1,'Roles','','_self','voyager-lock',NULL,13,2,'2019-04-12 20:02:59','2019-04-12 20:12:32','voyager.roles.index',NULL),(5,1,'Tools','','_self','voyager-tools',NULL,NULL,9,'2019-04-12 20:02:59','2019-04-13 22:42:52',NULL,NULL),(6,1,'Menu Builder','','_self','voyager-list',NULL,5,1,'2019-04-12 20:02:59','2019-04-12 20:09:20','voyager.menus.index',NULL),(7,1,'Database','','_self','voyager-data',NULL,5,2,'2019-04-12 20:02:59','2019-04-12 20:09:20','voyager.database.index',NULL),(8,1,'Compass','','_self','voyager-compass',NULL,5,3,'2019-04-12 20:02:59','2019-04-12 20:09:20','voyager.compass.index',NULL),(9,1,'BREAD','','_self','voyager-bread',NULL,5,4,'2019-04-12 20:02:59','2019-04-12 20:09:20','voyager.bread.index',NULL),(10,1,'Settings','','_self','voyager-settings',NULL,NULL,10,'2019-04-12 20:02:59','2019-04-13 22:42:52','voyager.settings.index',NULL),(11,1,'Hooks','','_self','voyager-hook',NULL,5,5,'2019-04-12 20:02:59','2019-04-12 20:09:20','voyager.hooks',NULL),(13,1,'Manage User','','_self','voyager-people','#000000',NULL,7,'2019-04-12 20:11:24','2019-04-13 22:42:52',NULL,''),(15,1,'Artikel','','_self','voyager-file-text','#000000',17,1,'2019-04-12 20:40:04','2019-04-13 08:54:24','voyager.artikels.index','null'),(16,1,'Label','','_self','voyager-tag','#000000',17,2,'2019-04-12 20:47:37','2019-04-13 08:54:31','voyager.labels.index','null'),(17,1,'Manage Konten','','_self','voyager-news','#000000',NULL,6,'2019-04-13 08:38:44','2019-04-13 22:42:52',NULL,''),(18,1,'Manage SDM','','_self','voyager-group','#000000',NULL,4,'2019-04-13 08:49:33','2019-04-13 22:42:52',NULL,''),(19,1,'Jamaah','','_self','voyager-people','#000000',18,1,'2019-04-13 08:53:00','2019-04-13 08:54:05','voyager.jamaahs.index','null'),(20,1,'Struktural','','_self','voyager-people','#000000',18,2,'2019-04-13 09:08:01','2019-04-13 20:51:27','voyager.strukturals.index','null'),(21,1,'Pemasukan','','_self','voyager-double-left','#000000',22,1,'2019-04-13 09:24:58','2019-04-13 09:33:54','voyager.pemasukans.index','null'),(22,1,'Manage Keuangan','','_self','voyager-receipt','#000000',NULL,5,'2019-04-13 09:26:01','2019-04-13 22:42:52',NULL,''),(24,1,'Pengeluaran','','_self','voyager-double-right','#000000',22,2,'2019-04-13 09:46:24','2019-04-13 09:47:17','voyager.pengeluarans.index','null'),(25,1,'Kegiatan','','_self','voyager-calendar','#000000',NULL,2,'2019-04-13 20:34:01','2019-04-14 08:39:35','voyager.kegiatans.index','null'),(26,1,'Pemateri','','_self','voyager-people','#000000',18,3,'2019-04-13 20:37:40','2019-04-13 20:38:16','voyager.pemateris.index','null'),(28,1,'Inventaris','','_self','voyager-folder','#000000',NULL,3,'2019-04-13 22:50:03','2019-04-13 22:50:28','voyager.inventories.index','null');
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'admin','2019-04-12 20:02:59','2019-04-12 20:02:59');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_01_01_000000_add_voyager_user_fields',1),(4,'2016_01_01_000000_create_data_types_table',1),(5,'2016_05_19_173453_create_menu_table',1),(6,'2016_10_21_190000_create_roles_table',1),(7,'2016_10_21_190000_create_settings_table',1),(8,'2016_11_30_135954_create_permission_table',1),(9,'2016_11_30_141208_create_permission_role_table',1),(10,'2016_12_26_201236_data_types__add__server_side',1),(11,'2017_01_13_000000_add_route_to_menu_items_table',1),(12,'2017_01_14_005015_create_translations_table',1),(13,'2017_01_15_000000_make_table_name_nullable_in_permissions_table',1),(14,'2017_03_06_000000_add_controller_to_data_types_table',1),(15,'2017_04_21_000000_add_order_to_data_rows_table',1),(16,'2017_07_05_210000_add_policyname_to_data_types_table',1),(17,'2017_08_05_000000_add_group_to_settings_table',1),(18,'2017_11_26_013050_add_user_role_relationship',1),(19,'2017_11_26_015000_create_user_roles_table',1),(20,'2018_03_11_000000_add_user_settings',1),(21,'2018_03_14_000000_add_details_to_data_types_table',1),(22,'2018_03_16_000000_make_settings_value_nullable',1),(23,'2019_04_14_040323_create_sessions_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pemasukans`
--

DROP TABLE IF EXISTS `pemasukans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pemasukans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jenis` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nominal` decimal(10,0) DEFAULT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pemasukans`
--

LOCK TABLES `pemasukans` WRITE;
/*!40000 ALTER TABLE `pemasukans` DISABLE KEYS */;
INSERT INTO `pemasukans` VALUES (1,'option1',200000,'Dari Hamba Allah','2019-04-13 16:42:00','2019-04-13 09:42:51');
/*!40000 ALTER TABLE `pemasukans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pemateris`
--

DROP TABLE IF EXISTS `pemateris`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pemateris` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama_lengkap` text COLLATE utf8mb4_unicode_ci,
  `alamat` text COLLATE utf8mb4_unicode_ci,
  `no_hp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jenis_kelamin` tinytext COLLATE utf8mb4_unicode_ci,
  `keterangan` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pemateris`
--

LOCK TABLES `pemateris` WRITE;
/*!40000 ALTER TABLE `pemateris` DISABLE KEYS */;
INSERT INTO `pemateris` VALUES (1,'Ustadz ABC','Jl. A. Yani 45 Surabaya','081225604990','option1','Tafsir Hadits','2019-04-13 20:46:21','2019-04-13 20:46:21');
/*!40000 ALTER TABLE `pemateris` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pengeluarans`
--

DROP TABLE IF EXISTS `pengeluarans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pengeluarans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jenis` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nominal` decimal(10,0) DEFAULT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pengeluarans`
--

LOCK TABLES `pengeluarans` WRITE;
/*!40000 ALTER TABLE `pengeluarans` DISABLE KEYS */;
INSERT INTO `pengeluarans` VALUES (1,'option1',50000,'Beli alat pel dan sabun lantai','2019-04-13 10:11:14','2019-04-13 10:11:14'),(2,'option1',20000,'Beli sandal masjid 2x','2019-04-13 17:12:00','2019-04-13 10:12:30');
/*!40000 ALTER TABLE `pengeluarans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_role` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` VALUES (1,1),(1,2),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(32,1),(32,2),(33,1),(33,2),(34,1),(35,1),(36,1),(37,1),(37,2),(38,1),(38,2),(39,1),(40,1),(41,1),(42,1),(42,2),(43,1),(43,2),(44,1),(45,1),(46,1),(47,1),(47,2),(48,1),(48,2),(49,1),(50,1),(51,1),(52,1),(52,2),(53,1),(53,2),(54,1),(55,1),(56,1),(57,1),(57,2),(58,1),(58,2),(59,1),(60,1),(61,1),(62,1),(62,2),(63,1),(63,2),(64,1),(65,1),(66,1),(67,1),(67,2),(68,1),(68,2),(69,1),(70,1),(71,1),(72,1),(72,2),(73,1),(73,2),(74,1),(75,1),(76,1),(77,1),(78,1),(79,1),(80,1),(81,1);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'browse_admin',NULL,'2019-04-12 20:02:59','2019-04-12 20:02:59'),(2,'browse_bread',NULL,'2019-04-12 20:02:59','2019-04-12 20:02:59'),(3,'browse_database',NULL,'2019-04-12 20:02:59','2019-04-12 20:02:59'),(4,'browse_media',NULL,'2019-04-12 20:02:59','2019-04-12 20:02:59'),(5,'browse_compass',NULL,'2019-04-12 20:02:59','2019-04-12 20:02:59'),(6,'browse_menus','menus','2019-04-12 20:02:59','2019-04-12 20:02:59'),(7,'read_menus','menus','2019-04-12 20:02:59','2019-04-12 20:02:59'),(8,'edit_menus','menus','2019-04-12 20:02:59','2019-04-12 20:02:59'),(9,'add_menus','menus','2019-04-12 20:02:59','2019-04-12 20:02:59'),(10,'delete_menus','menus','2019-04-12 20:02:59','2019-04-12 20:02:59'),(11,'browse_roles','roles','2019-04-12 20:02:59','2019-04-12 20:02:59'),(12,'read_roles','roles','2019-04-12 20:02:59','2019-04-12 20:02:59'),(13,'edit_roles','roles','2019-04-12 20:02:59','2019-04-12 20:02:59'),(14,'add_roles','roles','2019-04-12 20:02:59','2019-04-12 20:02:59'),(15,'delete_roles','roles','2019-04-12 20:02:59','2019-04-12 20:02:59'),(16,'browse_users','users','2019-04-12 20:02:59','2019-04-12 20:02:59'),(17,'read_users','users','2019-04-12 20:02:59','2019-04-12 20:02:59'),(18,'edit_users','users','2019-04-12 20:02:59','2019-04-12 20:02:59'),(19,'add_users','users','2019-04-12 20:02:59','2019-04-12 20:02:59'),(20,'delete_users','users','2019-04-12 20:02:59','2019-04-12 20:02:59'),(21,'browse_settings','settings','2019-04-12 20:02:59','2019-04-12 20:02:59'),(22,'read_settings','settings','2019-04-12 20:02:59','2019-04-12 20:02:59'),(23,'edit_settings','settings','2019-04-12 20:02:59','2019-04-12 20:02:59'),(24,'add_settings','settings','2019-04-12 20:02:59','2019-04-12 20:02:59'),(25,'delete_settings','settings','2019-04-12 20:02:59','2019-04-12 20:02:59'),(26,'browse_hooks',NULL,'2019-04-12 20:02:59','2019-04-12 20:02:59'),(32,'browse_artikels','artikels','2019-04-12 20:40:04','2019-04-12 20:40:04'),(33,'read_artikels','artikels','2019-04-12 20:40:04','2019-04-12 20:40:04'),(34,'edit_artikels','artikels','2019-04-12 20:40:04','2019-04-12 20:40:04'),(35,'add_artikels','artikels','2019-04-12 20:40:04','2019-04-12 20:40:04'),(36,'delete_artikels','artikels','2019-04-12 20:40:04','2019-04-12 20:40:04'),(37,'browse_labels','labels','2019-04-12 20:47:37','2019-04-12 20:47:37'),(38,'read_labels','labels','2019-04-12 20:47:37','2019-04-12 20:47:37'),(39,'edit_labels','labels','2019-04-12 20:47:37','2019-04-12 20:47:37'),(40,'add_labels','labels','2019-04-12 20:47:37','2019-04-12 20:47:37'),(41,'delete_labels','labels','2019-04-12 20:47:37','2019-04-12 20:47:37'),(42,'browse_jamaahs','jamaahs','2019-04-13 08:53:00','2019-04-13 08:53:00'),(43,'read_jamaahs','jamaahs','2019-04-13 08:53:00','2019-04-13 08:53:00'),(44,'edit_jamaahs','jamaahs','2019-04-13 08:53:00','2019-04-13 08:53:00'),(45,'add_jamaahs','jamaahs','2019-04-13 08:53:00','2019-04-13 08:53:00'),(46,'delete_jamaahs','jamaahs','2019-04-13 08:53:00','2019-04-13 08:53:00'),(47,'browse_strukturals','strukturals','2019-04-13 09:08:01','2019-04-13 09:08:01'),(48,'read_strukturals','strukturals','2019-04-13 09:08:01','2019-04-13 09:08:01'),(49,'edit_strukturals','strukturals','2019-04-13 09:08:01','2019-04-13 09:08:01'),(50,'add_strukturals','strukturals','2019-04-13 09:08:01','2019-04-13 09:08:01'),(51,'delete_strukturals','strukturals','2019-04-13 09:08:01','2019-04-13 09:08:01'),(52,'browse_keuangans','keuangans','2019-04-13 09:24:58','2019-04-13 09:24:58'),(53,'read_keuangans','keuangans','2019-04-13 09:24:58','2019-04-13 09:24:58'),(54,'edit_keuangans','keuangans','2019-04-13 09:24:58','2019-04-13 09:24:58'),(55,'add_keuangans','keuangans','2019-04-13 09:24:58','2019-04-13 09:24:58'),(56,'delete_keuangans','keuangans','2019-04-13 09:24:58','2019-04-13 09:24:58'),(57,'browse_pemasukans','pemasukans','2019-04-13 09:32:18','2019-04-13 09:32:18'),(58,'read_pemasukans','pemasukans','2019-04-13 09:32:18','2019-04-13 09:32:18'),(59,'edit_pemasukans','pemasukans','2019-04-13 09:32:18','2019-04-13 09:32:18'),(60,'add_pemasukans','pemasukans','2019-04-13 09:32:18','2019-04-13 09:32:18'),(61,'delete_pemasukans','pemasukans','2019-04-13 09:32:18','2019-04-13 09:32:18'),(62,'browse_pengeluarans','pengeluarans','2019-04-13 09:46:24','2019-04-13 09:46:24'),(63,'read_pengeluarans','pengeluarans','2019-04-13 09:46:24','2019-04-13 09:46:24'),(64,'edit_pengeluarans','pengeluarans','2019-04-13 09:46:24','2019-04-13 09:46:24'),(65,'add_pengeluarans','pengeluarans','2019-04-13 09:46:24','2019-04-13 09:46:24'),(66,'delete_pengeluarans','pengeluarans','2019-04-13 09:46:24','2019-04-13 09:46:24'),(67,'browse_kegiatans','kegiatans','2019-04-13 20:34:01','2019-04-13 20:34:01'),(68,'read_kegiatans','kegiatans','2019-04-13 20:34:01','2019-04-13 20:34:01'),(69,'edit_kegiatans','kegiatans','2019-04-13 20:34:01','2019-04-13 20:34:01'),(70,'add_kegiatans','kegiatans','2019-04-13 20:34:01','2019-04-13 20:34:01'),(71,'delete_kegiatans','kegiatans','2019-04-13 20:34:01','2019-04-13 20:34:01'),(72,'browse_pemateris','pemateris','2019-04-13 20:37:40','2019-04-13 20:37:40'),(73,'read_pemateris','pemateris','2019-04-13 20:37:40','2019-04-13 20:37:40'),(74,'edit_pemateris','pemateris','2019-04-13 20:37:40','2019-04-13 20:37:40'),(75,'add_pemateris','pemateris','2019-04-13 20:37:40','2019-04-13 20:37:40'),(76,'delete_pemateris','pemateris','2019-04-13 20:37:40','2019-04-13 20:37:40'),(77,'browse_inventories','inventories','2019-04-13 22:50:03','2019-04-13 22:50:03'),(78,'read_inventories','inventories','2019-04-13 22:50:03','2019-04-13 22:50:03'),(79,'edit_inventories','inventories','2019-04-13 22:50:03','2019-04-13 22:50:03'),(80,'add_inventories','inventories','2019-04-13 22:50:03','2019-04-13 22:50:03'),(81,'delete_inventories','inventories','2019-04-13 22:50:03','2019-04-13 22:50:03');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Administrator','2019-04-12 20:02:59','2019-04-12 20:02:59'),(2,'user','Normal User','2019-04-12 20:02:59','2019-04-12 20:02:59');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('2s8BnbPEIa0ViYhc5qeLhh3t1e3tVd43xzYRkivA',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiOWUyOHJhWmpvQXlmQVQxcDhOcHM1OWx0ZENYbG9BUGJkZFkyRDhwOCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MDp7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjM7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hZG1pbiI7fX0=',1555312219),('lc4h8VNumP9VEW7F6SdjnLypSHd2y0TfBcz0bgBW',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWTVMb0lLeGwxMk9EdXdScG9vamNzcGQzbFlvNENRRUUxQzhtNWthVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hZG1pbi9hc3NldHM/cGF0aD1mb250cyUyRnZveWFnZXIud29mZiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1555312105);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'site.title','Site Title','Masjidku','','text',1,'Site'),(2,'site.description','Site Description','Site Description','','text',2,'Site'),(3,'site.logo','Site Logo','','','image',3,'Site'),(4,'site.google_analytics_tracking_id','Google Analytics Tracking ID',NULL,'','text',4,'Site'),(5,'admin.bg_image','Admin Background Image','settings/April2019/Q5oPQ6uwPjsqcfrDqWVe.jpeg','','image',5,'Admin'),(6,'admin.title','Admin Title','Masjidku','','text',1,'Admin'),(7,'admin.description','Admin Description','Ahlan Wa Sahlan.','','text',2,'Admin'),(8,'admin.loader','Admin Loader','','','image',3,'Admin'),(9,'admin.icon_image','Admin Icon Image','settings/April2019/OO0yFOcKS1lF4vYsqWrj.png','','image',4,'Admin'),(10,'admin.google_analytics_client_id','Google Analytics Client ID (used for admin dashboard)',NULL,'','text',1,'Admin');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strukturals`
--

DROP TABLE IF EXISTS `strukturals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `strukturals` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deskripsi` text COLLATE utf8mb4_unicode_ci,
  `posisi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strukturals`
--

LOCK TABLES `strukturals` WRITE;
/*!40000 ALTER TABLE `strukturals` DISABLE KEYS */;
INSERT INTO `strukturals` VALUES (1,'-','option3','2019-04-13 09:18:33','2019-04-13 09:18:33'),(2,'Dakwah','option2','2019-04-13 10:47:25','2019-04-13 10:47:25');
/*!40000 ALTER TABLE `strukturals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (3,1,'admin','admin@masjidku.com','users/default.png',NULL,'$2y$10$xDCrePgiHogxnIv3RhrIle4cf2eDEbl1ehze9nRPwC9CDgJ9xPiQK','X69kuzkEl8Yri0Hhwn4KEUQWNxsXECr8yzN0fO0gSyaqlWfh4lMJF17lmiaD','{\"locale\":\"en\"}','2019-04-15 00:09:16','2019-04-15 00:09:16');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'masjidku'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-15 14:13:08
