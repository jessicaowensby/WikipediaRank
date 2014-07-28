-------------------------------------
-- author: jessica.owensby@gmail.com
-- description: creates wikipedia database and page_count table
-- 07.27.14 
-------------------------------------
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

