#!/bin/bash

sum=0
while read line; do
  ans=$(grep -o . <<< $line | sort -u | paste -s -d '\0' -;)
  ((sum+=$(echo -n ${ans} | wc -m)))
done < <(awk -v RS= '$1=$1' day6.txt)

echo ${sum}
