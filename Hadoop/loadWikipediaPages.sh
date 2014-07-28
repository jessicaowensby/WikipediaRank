#!/usr/bin/env bash
##################################################
# author: jessica.owensby@gmail.com
# description: This script downloads the wikipedia data
# for one hour on January 1st, 2012, loads the data into
# hive and populates a table in HIVE with the rank data.
# 07.27.14
##################################################

wget http://dumps.wikimedia.org/other/pagecounts-raw/2012/2012-01/pagecounts-20120101-000000.gz
rc=$?

if [[ $rc -ne 0 ]];then
  echo "Unable to download source data from Wikipedia."
  exit 1
fi

hive -e "use wikipedia; LOAD DATA LOCAL INPATH 'pagecounts-20120101-000000.gz' INTO TABLE page_counts;"
rc=$?

if [[ $rc -ne 0 ]];then
  echo "Unable to load page_counts data."
  exit 2
fi

hive -f Hadoop/mostPopularWikipediaPages_20120101.hql
rc=$?

if [[ $rc -ne 0 ]];then
  echo "Unable to run the most popular analysis."
  exit 3
fi

echo SUCCESS!
~                   
