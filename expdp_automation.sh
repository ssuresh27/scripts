#!/bin/bash
# |------------------------------------------------------------------------|
# |                                                                        |
# | File Name    : expdp_automation.sh                                   |
# | Author       : Suresh Sundararajan                                     |
# |                                                                        |
# | Description  : To perform expdp in Oracle database interactively in    |
# |                Linux servers using  bash                               |                                      |
# | Call Syntax  : ./check_oracle_instance_nums.sh                         |
# |                or                                                      |
# |                bash expdp_automation.sh                                |
# |                                                                        |
# | History      : 02-Apr-2024  Initial                                    |
# |                                                                        |
# +------------------------------------------------------------------------+

# +------------------------------------------------------------------------+
# |                                                                        |
# | Export environment variable of oracle user                             |
# |                                                                        |
# +------------------------------------------------------------------------+

# source ~/.bash_profile;

# +------------------------------------------------------------------------+
# |                                                                        |
# | Define the absolute location of some internal SHELL commands           |
# |                                                                        |
# +------------------------------------------------------------------------+

export AWK=`which awk`
export BASENAME=`which basename`
export CAT=`which cat`
export CUT=`which cut`
export FIND=`which find`
export WC=`which wc`
export SORT=`which sort`

# +------------------------------------------------------------------------+
# |                                                                        |
# | Define some shell common variables                                     |
# |                                                                        |
# +------------------------------------------------------------------------+

export OS_TYPE=$(uname)


case "${OS_TYPE}" in
   "Linux")
        CPU_COUNT=$(nproc)
        ;;
   "Darwin") 
        CPU_COUNT=$(sysctl -n hw.logicalcpu_max || lscpu -p | egrep -v '^#' | wc -l)
        ;;
   "*") 
        echo "Error in finding the OS or OS verion is not matching in List" 
        ;;
esac

echo "${OS_TYPE} and CPU ${CPU_COUNT}"
# export SPFILE_LOC_LIST=  
# export INSTANCE_NUM=`find ${ORACLE_HOME}/dbs -name "spfile*.ora" | wc -l`
# export INSTANCE_NAME_TMPFILE=/tmp/instance_name_list.lst

# +------------------------------------------------------------------------+
# |                                                                        |
# | The critical SHELL script for check_oracle_instance_nums.sh            |
# |                                                                        |
# +------------------------------------------------------------------------+

# > ${INSTANCE_NAME_TMPFILE}

# if [ ${INSTANCE_NUM} -gt 1 ]; then
#   SPFILE_LOC_LIST=`$FIND ${ORACLE_HOME}/dbs -name "spfile*.ora" | $SORT -n`
#   for n in ${SPFILE_LOC_LIST}
#   do
#     $BASENAME $n | $CUT -d'.' -f1 | $AWK '{print substr($1, length("spfile")+1)}' >> ${INSTANCE_NAME_TMPFILE}
#   done
# else
#   $BASENAME ${SPFILE_LOC_LIST} | $CUT -d'.' -f1 | $AWK '{print substr($1, length("spfile")+1)}'>> ${INSTANCE_NAME_TMPFILE}
# fi

# $CAT ${INSTANCE_NAME_TMPFILE}

# The following demo is the returned outcome when executing the previous SHELL script on my Oracle Database test server.
# [oracle@testdb ~]$ ./check_oracle_instance_nums.sh
# testdb1
# testdb2
# testdb3
# [oracle@testdb ~]$ 