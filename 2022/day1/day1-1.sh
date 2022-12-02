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

max=${elves[0]}
for m in ${elves[@]} ; do
  ((m > max)) && max=$m
done

echo ${max}
