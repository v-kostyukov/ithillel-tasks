#!/bin/bash
set -o pipefail

#RC=( "${PIPESTATUS[@]}" )

cat /etc/passwd | grep -B 10 root | tr ":" " " | QWE | cut -d "/" -f1 | awk '{ print $NF }' | wc -l
#echo "${RC}"
exitcode=$?
echo "exit with ${exitcode}"
exit ${exitcode}