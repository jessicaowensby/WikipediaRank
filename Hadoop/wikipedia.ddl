------
-- jessica.owensby@gmail.com
-- store data as sequence file
-----
CREATE DATABASE IF NOT EXISTS wikipedia;

use wikipedia;

CREATE TABLE IF NOT EXISTS page_counts  
(
language STRING,
page_name STRING,
non_unique_views INT,
bytes_transferred INT
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ' '
LINES TERMINATED BY '\n';

-- 
--CREATE TABLE IF NOT EXISTS page_counts_sequence
--(
--language STRING,
--page_name STRING,
--non_unique_views INT,
--bytes_transferred INT
--)
--STORED AS SEQUENCEFILE;
-- 
--LOAD DATA LOCAL INPATH 'pagecounts-20120101-000000.gz' INTO TABLE page_counts;
-- 
--SET hive.exec.compress.output=true;
--SET io.seqfile.compression.type=BLOCK;
--
--INSERT OVERWRITE TABLE page_counts_sequence SELECT * FROM page_counts;
----If data is coming in hourly, then we can look at bucketing or partitions
----INSERT OVERWRITE TABLE page_counts_sequence SELECT * FROM page_counts;

