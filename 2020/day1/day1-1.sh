#!/bin/bash

for i in $(cat puzzle1_input.txt); do
  num2=$(grep -Fx $((2020-${i})) puzzle1_input.txt)
  
  if [[ ! -z ${num2} ]]; then
    product=$((${i}*${num2}))
    echo ${product}
    exit
  fi
done
