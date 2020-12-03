#!/bin/bash

find_trees() {
  trees=0
  count=0
  for i in $(tail +${startline} day3.txt); do
    if [[ ${startline} -eq 2 || $((${startline}%2)) -eq 1 ]]; then
      ((count+=${slope}))
      if [[ ${count} -gt 30 ]]; then
        count=$((${count}-31))
      fi
      if [[ ${i:${count}:1} == "#" ]]; then
        ((trees++))
      fi
    fi
    if [[ ${skiplines} -eq 1 ]]; then
      ((startline++))
    fi
  done
}

product=1
for slope in 1 3 5 7; do
  startline=2
  skiplines=0
  find_trees
  product=$((${trees}*${product}))
done

skiplines=1
startline=3
slope=1
find_trees
product=$((${trees}*${product}))

echo ${product}
