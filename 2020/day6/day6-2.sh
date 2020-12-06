#!/bin/bash

count=0
while read line; do
  if [[ ${line} == "" ]]; then
    ans+=(${count})
    count=0
  else
    ((count++))
  fi
done < day6.txt

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
done < <(awk -v RS= '$1=$1' day6.txt)

echo ${sum}
