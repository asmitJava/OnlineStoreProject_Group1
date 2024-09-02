-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: online_store
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
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `status` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` bigint NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `price` double NOT NULL,
  `stock_quantity` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `basicdetails` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Smartphone',' \niPhone 15 Pro Max, a titanium marvel, boasts an aerospace-grade build, making it the lightest Pro model ever. The A17 Pro Chip marks a historic leap in Apple GPUs, delivering unparalleled graphics performance and immersive gaming experiences. The camera system shines with a 48 MP Main camera, offering remarkable detail and automatic portrait enhancements. Convenience is key with the Action button for quick tasks and Focus filters. Plus, its USB 3 compatible, revolutionizing data transfer speeds. This iPhone even shares its charging cable with your Mac or iPad. Embrace innovation, cut cable clutter, and elevate your mobile experience with the iPhone 15 Pro Max.',160000,50,'2024-08-29 16:35:54','Apple iPhone 15 Pro Max (1 TB) - Natural Titanium'),(4,'SmartTv',' QLED 108 cm (43 inch) QLED Ultra HD (4K) Smart Google TV 4K Dolby Vision | Dolby Audio |DTS Virtual: X | Vivid Picture Engine 2 with Adaptive Brightness',30699.99,50,'2024-09-01 01:40:00','Samsung 125 cm (50 inches) 4K Ultra HD Smart QLED TV QA50Q60DAULXL (Black)'),(5,'SmartWatch','Revoltt FS1|1.83 Display|BT Calling|Fastcharge|110+ Sports Mode|200+ WatchFaces Smartwatch  (Black Strap, Free Size)',1099.99,30,'2024-09-01 01:40:00','Noise Twist Round dial Smart Watch with Bluetooth Calling, 1.38\" TFT Display, up-to 8 Days Battery, 100+ Watch Faces, IP68, Heart Rate Monitor, Sleep Tracking (Jet Black)'),(6,'Shoe','JORDAN MAX AURA 5-WHITE/GYM RED-BLACK-DZ4353-106-9UK',5000.99,100,'2024-09-01 01:40:00','Nike Mens Jordan Max Aura 5 Running Shoes'),(9,'Laptop','This HeroBook Pro laptop is packed with an array of features to provide seamless operations. Equipped with a 35.81 cm (14.1) IPS screen to view the visuals in 1920x1080 UHD resolution with utmost detailing. This laptop features a powerful Intel Celeron N4020 processor and UHD Graphics 600 so you can enable smooth and efficient multitasking and 4K video playback. The 38 Wh polymer lithium-ion battery offers long-lasting.',60000.99,50,'2024-09-01 17:48:33','High-performance laptop for work and gaming'),(10,'buds','Carry your Pocket Pulse wherever you go - Introducing Boult W20 earbuds. Enjoy an extended 35-hour playtime, ensuring your music never misses a beat. Get back in the game in no time thanks to the Lightning Boult� type C fast charging that grants 120 minutes of playtime with just 10 minutes of charging. Elevate your gaming with Combat� gaming mode, featuring 45ms ultra-low latency for a seamless, competitive edge. Immerse in exceptional sound through BoomX� technology powered by 13mm drivers, delivering an audio experience beyond excellent. Experience crisp and clear calling with Zen� ENC mic, perfect for calls and coordination. ',2000.99,100,'2024-09-01 17:48:33','True wireless earbuds with noise cancellation'),(11,'OneplusPhone','The Qualcomm Snapdragon 7 Gen 3 chipset not only gives your Nord CE4 silly levels of OnePlus Fast and Smooth performance, but it also guards your battery life and maximizes power efficiency.No one likes a slow phone, so OnePlus Nord CE4 comes with 8GB of RAM and up to 8GB of virtual RAM expansion to keep your app switching and loading slick and speedy.',20200.99,100,'2024-09-02 02:56:37','Oneplus Nord CE4 (Celadon Marble, 8GB RAM, 128Gb Storage)'),(12,'OneplusPhone','CAMERA : 50MP Dual Ultra-Clear Rear camera |5MP Front Selfie Camera| AI Portrait Retouching |With the Dual-View Video on, the front and rear cameras can record videos at the same time, which is a new interesting form of video shooting.MEMORY, STORAGE,SIM & PROCESSOR : 6GB RAM|128 GB ROM | Dual 5G Sim Slot |Latest Android 14 Operating System and ColorOS 14.0 System Platform with MediaTek Dimensity 6300',30000,80,'2024-09-02 03:05:06','OPPO A3 5G (Nebula Red, 128 GB)  (6 GB RAM)'),(13,'DellLaptop','DELL Inspiron 3520 Intel Core i5 12th Gen 1235U - (8 GB/512 GB SSD/Windows 11 Home) New Inspiron 15 Laptop Thin and Light Laptop  (15.6 Inch, Carbon Black, 1.65 Kg, With MS Office)Processor: Intel Core i3-1215U 12th Generation (up to 4.40 GHz, 10MB 6 Cores)RAM & Storage: 8 GB, 1 x 8 GB, DDR4, 2666 MHz, (2 DIMM Slots, Expandable up to 16GB) & 512GB SSD Software: Pre-Loaded Windows 11 Home with Lifetime Validity | MS Office Home and Student 2021 with lifetime validity| McAfee Multi-Device Security 15-month subscriptionGraphics & Keyboard: Integrated Onboard Graphics & Standard Keyboard // Display: 15.6\" FHD WVA AG 120Hz 250 nits Narrow Border ',70000.99,50,'2024-09-02 03:11:17','DELL Inspiron 3520 Intel Core i5 12th Gen 1235U - (8 GB/512 GB SSD/Windows 11 Home) New Inspiron 15 Laptop Thin and Light Laptop  (15.6 Inch, Carbon Black, 1.65 Kg, With MS Office)'),(14,'XiomiTV','4K Ultra HD (3840 x 2160) | Refresh Rate : 60 Hertz,Dual Band Wi-Fi | 3 HDMI ports to connect latest gaming consoles, set top box, Blu-ray Players | 2 USB ports to connect hard drives and other USB devices | ALLM | eARC | Bluetooth 5.0 | Optical | Ethernet,30 Watts Output | Dolby Audio | DTS-X | DTS Virtual: XSmart TV Features: Google TV | In-Built WiFi | Screen Mirroring | 2GB RAM | 8GB ROM | Supported Apps: Netflix,Prime Video, YouTube, Disney+Hotstar, etc. | Google Assistant',70000.99,50,'2024-09-02 03:30:03','Xiaomi 138 cm (55 inches) X Series 4K LED Smart Google TV L55MA-AIN (Black)');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Aman','pas123','aman@example.com','2024-08-29 16:34:39'),(2,'Riya','securepass','riya@example.com','2024-08-29 16:34:39'),(3,'Amana','pas123',NULL,'2024-08-29 16:45:16'),(5,'Ananya','pas123','anaya@example.com','2024-08-29 16:46:54'),(6,'Geetha','pas1234','g@gmail.com','2024-08-30 02:09:34'),(7,'Amanaa','pas123','aman@exam.com','2024-08-30 03:09:12'),(8,'Test','test123','test@gmail.com','2024-08-30 03:43:01'),(9,'John','j123','j@gmail.com','2024-08-30 06:45:17'),(10,'Test1','test123','test1@gmail.com','2024-09-01 12:46:41');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'online_store'
--

--
-- Dumping routines for database 'online_store'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-02 10:16:18
