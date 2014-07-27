DROP TABLE IF EXISTS pc_test;

CREATE TABLE IF NOT EXISTS pc_test  
(
language STRING,
page_name STRING,
non_unique_views INT,
bytes_transferred INT
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ' '
LINES TERMINATED BY '\n';

LOAD DATA LOCAL INPATH 'wikipediaMostPopular/input.tsv' INTO TABLE pc_test;
