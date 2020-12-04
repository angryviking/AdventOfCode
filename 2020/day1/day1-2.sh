#!/bin/bash

num+=($(cat day1.txt))

count=0
while [ ${count} -lt ${#num[@]} ]; do
  count2=$((${count}+1))
  while [ ${count2} -lt ${#num[@]} ]; do
    count3=$((${count2}+1))
    while [ ${count3} -lt ${#num[@]} ]; do
      if [[ $((${num[${count}]}+${num[${count2}]}+${num[${count3}]})) -eq 2020 ]]; then
        echo $((${num[${count}]}*${num[${count2}]}*${num[${count3}]}))
        exit
      else
        ((count3++))
      fi
    done
    ((count2++))
  done
  ((count++))
done
