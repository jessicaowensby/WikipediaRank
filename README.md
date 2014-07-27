###NBS###
===
In search of the 10 most popular wikipedia pages by language.

####Design considerations and enhancements####
<code>
--CREATE TABLE IF NOT EXISTS page_counts_sequence
--(
--language STRING,
--page_name STRING,
--non_unique_views INT,
--bytes_transferred INT
--)
--STORED AS SEQUENCEFILE;
--LOAD DATA LOCAL INPATH 'pagecounts-20120101-000000.gz' INTO TABLE page_counts;
--SET hive.exec.compress.output=true;
--SET io.seqfile.compression.type=BLOCK;
--INSERT OVERWRITE TABLE page_counts_sequence SELECT * FROM page_counts;
</code>

If data is coming in hourly, then we can look at bucketing or partitions
<code>--INSERT OVERWRITE TABLE page_counts_sequence SELECT * FROM page_counts;</code>
