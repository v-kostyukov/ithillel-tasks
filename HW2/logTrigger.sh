#!/bin/bash

watchPattern=Done
logFile=/var/log/messages
logLine=""
error=0

{
while (( SECONDS <= 60 ))
do
        echo $(( 1 + RANDOM % 10 )) >> "${logFile}"
        sleep 5 || break
done
echo "Done" >> "${logFile}"
}&

while read -r logLine ; do
    if [[ "$logLine" == *"$watchPattern"* ]] ; then
        echo "Number of errors: ${error}"
        kill $(ps -eo pid,command | awk -v pattern="tail -fn0 $logFile" '$0 ~ pattern && !/awk/ {print $1}')
        break
    elif [[ ($logLine -ge 0) && ($logLine -le 3) ]] ; then
        echo -e "\033[32mOK\n\033[37m"
    elif [[ ($logLine -ge 4) && ($logLine -le 7) ]]; then
        echo -e "\033[33mWARNING\n\033[37m"
    elif [[ ($logLine -gt 7) && ($logLine -le 10) ]]; then
        echo -e "\033[0m\033[31mERROR\n\033[37m"
        ((error++))
    elif [[ "$logLine" == *"$watchPattern"* ]] ; then
        echo "Number of errors: ${error}"
        kill $(ps -eo pid,command | awk -v pattern="tail -fn0 $logFile" '$0 ~ pattern && !/awk/ {print $1}')
    fi
done< <(exec tail -fn0 "$logFile")

echo "match = $logLine"