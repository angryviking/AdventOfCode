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
total=0
while read line; do
  sum=0
  for i in $(echo ${line} | fold -w1 | sort -u); do
    num="${line//[^${i}]}"
    if [[ ${#num} -eq ${ans[${count}]} ]]; then
      sum=$((${#num}+${sum}))
      ((total++))
    fi
  done
  ((count++))
done < <(awk -v RS= '$1=$1' day6.txt)

echo ${total}
