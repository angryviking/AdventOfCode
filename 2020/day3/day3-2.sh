#!/bin/bash

find_trees() {
  trees=0
  count=0
  for i in $(tail +${start} day3.txt); do
    if [[ ${start} -eq 2 || $((${start}%2)) -eq 1 ]]; then
      ((count+=${slope}))
      if [[ ${count} -gt 30 ]]; then
        ((count-=31))
      fi
      if [[ ${i:${count}:1} == "#" ]]; then
        ((trees++))
      fi
    fi
    if [[ ${start} -ne 2 ]]; then
      ((start++))
    fi
  done
}

product=1
for slope in 1 3 5 7; do
  start=2
  find_trees
  product=$((${trees}*${product}))
done

start=3
slope=1
find_trees
product=$((${trees}*${product}))

echo ${product}
