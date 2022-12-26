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
