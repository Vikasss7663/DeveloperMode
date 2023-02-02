SELECT PARTITION_NAME, TABLE_ROWS, PARTITION_DESCRIPTION from information_schema.PARTITIONS p where p.TABLE_NAME  = 'web_pixel_metrics'; 

-- delete max partition
ALTER TABLE ad_tech_metrics.web_pixel_metrics DROP PARTITION p_MAX;

-- create partition
ALTER TABLE ad_tech_metrics.web_pixel_metrics ADD PARTITION ( PARTITION p_2023_02_01 VALUES LESS THAN ( UNIX_TIMESTAMP('2023-02-01 00:00:00')));

-- add max partition
ALTER TABLE ad_tech_metrics.web_pixel_metrics ADD PARTITION ( PARTITION p_MAX VALUES LESS THAN MAXVALUE);