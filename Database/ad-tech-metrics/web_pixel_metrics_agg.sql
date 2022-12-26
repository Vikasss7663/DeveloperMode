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