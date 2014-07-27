#parameterize
wget http://dumps.wikimedia.org/other/pagecounts-raw/2012/2012-01/pagecounts-20120101-000000.gz

#error handling
hadoop fs -put pagecounts-20120101-000000.gz /user/hive/warehouse/wikipedia.db/page_counts

hive -f mostPopularWikipediaPages_20120101.hql

#error handling
