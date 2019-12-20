#!/bin/bash

unset array
total=0

for i in $(cat day1.txt); do
  sum=${i}
  while [ ${sum} -ge 8 ]; do
    sum=$((${sum}/3-2))
    total=$((${total}+${sum})) 
  done
  array+=(${total})
  total=0
done

fuel=$(IFS=+; echo "$((${array[*]}))")
echo ${fuel}
