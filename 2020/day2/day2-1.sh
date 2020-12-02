#!/bin/bash

while read line; do
  repeat+=($(cut -d" " -f1 <<< ${line}))
  key+=($(cut -d" " -f2 <<< ${line}))
  pass+=($(cut -d" " -f3 <<< ${line}))
done < day2.txt

sum=0
count=0
while [ ${count} -lt ${#key[@]} ]; do
  low=$(cut -d"-" -f1 <<< ${repeat[${count}]})
  high=$(cut -d"-" -f2 <<< ${repeat[${count}]})
  num=$(awk -F"${key[${count}]:0:1}" '{ print NF-1 }' <<< ${pass[${count}]})
  if [[ ${num} -ge ${low} && ${num} -le ${high} ]]; then
    ((sum++))
  fi
  ((count++))
done

echo ${sum}
