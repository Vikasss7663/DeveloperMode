 CREATE TABLE IF NOT EXISTS `ledger` (
   `event_id` varchar(50) DEFAULT NULL,
   `banner_id` int(11) NOT NULL,
   `view_id` int(11) DEFAULT '0',
   `ad_set_id` int(11) DEFAULT '0',
   `campaign_id` int(11) NOT NULL,
   `amount` float DEFAULT '0',
   `impression_count` int(11) NOT NULL DEFAULT '0',
   `click_count` int(11) NOT NULL DEFAULT '0',
   `install_count` int(11) NOT NULL DEFAULT '0',
   `video_first_quartile_count` int(11) NOT NULL DEFAULT '0',
   `video_second_quartile_count` int(11) NOT NULL DEFAULT '0',
   `video_third_quartile_count` int(11) NOT NULL DEFAULT '0',
   `video_completed_count` int(11) NOT NULL DEFAULT '0',
   `lead_count` int(11) NOT NULL DEFAULT '0',
   `event_type` tinyint(4) NOT NULL,
   `event_start_time` datetime DEFAULT NULL,
   `event_end_time` datetime DEFAULT NULL,
   `start_time` datetime NOT NULL,
   `end_time` datetime NOT NULL,
   `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
   `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   KEY `idx_metrics_1_campaign_id` (`campaign_id`),
   KEY `idx_metrics_1_banner_id` (`banner_id`),
   KEY `idx_metrics_1_start_time` (`start_time`),
   KEY `idx_metrics_1_end_time` (`end_time`),
   KEY `idx_metrics_1_event_start_time` (`event_start_time`),
   KEY `idx_metrics_1_event_end_time` (`event_end_time`),
   KEY `idx_metrics_1_created_at` (`created_at`),
   KEY `idx_metrics_1_view_id` (`view_id`),
   KEY `idx_metrics_1_ad_set_id` (`ad_set_id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;


 CREATE TABLE IF NOT EXISTS `ledger_agg` (
   `campaign_id` int(11) NOT NULL,
   `banner_id` int(11) NOT NULL,
   `view_id` int(11) DEFAULT '0',
   `ad_set_id` int(11) DEFAULT '0',
   `amount` float NOT NULL DEFAULT '0',
   `impression_count` int(11) NOT NULL DEFAULT '0',
   `click_count` int(11) NOT NULL DEFAULT '0',
   `install_count` int(11) NOT NULL DEFAULT '0',
   `video_first_quartile_count` int(11) NOT NULL DEFAULT '0',
   `video_second_quartile_count` int(11) NOT NULL DEFAULT '0',
   `video_third_quartile_count` int(11) NOT NULL DEFAULT '0',
   `video_completed_count` int(11) NOT NULL DEFAULT '0',
   `lead_count` int(11) NOT NULL DEFAULT '0',
   `ledger_created_at_from` datetime DEFAULT NULL,
   `ledger_created_at_upto` datetime DEFAULT NULL,
   `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
   `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   KEY `idx_metrics_agg_campaign_id` (`campaign_id`),
   KEY `idx_metrics_agg_banner_id` (`banner_id`),
   KEY `idx_metrics_agg_view_id` (`view_id`),
   KEY `idx_metrics_agg_ad_set_id` (`ad_set_id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;


 CREATE TABLE IF NOT EXISTS `partition_agg_status` (
   `id` bigint(20) NOT NULL AUTO_INCREMENT,
   `partition_name` varchar(100) NOT NULL,
   `timestamp` bigint(20) NOT NULL,
   `status` varchar(30) NOT NULL,
   `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
   `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`),
   UNIQUE KEY `uq_partition_name` (`partition_name`),
   UNIQUE KEY `timestamp` (`timestamp`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `offer_partition_agg_status`(
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
   `partition_name` varchar(100) NOT NULL,
   `timestamp` bigint(20) NOT NULL,
   `status` varchar(30) NOT NULL,
   `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
   `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`),
   UNIQUE KEY `uq_partition_name` (`partition_name`),
   UNIQUE KEY `timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


 CREATE TABLE IF NOT EXISTS `web_pixel_metrics` (
   `event_id` varchar(50) DEFAULT NULL,
   `token` varchar(32) NOT NULL,
   `banner_id` int(11) NOT NULL,
   `campaign_id` int(11) NOT NULL,
   `event_start_time` datetime NOT NULL,
   `event_end_time` datetime NOT NULL,
   `start_time` datetime NOT NULL,
   `end_time` datetime NOT NULL,
   `fire_count` int(11) NOT NULL DEFAULT '0',
   `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
   `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
   KEY `idx_pixel_metrics_1_token` (`token`),
   KEY `idx_pixel_metrics_1_start_time` (`start_time`),
   KEY `idx_pixel_metrics_1_end_time` (`end_time`),
   KEY `idx_pixel_metrics_1_event_start_time` (`event_start_time`),
   KEY `idx_pixel_metrics_1_event_end_time` (`event_end_time`),
   KEY `idx_pixel_metrics_1_created_at` (`created_at`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `offer_ledger` (
  `campaign_id` int NOT NULL,
  `deal_product_id` varchar(50) DEFAULT NULL,
  `ad_set_uid` int DEFAULT '0',
  `amount` float DEFAULT '0',
  `distribute_count` int NOT NULL DEFAULT '0',
  `deliver_count` int NOT NULL DEFAULT '0',
  `event_start_time` datetime DEFAULT NULL,
  `event_end_time` datetime DEFAULT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `idx_offer-metrics_1_campaign_id` (`campaign_id`),
  KEY `idx_offer-metrics_1_banner_id` (`deal_product_id`),
  KEY `idx_offer-metrics_1_start_time` (`start_time`),
  KEY `idx_offer-metrics_1_end_time` (`end_time`),
  KEY `idx_offer-metrics_1_event_start_time` (`event_start_time`),
  KEY `idx_offer-metrics_1_event_end_time` (`event_end_time`),
  KEY `idx_offer-metrics_1_created_at` (`created_at`),
  KEY `idx_offer-metrics_1_ad_set_id` (`ad_set_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `offer_ledger_agg` (
  `campaign_id` int NOT NULL,
  `deal_product_id` varchar(50) DEFAULT NULL ,
  `ad_set_uid` int DEFAULT '0',
  `amount` float DEFAULT '0',
  `distribute_count` int NOT NULL DEFAULT '0',
  `deliver_count` int NOT NULL DEFAULT '0',
  `offer_ledger_created_at_from` datetime NOT NULL,
  `offer_ledger_created_at_to` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `idx_offer-metrics_agg_campaign_id` (`campaign_id`),
  KEY `idx_offer-metrics_agg_banner_id` (`deal_product_id`),
  KEY `idx_offer-metrics_agg_ad_set_id` (`ad_set_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

ALTER TABLE ad_tech_metrics.offer_ledger ADD engagement_count int(11) DEFAULT 0 NOT NULL AFTER deliver_count;
ALTER TABLE ad_tech_metrics.offer_ledger_agg ADD engagement_count int(11) DEFAULT 0 NOT NULL AFTER deliver_count;

-- ad_tech_metrics.engagement_meta_data definition

CREATE TABLE `engagement_meta_data` (
  `event_id` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `last_processed_timestamp` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

RENAME TABLE ad_tech_metrics.engagement_meta_data TO ad_tech_metrics.timestamp_meta_data;

SELECT * from information_schema.PARTITIONS p where p.TABLE_NAME  = 'ledger'; 

SELECT PARTITION_NAME, TABLE_ROWS, PARTITION_DESCRIPTION from information_schema.PARTITIONS p where p.TABLE_NAME  = 'web_pixel_metrics'; 

ALTER TABLE ad_tech_metrics.ledger DROP PARTITION p_MAX;

ALTER TABLE ad_tech_metrics.web_pixel_metrics PARTITION BY RANGE(unix_timestamp(`created_at`)) (
	PARTITION p_2000_01_01 VALUES LESS THAN ( UNIX_TIMESTAMP('2000_01_01 00:00:00')),
	PARTITION p_2022_01_12 VALUES LESS THAN ( UNIX_TIMESTAMP('2022_01_12 00:00:00')),
	PARTITION p_2022_01_13 VALUES LESS THAN ( UNIX_TIMESTAMP('2022_01_13 00:00:00')),
	PARTITION p_2022_01_14 VALUES LESS THAN ( UNIX_TIMESTAMP('2022_01_14 00:00:00')),
	PARTITION p_2022_01_15 VALUES LESS THAN ( UNIX_TIMESTAMP('2022_01_15 00:00:00')),
	PARTITION p_2022_01_16 VALUES LESS THAN ( UNIX_TIMESTAMP('2022_01_16 00:00:00')),
	PARTITION p_MAX VALUES LESS THAN MAXVALUE
);

ALTER TABLE ad_tech_metrics.ledger ADD PARTITION ( PARTITION p_2022_01_12 VALUES LESS THAN ( UNIX_TIMESTAMP('2022_01_12 00:00:00')));
ALTER TABLE ad_tech_metrics.ledger ADD PARTITION ( PARTITION p_2022_01_13 VALUES LESS THAN ( UNIX_TIMESTAMP('2022_01_13 00:00:00')));
ALTER TABLE ad_tech_metrics.ledger ADD PARTITION ( PARTITION p_2022_01_14 VALUES LESS THAN ( UNIX_TIMESTAMP('2022_01_14 00:00:00')));
ALTER TABLE ad_tech_metrics.ledger ADD PARTITION ( PARTITION p_2022_01_15 VALUES LESS THAN ( UNIX_TIMESTAMP('2022_01_15 00:00:00')));
ALTER TABLE ad_tech_metrics.ledger ADD PARTITION ( PARTITION p_2022_01_16 VALUES LESS THAN ( UNIX_TIMESTAMP('2022_01_16 00:00:00')));

ALTER TABLE ad_tech_metrics.ledger ADD PARTITION ( PARTITION p_MAX VALUES LESS THAN MAXVALUE);

ALTER TABLE ad_tech_metrics.ledger DROP PARTITION p_2023_01_05;
ALTER TABLE ad_tech_metrics.ledger DROP PARTITION p_2023_01_06;
ALTER TABLE ad_tech_metrics.ledger DROP PARTITION p_2023_01_07;
ALTER TABLE ad_tech_metrics.ledger DROP PARTITION p_2023_01_08;
ALTER TABLE ad_tech_metrics.ledger DROP PARTITION p_2023_01_09;
ALTER TABLE ad_tech_metrics.ledger DROP PARTITION p_2023_01_10;
ALTER TABLE ad_tech_metrics.ledger DROP PARTITION p_2023_01_11;
ALTER TABLE ad_tech_metrics.ledger DROP PARTITION p_2023_01_12;
ALTER TABLE ad_tech_metrics.ledger DROP PARTITION p_2023_01_13;
ALTER TABLE ad_tech_metrics.ledger DROP PARTITION p_2023_01_14;
ALTER TABLE ad_tech_metrics.ledger DROP PARTITION p_2023_01_15;
ALTER TABLE ad_tech_metrics.ledger DROP PARTITION p_2023_01_16;
ALTER TABLE ad_tech_metrics.ledger DROP PARTITION p_2023_01_17;
ALTER TABLE ad_tech_metrics.ledger DROP PARTITION p_2023_01_18;
ALTER TABLE ad_tech_metrics.ledger DROP PARTITION p_2023_01_19;
ALTER TABLE ad_tech_metrics.ledger DROP PARTITION p_2023_01_20;
ALTER TABLE ad_tech_metrics.ledger DROP PARTITION p_2023_01_21;
ALTER TABLE ad_tech_metrics.ledger DROP PARTITION p_2023_01_22;
ALTER TABLE ad_tech_metrics.ledger DROP PARTITION p_2023_01_23;
ALTER TABLE ad_tech_metrics.ledger DROP PARTITION p_2023_01_24;
ALTER TABLE ad_tech_metrics.ledger DROP PARTITION p_2023_01_25;
ALTER TABLE ad_tech_metrics.ledger DROP PARTITION p_2023_01_26;
ALTER TABLE ad_tech_metrics.ledger DROP PARTITION p_2023_01_27;
ALTER TABLE ad_tech_metrics.ledger DROP PARTITION p_2023_01_28;
ALTER TABLE ad_tech_metrics.ledger DROP PARTITION p_2023_01_29;
ALTER TABLE ad_tech_metrics.ledger DROP PARTITION p_2023_01_30;
ALTER TABLE ad_tech_metrics.ledger DROP PARTITION p_2023_01_31;



INSERT INTO ad_tech_metrics.ledger (event_id, banner_id, view_id, ad_set_id, campaign_id, amount, impression_count, click_count, install_count, video_first_quartile_count, video_second_quartile_count, video_third_quartile_count, video_completed_count, lead_count, event_type, event_start_time, event_end_time, start_time, end_time, created_at, updated_at) VALUES('aedaa1cc-2ce0-419f-a4b7-efd10e39de12', 200055, 40673, 10568, 5148, 15000.0, 0, 1000, 0, 0, 0, 0, 0, 0, 2, NULL, NULL, '2022-01-13 03:29:00', '2022-01-13 03:30:00', '2022-01-13 03:30:00', '2022-01-13 03:30:00');
INSERT INTO ad_tech_metrics.ledger (event_id, banner_id, view_id, ad_set_id, campaign_id, amount, impression_count, click_count, install_count, video_first_quartile_count, video_second_quartile_count, video_third_quartile_count, video_completed_count, lead_count, event_type, event_start_time, event_end_time, start_time, end_time, created_at, updated_at) VALUES('aedaa1cc-2ce0-419f-a4b7-efd10e39de14', 200071, 40672, 10598, 5159, 10000.0, 0, 0, 0, 0, 0, 0, 0, 100, 10, NULL, NULL, '2022-01-15 03:29:00', '2022-01-15 03:30:00', '2022-01-15 03:30:00', '2022-01-15 03:30:00');
INSERT INTO ad_tech_metrics.ledger (event_id, banner_id, view_id, ad_set_id, campaign_id, amount, impression_count, click_count, install_count, video_first_quartile_count, video_second_quartile_count, video_third_quartile_count, video_completed_count, lead_count, event_type, event_start_time, event_end_time, start_time, end_time, created_at, updated_at) VALUES('aedaa1cc-2ce0-419f-a4b7-efd10e39de15', 200071, 40672, 10598, 5159, 0.0, 500, 0, 0, 0, 0, 0, 0, 0, 1, NULL, NULL, '2022-01-15 03:29:00', '2022-01-15 03:30:00', '2022-01-15 03:30:00', '2022-01-15 03:30:00');
INSERT INTO ad_tech_metrics.ledger (event_id, banner_id, view_id, ad_set_id, campaign_id, amount, impression_count, click_count, install_count, video_first_quartile_count, video_second_quartile_count, video_third_quartile_count, video_completed_count, lead_count, event_type, event_start_time, event_end_time, start_time, end_time, created_at, updated_at) VALUES('aedaa1cc-2ce0-419f-a4b7-efd10e39de16', 200093, 40673, 10622, 5162, 10000.0, 40000, 0, 0, 0, 0, 0, 0, 0, 1, NULL, NULL, '2022-01-19 03:29:00', '2022-01-19 03:30:00', '2022-01-19 03:30:00', '2022-01-19 03:30:00');
INSERT INTO ad_tech_metrics.ledger (event_id, banner_id, view_id, ad_set_id, campaign_id, amount, impression_count, click_count, install_count, video_first_quartile_count, video_second_quartile_count, video_third_quartile_count, video_completed_count, lead_count, event_type, event_start_time, event_end_time, start_time, end_time, created_at, updated_at) VALUES('aedaa1cc-2ce0-419f-a4b7-efd10e39de16', 200071, 40672, 10622, 5162, 36000.0, 100, 0, 0, 0, 0, 0, 0, 0, 1, NULL, NULL, '2022-01-28 13:29:00', '2022-01-28 13:30:00', '2022-01-28 13:30:00', '2022-01-28 13:30:00');
INSERT INTO ad_tech_metrics.ledger (event_id, banner_id, view_id, ad_set_id, campaign_id, amount, impression_count, click_count, install_count, video_first_quartile_count, video_second_quartile_count, video_third_quartile_count, video_completed_count, lead_count, event_type, event_start_time, event_end_time, start_time, end_time, created_at, updated_at) VALUES('bd8ceebe-9280-40bf-8269-0301e4e7faac', 201886, 40672, 11893, 5823, 3.0, 100, 0, 0, 0, 0, 0, 0, 0, 1, NULL, NULL, '2022-07-25 10:34:55', '2022-07-25 10:34:56', '2022-07-25 05:17:53', '2022-07-25 05:17:53');
INSERT INTO ad_tech_metrics.ledger (event_id, banner_id, view_id, ad_set_id, campaign_id, amount, impression_count, click_count, install_count, video_first_quartile_count, video_second_quartile_count, video_third_quartile_count, video_completed_count, lead_count, event_type, event_start_time, event_end_time, start_time, end_time, created_at, updated_at) VALUES('bd8ceebe-9280-40bf-8269-0301e4e7faac', 201886, 40672, 11893, 5823, 3.0, 100, 0, 0, 0, 0, 0, 0, 0, 1, NULL, NULL, '2022-07-25 10:34:55', '2022-07-25 10:34:56', '2022-07-25 06:01:21', '2022-07-25 06:01:21');
INSERT INTO ad_tech_metrics.ledger (event_id, banner_id, view_id, ad_set_id, campaign_id, amount, impression_count, click_count, install_count, video_first_quartile_count, video_second_quartile_count, video_third_quartile_count, video_completed_count, lead_count, event_type, event_start_time, event_end_time, start_time, end_time, created_at, updated_at) VALUES('bd8ceebe-9280-40bf-8269-0301e4e7faan', 202406, 40670, 76495, 6171, 10000.0, 0, 200, 0, 0, 0, 0, 0, 0, 2, NULL, NULL, '2022-09-15 14:44:00', '2022-09-15 15:00:00', '2022-09-15 14:44:00', '2022-09-15 14:44:00');
INSERT INTO ad_tech_metrics.ledger (event_id, banner_id, view_id, ad_set_id, campaign_id, amount, impression_count, click_count, install_count, video_first_quartile_count, video_second_quartile_count, video_third_quartile_count, video_completed_count, lead_count, event_type, event_start_time, event_end_time, start_time, end_time, created_at, updated_at) VALUES('bd8ceebe-9280-40bf-8269-0301e4e7faan', 202407, 40670, 76474, 6172, 20002.0, 0, 400, 0, 0, 0, 0, 0, 0, 2, NULL, NULL, '2022-09-15 14:44:00', '2022-09-15 15:00:00', '2022-09-15 14:44:00', '2022-09-15 08:14:57');
INSERT INTO ad_tech_metrics.ledger (event_id, banner_id, view_id, ad_set_id, campaign_id, amount, impression_count, click_count, install_count, video_first_quartile_count, video_second_quartile_count, video_third_quartile_count, video_completed_count, lead_count, event_type, event_start_time, event_end_time, start_time, end_time, created_at, updated_at) VALUES('bd8ceebe-9280-40bf-8269-0301e4e7faan', 202408, 40670, 76475, 6173, 19995.0, 0, 400, 0, 0, 0, 0, 0, 0, 2, NULL, NULL, '2022-09-15 14:44:00', '2022-09-15 15:00:00', '2022-09-15 14:44:00', '2022-09-15 08:16:38');
INSERT INTO ad_tech_metrics.ledger (event_id, banner_id, view_id, ad_set_id, campaign_id, amount, impression_count, click_count, install_count, video_first_quartile_count, video_second_quartile_count, video_third_quartile_count, video_completed_count, lead_count, event_type, event_start_time, event_end_time, start_time, end_time, created_at, updated_at) VALUES('bd8ceebe-9280-40bf-8269-0301e4e7fban', 202857, 40670, 78052, 6436, 30.0, 0, 6, 0, 0, 0, 0, 0, 0, 2, NULL, NULL, '2022-10-26 14:44:00', '2022-10-26 14:45:00', '2022-10-26 10:44:00', '2022-10-26 10:44:00');



INSERT INTO ad_tech_metrics.web_pixel_metrics (event_id, token, banner_id, campaign_id, event_start_time, event_end_time, start_time, end_time, fire_count, created_at, updated_at) VALUES('1592828132595', '111222', 0, 0, '2020-06-22 17:45:32', '2020-06-22 17:45:33', '2020-06-22 17:45:31', '2020-06-22 17:45:33', 39, '2020-06-22 12:16:04', '2020-06-22 12:16:04');
INSERT INTO ad_tech_metrics.web_pixel_metrics (event_id, token, banner_id, campaign_id, event_start_time, event_end_time, start_time, end_time, fire_count, created_at, updated_at) VALUES('1592828169355', '111222', 0, 0, '2020-06-22 17:46:08', '2020-06-22 17:46:09', '2020-06-22 17:46:07', '2020-06-22 17:46:09', 39, '2020-06-22 12:16:21', '2020-06-22 12:16:21');
INSERT INTO ad_tech_metrics.web_pixel_metrics (event_id, token, banner_id, campaign_id, event_start_time, event_end_time, start_time, end_time, fire_count, created_at, updated_at) VALUES('1592828182248', '111222', 0, 0, '2020-06-22 17:46:21', '2020-06-22 17:46:22', '2020-06-22 17:46:20', '2020-06-22 17:46:22', 39, '2020-06-22 12:16:34', '2020-06-22 12:16:34');
INSERT INTO ad_tech_metrics.web_pixel_metrics (event_id, token, banner_id, campaign_id, event_start_time, event_end_time, start_time, end_time, fire_count, created_at, updated_at) VALUES('1592828194928', '111222', 0, 0, '2020-06-22 17:46:33', '2020-06-22 17:46:34', '2020-06-22 17:46:32', '2020-06-22 17:46:34', 39, '2020-06-22 12:16:44', '2020-06-22 12:16:44');
INSERT INTO ad_tech_metrics.web_pixel_metrics (event_id, token, banner_id, campaign_id, event_start_time, event_end_time, start_time, end_time, fire_count, created_at, updated_at) VALUES('1592828207802', '111222', 0, 0, '2020-06-22 17:46:46', '2020-06-22 17:46:47', '2020-06-22 17:46:45', '2020-06-22 17:46:47', 39, '2020-06-22 12:16:56', '2020-06-22 12:16:56');
INSERT INTO ad_tech_metrics.web_pixel_metrics (event_id, token, banner_id, campaign_id, event_start_time, event_end_time, start_time, end_time, fire_count, created_at, updated_at) VALUES('1592828216982', '111222', 0, 0, '2020-06-22 17:46:55', '2020-06-22 17:46:56', '2020-06-22 17:46:54', '2020-06-22 17:46:56', 39, '2020-06-22 12:17:10', '2020-06-22 12:17:10');
INSERT INTO ad_tech_metrics.web_pixel_metrics (event_id, token, banner_id, campaign_id, event_start_time, event_end_time, start_time, end_time, fire_count, created_at, updated_at) VALUES('1592828230770', '111222', 0, 0, '2020-06-22 17:47:09', '2020-06-22 17:47:10', '2020-06-22 17:47:08', '2020-06-22 17:47:10', 39, '2020-06-22 12:17:20', '2020-06-22 12:17:20');
INSERT INTO ad_tech_metrics.web_pixel_metrics (event_id, token, banner_id, campaign_id, event_start_time, event_end_time, start_time, end_time, fire_count, created_at, updated_at) VALUES('1592828240463', '111222', 0, 0, '2020-06-22 17:47:19', '2020-06-22 17:47:20', '2020-06-22 17:47:18', '2020-06-22 17:47:20', 39, '2020-06-22 12:17:31', '2020-06-22 12:17:31');
INSERT INTO ad_tech_metrics.web_pixel_metrics (event_id, token, banner_id, campaign_id, event_start_time, event_end_time, start_time, end_time, fire_count, created_at, updated_at) VALUES('1592828251854', '111222', 0, 0, '2020-06-22 17:47:30', '2020-06-22 17:47:31', '2020-06-22 17:47:29', '2020-06-22 17:47:31', 39, '2020-06-22 12:17:41', '2020-06-22 12:17:41');
INSERT INTO ad_tech_metrics.web_pixel_metrics (event_id, token, banner_id, campaign_id, event_start_time, event_end_time, start_time, end_time, fire_count, created_at, updated_at) VALUES('1592828262871', '111222', 0, 0, '2020-06-22 17:47:41', '2020-06-22 17:47:42', '2020-06-22 17:47:40', '2020-06-22 17:47:42', 39, '2020-06-22 12:17:51', '2020-06-22 12:17:51');
INSERT INTO ad_tech_metrics.web_pixel_metrics (event_id, token, banner_id, campaign_id, event_start_time, event_end_time, start_time, end_time, fire_count, created_at, updated_at) VALUES('9dc445d8-b862-4b28-90b5-cf3cdb5cd6c0', 'aaaabbb', 0, 0, '2020-06-22 18:30:00', '2020-06-22 19:00:00', '2020-06-22 18:38:00', '2020-06-22 18:39:00', 1, '2020-06-22 13:09:00', '2020-06-22 13:09:00');
INSERT INTO ad_tech_metrics.web_pixel_metrics (event_id, token, banner_id, campaign_id, event_start_time, event_end_time, start_time, end_time, fire_count, created_at, updated_at) VALUES('3a719adc-a096-4adf-9abc-00ee9457ba69', '6D772C636A204A21', 0, 0, '2020-06-22 18:30:00', '2020-06-22 19:00:00', '2020-06-22 18:39:00', '2020-06-22 18:40:00', 1, '2020-06-22 13:10:00', '2020-06-22 13:10:00');
INSERT INTO ad_tech_metrics.web_pixel_metrics (event_id, token, banner_id, campaign_id, event_start_time, event_end_time, start_time, end_time, fire_count, created_at, updated_at) VALUES('9ca08764-6791-4f98-a675-5145e8bba009', '6D772C636A204A21', 0, 0, '2020-06-22 18:30:00', '2020-06-22 19:00:00', '2020-06-22 18:40:00', '2020-06-22 18:41:00', 2, '2020-06-22 13:11:00', '2020-06-22 13:11:00');
INSERT INTO ad_tech_metrics.web_pixel_metrics (event_id, token, banner_id, campaign_id, event_start_time, event_end_time, start_time, end_time, fire_count, created_at, updated_at) VALUES('7e1ead83-f58a-4747-9d46-e54e65f35ea9', '6D772C636A204A21', 0, 0, '2020-06-22 18:30:00', '2020-06-22 19:00:00', '2020-06-22 18:45:00', '2020-06-22 18:46:00', 2, '2020-06-22 13:16:00', '2020-06-22 13:16:00');
INSERT INTO ad_tech_metrics.web_pixel_metrics (event_id, token, banner_id, campaign_id, event_start_time, event_end_time, start_time, end_time, fire_count, created_at, updated_at) VALUES('62aef3de-d410-4e28-afe1-22112bb7b6ce', '6D772C636A204A21', 0, 0, '2020-06-22 18:30:00', '2020-06-22 19:00:00', '2020-06-22 18:46:00', '2020-06-22 18:47:00', 1, '2020-06-22 13:17:00', '2020-06-22 13:17:00');
INSERT INTO ad_tech_metrics.web_pixel_metrics (event_id, token, banner_id, campaign_id, event_start_time, event_end_time, start_time, end_time, fire_count, created_at, updated_at) VALUES('69ec890e-decd-4281-90c9-988030343f1d', '6D772C636A204A21', 0, 0, '2020-06-22 18:30:00', '2020-06-22 19:00:00', '2020-06-22 18:47:00', '2020-06-22 18:48:00', 1, '2020-06-22 13:18:00', '2020-06-22 13:18:00');
INSERT INTO ad_tech_metrics.web_pixel_metrics (event_id, token, banner_id, campaign_id, event_start_time, event_end_time, start_time, end_time, fire_count, created_at, updated_at) VALUES('135e5797-db06-4b55-bc75-a81e1c2178f5', '6D772C636A204A21', 0, 0, '2020-06-22 18:30:00', '2020-06-22 19:00:00', '2020-06-22 18:48:00', '2020-06-22 18:49:00', 1, '2020-06-22 13:19:00', '2020-06-22 13:19:00');
INSERT INTO ad_tech_metrics.web_pixel_metrics (event_id, token, banner_id, campaign_id, event_start_time, event_end_time, start_time, end_time, fire_count, created_at, updated_at) VALUES('46895062-d7fe-43c9-ab83-ac90deaa97ca', '6D772C636A204A21', 0, 0, '2020-06-22 18:30:00', '2020-06-22 19:00:00', '2020-06-22 18:50:00', '2020-06-22 18:51:00', 6, '2020-06-22 13:21:00', '2020-06-22 13:21:00');
INSERT INTO ad_tech_metrics.web_pixel_metrics (event_id, token, banner_id, campaign_id, event_start_time, event_end_time, start_time, end_time, fire_count, created_at, updated_at) VALUES('775f03c9-9025-4a09-840a-51118930863f', 'cccddd', 0, 0, '2020-06-22 18:30:00', '2020-06-22 19:00:00', '2020-06-22 18:54:00', '2020-06-22 18:55:00', 1, '2020-06-22 13:25:00', '2020-06-22 13:25:00');
INSERT INTO ad_tech_metrics.web_pixel_metrics (event_id, token, banner_id, campaign_id, event_start_time, event_end_time, start_time, end_time, fire_count, created_at, updated_at) VALUES('e45f0d6c-a927-434e-b389-3ceeece28050', 'cccddd', 0, 0, '2020-06-22 18:30:00', '2020-06-22 19:00:00', '2020-06-22 18:55:00', '2020-06-22 18:56:00', 1, '2020-06-22 13:26:00', '2020-06-22 13:26:00');
INSERT INTO ad_tech_metrics.web_pixel_metrics (event_id, token, banner_id, campaign_id, event_start_time, event_end_time, start_time, end_time, fire_count, created_at, updated_at) VALUES('6a164a11-2368-43e8-aa26-6bbced7ea6f2', 'cccddd', 0, 0, '2020-06-22 18:30:00', '2020-06-22 19:00:00', '2020-06-22 18:57:00', '2020-06-22 18:58:00', 3, '2020-06-22 13:28:00', '2020-06-22 13:28:00');
INSERT INTO ad_tech_metrics.web_pixel_metrics (event_id, token, banner_id, campaign_id, event_start_time, event_end_time, start_time, end_time, fire_count, created_at, updated_at) VALUES('06b294bb-db95-4dc8-873e-5bd6aabc649c', 'cccddd', 0, 0, '2020-06-22 18:30:00', '2020-06-22 19:00:00', '2020-06-22 18:58:00', '2020-06-22 18:59:00', 6, '2020-06-22 13:29:00', '2020-06-22 13:29:00');
INSERT INTO ad_tech_metrics.web_pixel_metrics (event_id, token, banner_id, campaign_id, event_start_time, event_end_time, start_time, end_time, fire_count, created_at, updated_at) VALUES('1592834242636', '111222', 0, 0, '2020-06-22 19:27:22', '2020-06-22 19:27:23', '2020-06-22 19:27:21', '2020-06-22 19:27:23', 39, '2020-06-22 13:57:36', '2020-06-22 13:57:36');
INSERT INTO ad_tech_metrics.web_pixel_metrics (event_id, token, banner_id, campaign_id, event_start_time, event_end_time, start_time, end_time, fire_count, created_at, updated_at) VALUES('1592834258151', '111222', 0, 0, '2020-06-22 19:27:37', '2020-06-22 19:27:38', '2020-06-22 19:27:36', '2020-06-22 19:27:38', 39, '2020-06-22 13:57:49', '2020-06-22 13:57:49');
INSERT INTO ad_tech_metrics.web_pixel_metrics (event_id, token, banner_id, campaign_id, event_start_time, event_end_time, start_time, end_time, fire_count, created_at, updated_at) VALUES('1592834269945', '111222', 0, 0, '2020-06-22 19:27:48', '2020-06-22 19:27:49', '2020-06-22 19:27:47', '2020-06-22 19:27:49', 39, '2020-06-22 13:57:57', '2020-06-22 13:57:57');
INSERT INTO ad_tech_metrics.web_pixel_metrics (event_id, token, banner_id, campaign_id, event_start_time, event_end_time, start_time, end_time, fire_count, created_at, updated_at) VALUES('5e9edc16-c12e-4691-9548-43c6080104ee', 'aaaabbb', 0, 0, '2020-06-22 20:30:00', '2020-06-22 21:00:00', '2020-06-22 20:40:00', '2020-06-22 20:41:00', 2, '2020-06-22 15:11:00', '2020-06-22 15:11:00');
INSERT INTO ad_tech_metrics.web_pixel_metrics (event_id, token, banner_id, campaign_id, event_start_time, event_end_time, start_time, end_time, fire_count, created_at, updated_at) VALUES('f05b2115-c05b-4690-8646-1b483b73b1c2', 'aaaabbb', 0, 0, '2020-06-30 00:30:00', '2020-06-30 01:00:00', '2020-06-30 03:27:00', '2020-06-30 03:28:00', 1, '2020-06-29 21:58:00', '2020-06-29 21:58:00');
INSERT INTO ad_tech_metrics.web_pixel_metrics (event_id, token, banner_id, campaign_id, event_start_time, event_end_time, start_time, end_time, fire_count, created_at, updated_at) VALUES('ad1f8f8b-1381-49d3-b427-1e00ae2ecd7f', 'aaaabbb', 0, 0, '2020-06-30 05:00:00', '2020-06-30 05:30:00', '2020-06-30 05:00:00', '2020-06-30 05:01:00', 1, '2020-06-29 23:31:00', '2020-06-29 23:31:00');
INSERT INTO ad_tech_metrics.web_pixel_metrics (event_id, token, banner_id, campaign_id, event_start_time, event_end_time, start_time, end_time, fire_count, created_at, updated_at) VALUES('a6cd73a6-e1fe-4daa-b815-633b42922e25', 'aaaabbb', 0, 0, '2020-07-04 12:30:00', '2020-07-04 13:00:00', '2020-07-04 12:57:00', '2020-07-04 12:58:00', 1, '2020-07-04 07:28:00', '2020-07-04 07:28:00');
INSERT INTO ad_tech_metrics.web_pixel_metrics (event_id, token, banner_id, campaign_id, event_start_time, event_end_time, start_time, end_time, fire_count, created_at, updated_at) VALUES('2246a6bc-d40e-45b3-a359-62d25393924d', 'token1', 0, 0, '2020-07-14 08:30:00', '2020-07-14 09:00:00', '2020-07-14 08:33:00', '2020-07-14 08:34:00', 2, '2020-07-14 03:04:00', '2020-07-14 03:04:00');
INSERT INTO ad_tech_metrics.web_pixel_metrics (event_id, token, banner_id, campaign_id, event_start_time, event_end_time, start_time, end_time, fire_count, created_at, updated_at) VALUES('a2703d7d-9cd1-4592-be20-54d7fd8917e3', '{token}', 0, 0, '2020-07-14 08:30:00', '2020-07-14 09:00:00', '2020-07-14 08:33:00', '2020-07-14 08:34:00', 1, '2020-07-14 03:04:00', '2020-07-14 03:04:00');
INSERT INTO ad_tech_metrics.web_pixel_metrics (event_id, token, banner_id, campaign_id, event_start_time, event_end_time, start_time, end_time, fire_count, created_at, updated_at) VALUES('a120c65e-7a3b-48d7-a50b-13a935396a5d', 'aaaabbb', 0, 0, '2020-07-14 09:30:00', '2020-07-14 10:00:00', '2020-07-14 09:45:00', '2020-07-14 09:46:00', 1, '2020-07-14 04:16:00', '2020-07-14 04:16:00');
INSERT INTO ad_tech_metrics.web_pixel_metrics (event_id, token, banner_id, campaign_id, event_start_time, event_end_time, start_time, end_time, fire_count, created_at, updated_at) VALUES('29a2880c-e357-42c7-8f0e-ce4d93f31010', 'aaaabbb', 0, 0, '2020-07-14 09:30:00', '2020-07-14 10:00:00', '2020-07-14 09:46:00', '2020-07-14 09:47:00', 1, '2020-07-14 04:17:00', '2020-07-14 04:17:00');
INSERT INTO ad_tech_metrics.web_pixel_metrics (event_id, token, banner_id, campaign_id, event_start_time, event_end_time, start_time, end_time, fire_count, created_at, updated_at) VALUES('e019eea6-5b55-4e84-b4d0-9faf3853951c', 'aaaabbb', 0, 0, '2020-07-14 09:30:00', '2020-07-14 10:00:00', '2020-07-14 09:47:00', '2020-07-14 09:48:00', 2, '2020-07-14 04:18:00', '2020-07-14 04:18:00');

CREATE TABLE IF NOT EXISTS `web_pixel_metrics_partition_agg_status`(
   `id` bigint(20) NOT NULL AUTO_INCREMENT,
   `partition_name` varchar(100) NOT NULL,
   `timestamp` bigint(20) NOT NULL,
   `status` varchar(30) NOT NULL,
   `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
   `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`),
   UNIQUE KEY `uq_partition_name` (`partition_name`),
   UNIQUE KEY `timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

 CREATE TABLE IF NOT EXISTS `web_pixel_metrics_agg` (
   `token` varchar(32) NOT NULL,
   `banner_id` int(11) NOT NULL,
   `campaign_id` int(11) NOT NULL,
   `event_start_time` datetime NOT NULL,
   `event_end_time` datetime NOT NULL,
   `start_time` datetime NOT NULL,
   `end_time` datetime NOT NULL,
   `fire_count` int(11) NOT NULL DEFAULT '0',
   `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
   `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
   KEY `idx_pixel_metrics_agg_1_token` (`token`),
   KEY `idx_pixel_metrics_agg_1_created_at` (`created_at`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE ad_tech_metrics.web_pixel_metrics PARTITION BY RANGE(unix_timestamp(`created_at`)) (
  PARTITION p_2020_06_23 VALUES LESS THAN (UNIX_TIMESTAMP('2020_06_23 00:00:00')),
  PARTITION p_2020_06_24 VALUES LESS THAN (UNIX_TIMESTAMP('2020_07_23 00:00:00')),
  PARTITION p_2023_01_30 VALUES LESS THAN (UNIX_TIMESTAMP('2020_08_23 00:00:00')),
  PARTITION p_2023_01_31 VALUES LESS THAN (UNIX_TIMESTAMP('2020_09_23 00:00:00')),
  PARTITION p_2023_01_31 VALUES LESS THAN (UNIX_TIMESTAMP('2020_10_23 00:00:00')),
  PARTITION p_MAX VALUES LESS THAN MAXVALUE
);

SELECT * from web_pixel_metrics wpm ;

SELECT campaign_id, banner_id, token, MIN(event_start_time) as event_start_time, MAX(event_end_time) as event_end_time, MIN(start_time) as start_time, MAX(end_time) as end_time, Sum(fire_count) as fire_count, Count(1) as agg_count FROM web_pixel_metrics PARTITION(p_2020_06_23) WHERE created_at >= '2020-06-22 00:00:00' AND created_at < '2020-06-23 00:00:00' GROUP BY campaign_id, banner_id, token;

INSERT INTO web_pixel_metrics_agg ( `campaign_id`, `banner_id`, `token`,  `event_start_time`,`event_end_time`, `start_time`,`end_time`, `fire_count` ) VALUES ( 0, 0, 'aaaabbb',  '2020-06-22T18:30', '2020-06-22T19:00',  '2020-06-22T18:38', '2020-06-22T18:39',  1);

SELECT token, MIN(event_start_time) as first_fired, MAX(event_end_time) as last_fired, SUM(fire_count) as count_fired FROM web_pixel_metrics_agg WHERE token = 'aaaabbb' group by token

SELECT token, MIN(event_start_time) as first_fired, MAX(event_end_time) as last_fired, SUM(fire_count) as count_fired FROM web_pixel_metrics WHERE token = '111222' group by token
