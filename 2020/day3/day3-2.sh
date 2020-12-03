#!/bin/bash

find_trees() {
  trees=0
  count=0
  for i in $(tail +${startline} day3.txt); do
    if [[ ${startline} -eq 2 || $((${startline}%2)) -eq 1 ]]; then
      ((count+=${slope}))
      case ${count} in
        31)
            count=0
            ;;
        32)
            count=1
            ;;
        33)
            count=2
            ;;
        34)
            count=3
            ;;
        35)
            count=4
            ;;
        36)
            count=5
            ;;
        37)
            count=6
            ;;
        *)
            ;;
        esac
  
      if [[ ${i:${count}:1} == "#" ]]; then
        ((trees++))
      fi
    fi
    if [[ ${skiplines} -eq 1 ]]; then
      ((startline++))
    fi
  done
}

sum=1
for slope in 1 3 5 7; do
  startline=2
  skiplines=0
  find_trees
  sum=$((${trees}*${sum}))
done

skiplines=1
startline=3
slope=1
find_trees
sum=$((${trees}*${sum}))

echo ${sum}
