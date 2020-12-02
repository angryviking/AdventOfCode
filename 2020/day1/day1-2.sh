#!/bin/bash

num1+=($(cat day1.txt))

count=0
while [ ${count} -lt ${#num1[@]} ]; do
  count2=$((${count}+1))
  while [ ${count2} -lt ${#num1[@]} ]; do
    count3=$((${count2}+1))
    while [ ${count3} -lt ${#num1[@]} ]; do
      if [[ $((${num1[${count}]}+${num1[${count2}]}+${num1[${count3}]})) -eq 2020 ]]; then
        echo $((${num1[${count}]}*${num1[${count2}]}*${num1[${count3}]}))
        exit
      else
        count3=$((${count3}+1))
      fi
    done
    count2=$((${count2}+1))
  done
  count=$((${count}+1))
done
