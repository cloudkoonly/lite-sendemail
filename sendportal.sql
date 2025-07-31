-- MySQL dump 10.13  Distrib 5.7.36, for Linux (x86_64)
--
-- Host: localhost    Database: sendportal
-- ------------------------------------------------------
-- Server version	5.7.36-log

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
-- Table structure for table `api_tokens`
--

DROP TABLE IF EXISTS `api_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `api_token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `workspace_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_tokens_api_token_unique` (`api_token`),
  KEY `api_tokens_workspace_id_index` (`workspace_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_tokens`
--

LOCK TABLES `api_tokens` WRITE;
/*!40000 ALTER TABLE `api_tokens` DISABLE KEYS */;
INSERT INTO `api_tokens` VALUES (1,'JGxFbjsibx6RceTH0VUREnDn7J7GP7S3','test',1,'2023-10-28 08:01:41','2023-10-28 08:01:41');
/*!40000 ALTER TABLE `api_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invitations`
--

DROP TABLE IF EXISTS `invitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invitations` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `workspace_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `invitations_token_unique` (`token`),
  KEY `invitations_workspace_id_index` (`workspace_id`),
  KEY `invitations_user_id_index` (`user_id`),
  CONSTRAINT `invitations_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invitations`
--

LOCK TABLES `invitations` WRITE;
/*!40000 ALTER TABLE `invitations` DISABLE KEYS */;
/*!40000 ALTER TABLE `invitations` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2017_04_11_000000_create_workspaces_table',1),(4,'2017_04_11_100000_create_invitations_table',1),(5,'2017_04_11_133343_create_email_service_tables',1),(6,'2017_04_12_6000_create_unsubscribed_table',1),(7,'2017_04_28_223029_create_campaign_statuses_table',1),(8,'2017_04_28_223840_create_subscribers_table',1),(9,'2017_04_28_223844_create_segments_table',1),(10,'2017_04_28_223854_create_segment_subscriber_table',1),(11,'2017_04_28_223906_create_templates_table',1),(12,'2017_04_28_223915_create_campaigns_table',1),(13,'2017_05_02_104440_create_campaign_segment_table',1),(14,'2019_07_10_194325_create_messages_table',1),(15,'2019_07_30_153117_create_message_urls_table',1),(16,'2019_08_19_000000_create_failed_jobs_table',1),(17,'2019_08_24_114758_adjust_users_table',1),(18,'2020_01_23_153845_create_message_failures_table',1),(19,'2020_06_16_072116_adjust_campaign_content',1),(20,'2020_06_16_072137_adjust_template_content',1),(21,'2020_07_17_072137_add_cancelled_campaign_status',1),(22,'2020_08_04_085127_add_mailjet_email_service',1),(23,'2020_10_02_152306_drop_segment_name_unique',1),(24,'2020_10_16_092234_prefix_tables',1),(25,'2020_11_13_120125_create_api_tokens_table',1),(26,'2021_01_26_151747_remove_api_token_from_users_table',1),(27,'2021_01_29_121118_rename_segments_to_tags',1),(28,'2021_02_26_110520_add_smtp_email_service_type',1),(29,'2021_10_22_202820_add_postal_email_service_type',1);
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
-- Table structure for table `sendportal_campaign_statuses`
--

DROP TABLE IF EXISTS `sendportal_campaign_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sendportal_campaign_statuses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sendportal_campaign_statuses`
--

LOCK TABLES `sendportal_campaign_statuses` WRITE;
/*!40000 ALTER TABLE `sendportal_campaign_statuses` DISABLE KEYS */;
INSERT INTO `sendportal_campaign_statuses` VALUES (1,'Draft'),(2,'Queued'),(3,'Sending'),(4,'Sent'),(5,'Cancelled');
/*!40000 ALTER TABLE `sendportal_campaign_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sendportal_campaign_tag`
--

DROP TABLE IF EXISTS `sendportal_campaign_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sendportal_campaign_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` int(10) unsigned NOT NULL,
  `campaign_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sendportal_campaign_segment_campaign_id_foreign` (`campaign_id`),
  KEY `sendportal_campaign_segment_tag_id_foreign` (`tag_id`),
  CONSTRAINT `sendportal_campaign_segment_campaign_id_foreign` FOREIGN KEY (`campaign_id`) REFERENCES `sendportal_campaigns` (`id`),
  CONSTRAINT `sendportal_campaign_segment_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `sendportal_tags` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sendportal_campaign_tag`
--

LOCK TABLES `sendportal_campaign_tag` WRITE;
/*!40000 ALTER TABLE `sendportal_campaign_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `sendportal_campaign_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sendportal_campaigns`
--

DROP TABLE IF EXISTS `sendportal_campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sendportal_campaigns` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `workspace_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` int(10) unsigned NOT NULL DEFAULT '1',
  `template_id` int(10) unsigned DEFAULT NULL,
  `email_service_id` int(10) unsigned DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `from_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_open_tracking` tinyint(1) NOT NULL DEFAULT '1',
  `is_click_tracking` tinyint(1) NOT NULL DEFAULT '1',
  `sent_count` mediumint(9) DEFAULT '0',
  `open_count` mediumint(9) DEFAULT '0',
  `click_count` mediumint(9) DEFAULT '0',
  `send_to_all` tinyint(1) NOT NULL DEFAULT '0',
  `save_as_draft` tinyint(1) NOT NULL DEFAULT '1',
  `scheduled_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sendportal_campaigns_status_id_foreign` (`status_id`),
  KEY `sendportal_campaigns_template_id_foreign` (`template_id`),
  KEY `sendportal_campaigns_email_service_id_foreign` (`email_service_id`),
  KEY `sendportal_campaigns_workspace_id_index` (`workspace_id`),
  CONSTRAINT `sendportal_campaigns_email_service_id_foreign` FOREIGN KEY (`email_service_id`) REFERENCES `sendportal_email_services` (`id`),
  CONSTRAINT `sendportal_campaigns_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `sendportal_campaign_statuses` (`id`),
  CONSTRAINT `sendportal_campaigns_template_id_foreign` FOREIGN KEY (`template_id`) REFERENCES `sendportal_templates` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sendportal_campaigns`
--

LOCK TABLES `sendportal_campaigns` WRITE;
/*!40000 ALTER TABLE `sendportal_campaigns` DISABLE KEYS */;
INSERT INTO `sendportal_campaigns` VALUES (1,1,'test',2,NULL,2,'test','<p>test<br></p>','test','727403273@qq.com',0,0,0,0,0,1,0,'2023-10-30 08:00:27','2023-10-28 07:58:36','2023-10-30 08:00:27');
/*!40000 ALTER TABLE `sendportal_campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sendportal_email_service_types`
--

DROP TABLE IF EXISTS `sendportal_email_service_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sendportal_email_service_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sendportal_email_service_types`
--

LOCK TABLES `sendportal_email_service_types` WRITE;
/*!40000 ALTER TABLE `sendportal_email_service_types` DISABLE KEYS */;
INSERT INTO `sendportal_email_service_types` VALUES (1,'SES','2023-10-28 07:52:48','2023-10-28 07:52:48'),(2,'SendGrid','2023-10-28 07:52:48','2023-10-28 07:52:48'),(3,'Mailgun','2023-10-28 07:52:48','2023-10-28 07:52:48'),(4,'Postmark','2023-10-28 07:52:48','2023-10-28 07:52:48'),(5,'Mailjet','2023-10-28 07:52:50','2023-10-28 07:52:50'),(6,'SMTP','2023-10-28 07:52:51','2023-10-28 07:52:51'),(7,'Postal','2023-10-28 07:52:51','2023-10-28 07:52:51');
/*!40000 ALTER TABLE `sendportal_email_service_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sendportal_email_services`
--

DROP TABLE IF EXISTS `sendportal_email_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sendportal_email_services` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `workspace_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_id` int(10) unsigned NOT NULL,
  `settings` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sendportal_email_services_type_id_foreign` (`type_id`),
  KEY `sendportal_email_services_workspace_id_index` (`workspace_id`),
  CONSTRAINT `sendportal_email_services_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `sendportal_email_service_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sendportal_email_services`
--

LOCK TABLES `sendportal_email_services` WRITE;
/*!40000 ALTER TABLE `sendportal_email_services` DISABLE KEYS */;
INSERT INTO `sendportal_email_services` VALUES (1,1,'ses',1,'eyJpdiI6Ii9TbDQxdU5QUS9wNWQ3eitpZXlBd2c9PSIsInZhbHVlIjoiZTZJbmxWS29haU9IVGt0cVlBQk9Oc1hoZENpM0o4L3VPRnhkS1B1NkVQT2R5ZkM1OUR4Q3VUV25HWU9DbFVzRzJsTDBnb080UUdaVFR5bW5QMFB6RjVuN041QnZJVHl3SXRxeDdMa25zUkFKVDVXaGc2cmxPYnhreUYyOWhWZWkiLCJtYWMiOiIwNTBiMjg3YWYyMmNmNDg4ZWQ5ZDc0OTgyY2JlM2JmMDE1M2UyMzBhMGQyNWNjNjdlYjQyMTU4YTdmM2FlM2Y3IiwidGFnIjoiIn0=','2023-10-28 07:58:16','2023-10-28 07:58:16'),(2,1,'aws smtp',6,'eyJpdiI6IjhEUXZpZFZzS1Nxbkd6Y3pRS0cvWnc9PSIsInZhbHVlIjoiM3ZTUUR2NzZyYVp3YVNNdGI2WFA4RzdsOGxmMTFZZDV0UVhCK3JNcC9sV2ZuTU9mdXROWFZ4bXB2RlJJUVhGaVpHQjc2ZlhlTGxlc0VhYUc5dTZkYjBrTGhST1d1UnpCNEtGV2tHOStjUm9rMjZ5WWpsM0RkUlhuL0pSRDJyNDhmQmFIZGVBVWRONGwvTUs5VnVaajJXbVNzcUdzd2RJUzZnbEE0dENXemRydzd0UWt1bWd6bHFNZG1tTy8zREVrbWltTzhNLzR4TDVQMThsVU40WDQ3bExNeG1yMW51V1U4TTlKWVd0SVkvQmx1R1JCZngwZDZRazdmeXVSTWp4eSIsIm1hYyI6IjYzZmEyNzdlNWJlMjhiZmRjZmMyM2I1MmMzYmQ4M2UwM2QwNWRiY2RkMzNkMDA3Zjg5ZGIwMDNkMWMwZTViNDAiLCJ0YWciOiIifQ==','2023-10-30 02:51:39','2023-10-30 02:51:39');
/*!40000 ALTER TABLE `sendportal_email_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sendportal_message_failures`
--

DROP TABLE IF EXISTS `sendportal_message_failures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sendportal_message_failures` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `message_id` int(10) unsigned NOT NULL,
  `severity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `failed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sendportal_message_failures_message_id_foreign` (`message_id`),
  CONSTRAINT `sendportal_message_failures_message_id_foreign` FOREIGN KEY (`message_id`) REFERENCES `sendportal_messages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sendportal_message_failures`
--

LOCK TABLES `sendportal_message_failures` WRITE;
/*!40000 ALTER TABLE `sendportal_message_failures` DISABLE KEYS */;
/*!40000 ALTER TABLE `sendportal_message_failures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sendportal_message_urls`
--

DROP TABLE IF EXISTS `sendportal_message_urls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sendportal_message_urls` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source_id` int(10) unsigned NOT NULL,
  `hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `click_count` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sendportal_message_urls_source_type_index` (`source_type`),
  KEY `sendportal_message_urls_source_id_index` (`source_id`),
  KEY `sendportal_message_urls_hash_index` (`hash`),
  KEY `sendportal_message_urls_url_index` (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sendportal_message_urls`
--

LOCK TABLES `sendportal_message_urls` WRITE;
/*!40000 ALTER TABLE `sendportal_message_urls` DISABLE KEYS */;
/*!40000 ALTER TABLE `sendportal_message_urls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sendportal_messages`
--

DROP TABLE IF EXISTS `sendportal_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sendportal_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hash` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `workspace_id` int(10) unsigned NOT NULL,
  `subscriber_id` int(10) unsigned NOT NULL,
  `source_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source_id` int(10) unsigned NOT NULL,
  `recipient_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `open_count` int(10) unsigned NOT NULL DEFAULT '0',
  `click_count` int(10) unsigned NOT NULL DEFAULT '0',
  `queued_at` timestamp NULL DEFAULT NULL,
  `sent_at` timestamp NULL DEFAULT NULL,
  `delivered_at` timestamp NULL DEFAULT NULL,
  `bounced_at` timestamp NULL DEFAULT NULL,
  `unsubscribed_at` timestamp NULL DEFAULT NULL,
  `complained_at` timestamp NULL DEFAULT NULL,
  `opened_at` timestamp NULL DEFAULT NULL,
  `clicked_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sendportal_messages_hash_unique` (`hash`),
  KEY `sendportal_messages_workspace_id_index` (`workspace_id`),
  KEY `sendportal_messages_subscriber_id_index` (`subscriber_id`),
  KEY `sendportal_messages_source_type_index` (`source_type`),
  KEY `sendportal_messages_source_id_index` (`source_id`),
  KEY `sendportal_messages_message_id_index` (`message_id`),
  KEY `sendportal_messages_queued_at_index` (`queued_at`),
  KEY `sendportal_messages_sent_at_index` (`sent_at`),
  KEY `sendportal_messages_delivered_at_index` (`delivered_at`),
  KEY `sendportal_messages_bounced_at_index` (`bounced_at`),
  KEY `sendportal_messages_unsubscribed_at_index` (`unsubscribed_at`),
  KEY `sendportal_messages_complained_at_index` (`complained_at`),
  KEY `sendportal_messages_opened_at_index` (`opened_at`),
  KEY `sendportal_messages_clicked_at_index` (`clicked_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sendportal_messages`
--

LOCK TABLES `sendportal_messages` WRITE;
/*!40000 ALTER TABLE `sendportal_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `sendportal_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sendportal_subscribers`
--

DROP TABLE IF EXISTS `sendportal_subscribers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sendportal_subscribers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `workspace_id` int(10) unsigned NOT NULL,
  `hash` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta` json DEFAULT NULL,
  `unsubscribed_at` timestamp NULL DEFAULT NULL,
  `unsubscribe_event_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sendportal_subscribers_hash_unique` (`hash`),
  KEY `sendportal_subscribers_created_at_index` (`created_at`),
  KEY `sendportal_subscribers_unsubscribe_event_id_foreign` (`unsubscribe_event_id`),
  KEY `sendportal_subscribers_workspace_id_index` (`workspace_id`),
  KEY `sendportal_subscribers_email_index` (`email`),
  KEY `sendportal_subscribers_unsubscribed_at_index` (`unsubscribed_at`),
  CONSTRAINT `sendportal_subscribers_unsubscribe_event_id_foreign` FOREIGN KEY (`unsubscribe_event_id`) REFERENCES `sendportal_unsubscribe_event_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sendportal_subscribers`
--

LOCK TABLES `sendportal_subscribers` WRITE;
/*!40000 ALTER TABLE `sendportal_subscribers` DISABLE KEYS */;
INSERT INTO `sendportal_subscribers` VALUES (1,1,'f9325464-d8f6-4be4-b444-7c07f32f02e4','test@qq.com','a','b',NULL,NULL,NULL,'2023-10-28 07:59:23','2023-10-28 07:59:23');
/*!40000 ALTER TABLE `sendportal_subscribers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sendportal_tag_subscriber`
--

DROP TABLE IF EXISTS `sendportal_tag_subscriber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sendportal_tag_subscriber` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` int(10) unsigned NOT NULL,
  `subscriber_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sendportal_segment_subscriber_subscriber_id_foreign` (`subscriber_id`),
  KEY `sendportal_segment_subscriber_tag_id_foreign` (`tag_id`),
  CONSTRAINT `sendportal_segment_subscriber_subscriber_id_foreign` FOREIGN KEY (`subscriber_id`) REFERENCES `sendportal_subscribers` (`id`),
  CONSTRAINT `sendportal_segment_subscriber_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `sendportal_tags` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sendportal_tag_subscriber`
--

LOCK TABLES `sendportal_tag_subscriber` WRITE;
/*!40000 ALTER TABLE `sendportal_tag_subscriber` DISABLE KEYS */;
/*!40000 ALTER TABLE `sendportal_tag_subscriber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sendportal_tags`
--

DROP TABLE IF EXISTS `sendportal_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sendportal_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `workspace_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sendportal_segments_workspace_id_index` (`workspace_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sendportal_tags`
--

LOCK TABLES `sendportal_tags` WRITE;
/*!40000 ALTER TABLE `sendportal_tags` DISABLE KEYS */;
INSERT INTO `sendportal_tags` VALUES (1,1,'Hello','2023-10-28 07:59:34','2023-10-28 07:59:34');
/*!40000 ALTER TABLE `sendportal_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sendportal_templates`
--

DROP TABLE IF EXISTS `sendportal_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sendportal_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `workspace_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sendportal_templates_workspace_id_index` (`workspace_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sendportal_templates`
--

LOCK TABLES `sendportal_templates` WRITE;
/*!40000 ALTER TABLE `sendportal_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `sendportal_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sendportal_unsubscribe_event_types`
--

DROP TABLE IF EXISTS `sendportal_unsubscribe_event_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sendportal_unsubscribe_event_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sendportal_unsubscribe_event_types`
--

LOCK TABLES `sendportal_unsubscribe_event_types` WRITE;
/*!40000 ALTER TABLE `sendportal_unsubscribe_event_types` DISABLE KEYS */;
INSERT INTO `sendportal_unsubscribe_event_types` VALUES (1,'Bounce'),(2,'Complaint'),(3,'Manual by Admin'),(4,'Manual by Subscriber');
/*!40000 ALTER TABLE `sendportal_unsubscribe_event_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_workspace_id` int(10) unsigned DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_api_token_unique` (`api_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'test','727403273@qq.com','2023-10-28 07:53:28','$2y$10$JTTukSfkGk6vajGvdWY5geSKAiuAh4//e.NMZu9lO3kikukUpcbpG',NULL,1,'sYgJpX1qxFsJqRf4fSOcL1ZJlkbbMxbOn0JnI4W8DUNryTPCAxLqjtu5RCOG','en','2023-10-28 07:53:28','2023-10-28 07:55:11');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workspace_users`
--

DROP TABLE IF EXISTS `workspace_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workspace_users` (
  `workspace_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `role` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `workspace_users_workspace_id_user_id_unique` (`workspace_id`,`user_id`),
  KEY `workspace_users_user_id_index` (`user_id`),
  CONSTRAINT `workspace_users_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workspace_users`
--

LOCK TABLES `workspace_users` WRITE;
/*!40000 ALTER TABLE `workspace_users` DISABLE KEYS */;
INSERT INTO `workspace_users` VALUES (1,1,'owner','2023-10-28 07:53:28','2023-10-28 07:53:28');
/*!40000 ALTER TABLE `workspace_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workspaces`
--

DROP TABLE IF EXISTS `workspaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workspaces` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `workspaces_owner_id_index` (`owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workspaces`
--

LOCK TABLES `workspaces` WRITE;
/*!40000 ALTER TABLE `workspaces` DISABLE KEYS */;
INSERT INTO `workspaces` VALUES (1,1,'Test','2023-10-28 07:53:28','2023-10-28 07:53:28');
/*!40000 ALTER TABLE `workspaces` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-01  8:19:59
