#!/bin/bash

for i in $(cat day1.txt); do
  num=$(grep -Fx $((2020-${i})) day1.txt)
  if [[ ! -z ${num} ]]; then
    echo $((${i}*${num}))
    exit
  fi
done
