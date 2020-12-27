#!/bin/bash

input=day16.txt  
sum=0

while read line; do
  for i in $(sed "s/,/ /g" <<< ${line}); do
    exists=0
    while read field; do
      elements=$(cut -d":" -f2 <<< ${field} | 
             sed -r 's/[0-9]+-[0-9]+/{&}/g' | \
             sed -r 's/-/../g' | \
             sed -r 's/or//g')
      if [[ " $(eval echo ${elements}) " =~ " ${i} " ]]; then
        exists=1
      fi
    done < <(grep ":" ${input})
    if [[ ${exists} -eq 0 ]]; then
      echo ${sum}
      sum=$((sum+${i}))
    fi
  done
done < <(grep nearby -A$(wc -l ${input}) | grep -v nearby)

echo ${sum}