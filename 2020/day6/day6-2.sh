#!/bin/bash

input=day6.txt
count=0
linenum=1
lastline=$(wc -l < ${input})
while read line; do
  if [[ ${line} == "" ]]; then
    ans+=(${count})
    count=0
  else
    ((count++))
  fi
  if [[ ${linenum} -eq ${lastline} ]]; then
    ans+=(${count})
  fi
  ((linenum++))
done < ${input}

count=0
sum=0
while read line; do
  for i in $(echo ${line} | fold -w1 | sort -u); do
    num="${line//[^${i}]}"
    if [[ ${#num} -eq ${ans[${count}]} ]]; then
      ((sum++))
    fi
  done
  ((count++))
done < <(awk -v RS= '$1=$1' ${input})

echo ${sum}
