#!/bin/bash

trees=0
count=0
for i in $(tail +2 day3.txt); do
  ((count+=3))
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
    *)
        ;;
    esac
  
  if [[ ${i:${count}:1} == "#" ]]; then
    ((trees++))
  fi

done

echo ${trees}
