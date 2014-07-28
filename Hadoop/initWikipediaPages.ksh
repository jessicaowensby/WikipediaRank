#!/usr/bin/env bash
###########################################################
# This script is only called once, upon RPM installation.
# 
###########################################################
log_err()
{
	echo "$1" 1>&2
};

[[ hive -f schema/wikipedia.1.0.ddl ]] || log_err "Unable to initialize the wikipedia data structures."
