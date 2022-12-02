#!/bin/bash

readarray calories < input.txt
count=0
while [ ${count} -lt ${#calories[@]} ]; do
  if [[ ${calories[${count}]} -ne "" ]]; then
    ((sum+=${calories[${count}]}))
  else
    elves+=(${sum})
    sum=0
  fi
  ((count++))
done

top+=($(sort -n <<< $(printf "%s\n" "${elves[@]}") | tail -3))

count=0
while [ ${count} -lt ${#top[@]} ]; do
  ((total+=${top[${count}]}))
  ((count++))
done

echo ${total}
