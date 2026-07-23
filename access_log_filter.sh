#!/bin/bash

LOGFILE="access_1000.log"

count_2xx=0
count_3xx=0
count_4xx=0
count_5xx=0

while read line
do
    status=$(echo "$line" | awk '{print $9}')

    case $status in
        2*)
            ((count_2xx++))
            ;;
        3*)
            ((count_3xx++))
            ;;
        4*)
            ((count_4xx++))
            ;;
        5*)
            ((count_5xx++))
            ;;
    esac

done < "$LOGFILE"

echo "==============================="
echo "HTTP Status Code Summary"
echo "==============================="
echo "2xx Success      : $count_2xx"
echo "3xx Redirection  : $count_3xx"
echo "4xx Client Error : $count_4xx"
echo "5xx Server Error : $count_5xx"
echo "==============================="

/*
### sample output
===============================
HTTP Status Code Summary
===============================
2xx Success      : 463
3xx Redirection  : 192
4xx Client Error : 222
5xx Server Error : 123
===============================
*/

