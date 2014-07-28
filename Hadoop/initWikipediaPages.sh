#!/usr/bin/env bash
###########################################################
# This script is only called once, upon RPM installation.
###########################################################

hive -f Hadoop/schema/wikipedia.1.0.ddl
rc=$?

if [[ $rc -ne 0 ]];then
  echo "Unable to initialize the wikipedia data structures."
  exit 1
fi
