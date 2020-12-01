#!/bin/bash

for i in $(cat day1.txt); do
  num2=$(grep -Fx $((2020-${i})) day1.txt)
  
  if [[ ! -z ${num2} ]]; then
    product=$((${i}*${num2}))
    echo ${product}
    exit
  fi
done
