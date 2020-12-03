#!/bin/bash

trees=0
count=0
for i in $(tail +2 day3.txt); do
  ((count+=3))
  if [[ ${count} -gt 30 ]]; then
    count=$((${count}-31))
  fi
  if [[ ${i:${count}:1} == "#" ]]; then
    ((trees++))
  fi

done

echo ${trees}
