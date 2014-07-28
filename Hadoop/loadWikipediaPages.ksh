#!/usr/bin/env bash
##################################################
# author:
# description:

#parameterize
#Date: year, month, day, hour
#database
#table name
##################################################

[[wget http://dumps.wikimedia.org/other/pagecounts-raw/2012/2012-01/pagecounts-20120101-000000.gz]] || log_err "Unable to download source data from Wikipedia."

[[hive -e 'use wikipedia; LOAD DATA LOCAL INPATH 'pagecounts-20120101-000000.gz' INTO TABLE page_counts;']] || log_err "Unable to load page_counts data."

[[hive -f mostPopularWikipediaPages_20120101.hql]] || log_err "Unable to run the most popular analysis."
