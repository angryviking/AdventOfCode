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
indent=(1 3 5 7 1)
line=(1 1 1 1 2)
key=0
while [ ${key} -lt ${#indent[@]} ]; do
  slope=${indent[${key}]}
  start=$((${line[${key}]}+1))
  find_trees
  product=$((${trees}*${product}))
  ((key++))
done

echo ${product}
