-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: coffee_shop_db
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Freeze','Đồ uống đá xay mát lạnh với nhiều hương vị như chocolate, caramel, trà xanh','2026-04-15 07:17:12'),(2,'Phindi','Cà phê phin thế hệ mới kết hợp với các hương vị hiện đại như kem sữa, hạnh nhân, chocolate','2026-04-15 07:17:12'),(3,'Trà','Các loại trà đạm vị truyền thống , quen thuộc với người dùng','2026-04-15 07:17:12'),(4,'Đá xay','Thức uống xay lạnh với đá, sữa và các hương vị trái cây hoặc cà phê','2026-04-15 07:17:12'),(5,'Bánh ngọt','ngonnnnnnnn','2026-04-15 16:33:21');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount_codes`
--

DROP TABLE IF EXISTS `discount_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount_codes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount_type` enum('percent','fixed') COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount_value` int NOT NULL,
  `min_order_value` int DEFAULT '0',
  `expires_at` datetime DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount_codes`
--

LOCK TABLES `discount_codes` WRITE;
/*!40000 ALTER TABLE `discount_codes` DISABLE KEYS */;
INSERT INTO `discount_codes` VALUES (1,'WELCOME10','percent',10,0,NULL,1,'2026-04-15 16:05:27'),(2,'GIAM20K','fixed',20000,100000,NULL,1,'2026-04-15 16:05:27'),(3,'VIP50K','fixed',50000,300000,NULL,1,'2026-04-15 16:05:27');
/*!40000 ALTER TABLE `discount_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_verifications`
--

DROP TABLE IF EXISTS `email_verifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_verifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashed_password` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `verification_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `verified` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_verifications`
--

LOCK TABLES `email_verifications` WRITE;
/*!40000 ALTER TABLE `email_verifications` DISABLE KEYS */;
INSERT INTO `email_verifications` VALUES (1,'Test Email OTP','0900000000','otp-test@example.com','scrypt:32768:8:1$3vwBMe5rHLRzgKiz$085c7bb22508fcdabc271e9e7a379789adbb57f6478a73bff5b9ba23c6539438b27f0caf4dd7867a3afab39115b790f6154681bdc13ca672c5502c556292f34d','409541','2026-04-15 11:58:35','2026-04-15 04:53:35',0),(3,'na','1123123','naman@gmail.com','scrypt:32768:8:1$ivu8gZkyX9XnMD3M$74c20df2421f2ff9a085df1b8e811ba5250310fd7fdbdc52050e946e938028c4fb9adbad407468d8b34ea6b6d21828b1294963a04b7d5b20e3c49d68d5a023cb','654676','2026-04-15 12:25:52','2026-04-15 05:20:52',0);
/*!40000 ALTER TABLE `email_verifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_discounts`
--

DROP TABLE IF EXISTS `order_discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_discounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `discount_code_id` int DEFAULT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount_type` enum('percent','fixed') COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount_value` int NOT NULL,
  `discount_amount` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `order_discounts_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_discounts`
--

LOCK TABLES `order_discounts` WRITE;
/*!40000 ALTER TABLE `order_discounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `price` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,1,1,25000),(2,1,2,2,30000),(3,2,4,1,40000),(4,3,6,1,45000),(5,4,6,1,45000),(8,6,6,1,45000),(9,7,6,1,45000),(10,8,6,1,45000),(12,9,6,1,45000),(15,16,6,2,45000),(16,17,3,1,35000),(17,18,9,13,45000),(18,19,12,10,45000),(19,20,13,1,45000),(20,21,4,1,35000),(21,21,2,1,30000),(22,22,4,1,35000),(23,22,4,1,35000),(24,22,8,1,45000),(25,23,17,1,35000);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `total_amount` int NOT NULL,
  `shipping_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` enum('cash','transfer') COLLATE utf8mb4_unicode_ci DEFAULT 'cash',
  `payment_status` enum('unpaid','paid','refunded') COLLATE utf8mb4_unicode_ci DEFAULT 'unpaid',
  `status` enum('pending','processing','completed','cancelled') COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,2,85000,'123 Lê Lợi, Quận 1','cash','unpaid','pending','2026-04-12 06:29:40'),(2,2,40000,'456 Nguyễn Trãi, Quận 5','transfer','paid','completed','2026-04-12 06:29:40'),(3,7,45000,'123','transfer','unpaid','processing','2026-04-13 15:16:45'),(4,7,45000,'123','transfer','paid','processing','2026-04-13 15:53:04'),(6,7,45000,'123','cash','unpaid','completed','2026-04-13 15:56:46'),(7,7,45000,'213','transfer','paid','processing','2026-04-13 16:13:03'),(8,7,45000,'123','transfer','paid','processing','2026-04-13 16:31:04'),(9,7,45000,'hjg','transfer','paid','pending','2026-04-13 17:07:04'),(16,6,90000,'123','transfer','paid','completed','2026-04-13 17:53:34'),(17,6,35000,'123','transfer','paid','processing','2026-04-13 18:25:18'),(18,7,585000,'123123','cash','unpaid','pending','2026-04-15 16:07:34'),(19,7,450000,'123124','cash','unpaid','pending','2026-04-15 16:08:04'),(20,7,45000,'123123','transfer','unpaid','pending','2026-04-15 16:09:20'),(21,9,65000,'123213','cash','unpaid','processing','2026-04-15 16:34:57'),(22,9,115000,'123','cash','unpaid','completed','2026-04-15 16:35:37'),(23,7,35000,'123','transfer','unpaid','pending','2026-04-18 09:58:16');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `verification_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `verified` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_transactions`
--

DROP TABLE IF EXISTS `payment_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_transactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `gateway` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` int NOT NULL,
  `transfer_content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `raw_data` json DEFAULT NULL,
  `status` enum('pending','success','failed') COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `confirmed_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `payment_transactions_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_transactions`
--

LOCK TABLES `payment_transactions` WRITE;
/*!40000 ALTER TABLE `payment_transactions` DISABLE KEYS */;
INSERT INTO `payment_transactions` VALUES (1,16,'vietqr','TEST-DH16','VCB','1027982130',90000,'KCAFE-DH16','{\"amount\": 90000, \"transactionCode\": \"TEST-DH16\", \"transferContent\": \"KCAFE-DH16\"}','success','2026-04-13 17:53:34','2026-04-13 18:09:53'),(2,17,'vietqr','TEST-DH17','VCB','1027982130',35000,'KCAFE-DH17','{\"amount\": 35000, \"transactionCode\": \"TEST-DH17\", \"transferContent\": \"KCAFE-DH17\"}','success','2026-04-13 18:25:18','2026-04-13 18:26:23'),(3,20,'vietqr',NULL,'VCB','1027982130',45000,'KCAFE-DH20','{\"order_id\": 20, \"transfer_content\": \"KCAFE-DH20\"}','pending','2026-04-15 16:09:20',NULL),(4,23,'vietqr',NULL,'VCB','1027982130',35000,'KCAFE-DH23','{\"order_id\": 23, \"transfer_content\": \"KCAFE-DH23\"}','pending','2026-04-18 09:58:16',NULL);
/*!40000 ALTER TABLE `payment_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_webhook_logs`
--

DROP TABLE IF EXISTS `payment_webhook_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_webhook_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` json NOT NULL,
  `received_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `processed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_webhook_logs`
--

LOCK TABLES `payment_webhook_logs` WRITE;
/*!40000 ALTER TABLE `payment_webhook_logs` DISABLE KEYS */;
INSERT INTO `payment_webhook_logs` VALUES (1,'vietqr','payment_callback','{\"amount\": 40000, \"transactionCode\": \"TEST-WEBHOOK-2\", \"transferContent\": \"KCAFE-DH2\"}','2026-04-13 17:04:06',0),(2,'vietqr','payment_callback','{\"amount\": 40000, \"transactionCode\": \"TEST-WEBHOOK-2\", \"transferContent\": \"KCAFE-DH2\"}','2026-04-13 17:04:21',1),(3,'vietqr','payment_callback','{\"amount\": 90000, \"transactionCode\": \"TEST-DH16\", \"transferContent\": \"KCAFE-DH16\"}','2026-04-13 18:09:53',0),(4,'vietqr','payment_callback','{\"amount\": 90000, \"transactionCode\": \"TEST-DH16-RETRY\", \"transferContent\": \"KCAFE-DH16\"}','2026-04-13 18:10:57',1),(5,'vietqr','payment_callback','{\"amount\": 90000, \"transactionCode\": \"TEST-DH16\", \"transferContent\": \"KCAFE-DH16\"}','2026-04-13 18:12:01',1),(6,'vietqr','payment_callback','{\"amount\": 90000, \"transactionCode\": \"TEST-DH16\", \"transferContent\": \"KCAFE-DH16\"}','2026-04-13 18:14:49',1),(7,'vietqr','payment_callback','{\"amount\": 35000, \"transactionCode\": \"TEST-DH17\", \"transferContent\": \"KCAFE-DH17\"}','2026-04-13 18:26:23',1);
/*!40000 ALTER TABLE `payment_webhook_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `amount` int NOT NULL,
  `provider` enum('vietqr','momo','zalopay','cash') COLLATE utf8mb4_unicode_ci NOT NULL,
  `transfer_content` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_ref` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','success','failed') COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `paid_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transfer_content` (`transfer_content`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` int NOT NULL,
  `stock` int DEFAULT '0',
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'default-product.png',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,1,'Cà phê đen đá','Cà phê đen đá truyền thống, hương vị đậm đà, hậu vị sâu lắng đặc trưng của cà phê Việt Nam.',25000,50,'cafe_den_da.png','active','2026-04-15 07:17:12'),(2,1,'Cà phê sữa đá','Cà phê sữa đá với sự hòa quyện giữa cà phê đậm và sữa đặc béo ngậy, dễ uống và quen thuộc.',30000,50,'cafe_sua_da.png','active','2026-04-15 07:17:12'),(3,1,'Cà phê xỉu đá','Cà phê xỉu đá với vị ngọt dịu, nhiều sữa hơn, phù hợp cho người thích nhẹ nhàng.',30000,50,'cafe_xiu_da.png','active','2026-04-15 07:17:12'),(4,1,'Espresso','Espresso đậm đặc, chiết xuất từ hạt cà phê nguyên chất với lớp crema mịn.',35000,50,'espresso.png','active','2026-04-15 07:17:12'),(5,1,'Cappuccino đá','Cappuccino đá với sự kết hợp giữa espresso và sữa, cân bằng vị đắng và béo.',40000,50,'product_4c714d4a13364d2d8bcc3702c5f9d376.png','active','2026-04-15 07:17:12'),(6,1,'Latte đá','Latte đá nhẹ nhàng, nhiều sữa, phù hợp thưởng thức hàng ngày.',40000,50,'latte_da.png','active','2026-04-15 07:17:12'),(7,2,'Freeze chocolate','Freeze chocolate đá xay mát lạnh, vị chocolate đậm đà và kem béo.',45000,50,'freeze_chocolate.png','active','2026-04-15 07:17:12'),(8,2,'Freeze cookie cream','Freeze cookie cream với bánh cookie nghiền, vị ngọt béo hấp dẫn.',45000,50,'freeze_cookie_cream.png','active','2026-04-15 07:17:12'),(9,2,'Freeze phin caramel','Freeze phin caramel kết hợp cà phê phin và caramel ngọt ngào.',45000,50,'freeze_phin_caramel.png','active','2026-04-15 07:17:12'),(10,2,'Freeze phin classic','Freeze phin classic giữ nguyên vị cà phê truyền thống kết hợp đá xay.',45000,50,'freeze_phin_classic.png','active','2026-04-15 07:17:12'),(11,2,'Freeze trà xanh','Freeze trà xanh thanh mát, kết hợp matcha và sữa.',45000,50,'freeze_tra_xanh.png','active','2026-04-15 07:17:12'),(12,2,'Phindi chocolate','Phindi chocolate kết hợp cà phê và chocolate tạo vị mới lạ.',45000,50,'phindi_choco.png','active','2026-04-15 07:17:12'),(13,2,'Phindi hạnh nhân','Phindi hạnh nhân thơm bùi, kết hợp cà phê đậm vị.',45000,50,'phindi_hanh_nhan.png','active','2026-04-15 07:17:12'),(14,2,'Phindi kem sữa','Phindi kem sữa béo mịn, dễ uống và nhẹ nhàng.',45000,50,'phindi_kem_sua.png','active','2026-04-15 07:17:12'),(15,3,'Trà sen vàng','Trà sen vàng thanh khiết, hương thơm nhẹ nhàng.',35000,50,'tra_sen_vang.png','active','2026-04-15 07:17:12'),(16,3,'Trà thạch đào','Trà thạch đào chua ngọt, topping thạch dai.',35000,50,'tra_thach_dao.png','active','2026-04-15 07:17:12'),(17,3,'Trà thạch vải','Trà thạch vải ngọt thanh, giải nhiệt tốt.',35000,50,'tra_thach_vai.png','active','2026-04-15 07:17:12'),(18,3,'Trà thanh đào','Trà thanh đào tươi mát, dễ uống.',35000,50,'tra_thanh_dao.png','active','2026-04-15 07:17:12'),(19,3,'Trà xanh đậu đỏ','Trà xanh đậu đỏ kết hợp vị thanh và béo.',35000,50,'tra_xanh_dau_do.png','active','2026-04-15 07:17:12');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','user','customer') COLLATE utf8mb4_unicode_ci DEFAULT 'customer',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'default-avatar.png',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Đặng Xuân Hiệp','0901234567','admin@kcafe.com','scrypt:32768:8:1$dummyhashadmin$123456','admin','Khu Công Nghệ Cao, TP.Thủ Đức','hiep-avatar.png','2026-04-11 19:55:36'),(2,'Nguyễn Văn Khách','0911222333','khach1@gmail.com','scrypt:32768:8:1$dummyhashuser1$123456','customer','123 Lê Lợi, Quận 1, TP.HCM','default-avatar.png','2026-04-11 19:55:36'),(3,'Trần Thu Thủy','0988777666','thuthuy_tran@yahoo.com','scrypt:32768:8:1$dummyhashuser2$123456','customer','456 Nguyễn Trãi, Thanh Xuân, Hà Nội','default-avatar.png','2026-04-11 19:55:36'),(4,'Lê Cà Phê','0933444555','lecaphe_99@outlook.com','scrypt:32768:8:1$dummyhashuser3$123456','customer',NULL,'default-avatar.png','2026-04-11 19:55:36'),(5,'Phạm Tín Đồ','0909000999','pham.tindo.cafe@gmail.com','scrypt:32768:8:1$dummyhashuser4$123456','customer','789 Trần Hưng Đạo, Đà Nẵng','default-avatar.png','2026-04-11 19:55:36'),(6,'namanh','123','nam@gmail.com','scrypt:32768:8:1$rQyMHJJphMg9dr2C$139eaccb1097676a418ee04a1968d4c835d57951985d475362096ea845e67d6c3f2f1b02dbdc2f4868a533d0628099c7fbde62df12432482776f078479f65c3d','admin','123','user_6_e28b0ef995b742b99a16ef9fb2d2400c.png','2026-04-11 20:04:01'),(7,'namanh','123','khachhang1@gmail.com','scrypt:32768:8:1$TIA9TP0Zof8yzcOY$b227d7d15d1313fa4b2a749abaafec139ff99e6e63ac8207206242d53a87d6fe76ddb3354ccc3b300e91fa744bcf6b38d0e176bd000210325b7f232d12c2c39e','customer',NULL,'default-avatar.png','2026-04-12 04:37:18'),(8,'namanh','123','123','scrypt:32768:8:1$lSOAtefOEzPhtNjx$5cac9f2fc537abb0bff06bddf3c3fcbf22e4c2c3cb77c20e8e2e7d73afa9be59cf6037529fff00e10d8de074d230944e7daa3be4af2ef22ce7a9de17fd9a98f0','customer',NULL,'default-avatar.png','2026-04-12 06:18:50'),(9,'nam anh','123','namanhtran9122004@gmail.com','scrypt:32768:8:1$YtnMThVHK4FnRdWI$6a2a4814b8897ba848d57027556944fb18b4ac428f50c0424f72715bb32cf983a18e979d7718fe02a24349f60cb5e5c3ef8a56ce3a781fee0bec024f5aa12b41','customer','','default-avatar.png','2026-04-15 06:40:55'),(10,'trannamanh','123123','namanhtran09122004@gmail.com','scrypt:32768:8:1$Br6rRoBWilKA9MQG$c879ed3d4d7de1deb20c342e6a1a3895ac27d3b272f0820fa39d4bac33dac0c13fea25000c3183224361b6d0599c25694a5593393c2fb146c7678fd17b7bf0f8','customer','123123','default-avatar.png','2026-04-15 16:36:53');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-23  8:56:12
