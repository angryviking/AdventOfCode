#!/bin/bash

input=day9.txt
preamble=25

for i in $(cat ${input}); do
  port+=(${i})
done

for ((count=${preamble}; count<${#port[@]}; count++)); do
  begin=$((${count}-${preamble}))
  end=$((${count}-1))
  valid=0
  for i in $(seq ${begin} ${end}); do
    number=$((${port[${count}]}-${port[${i}]}))
    if [[ ${number} -ne ${port[${i}]} ]]; then
      if [[ " ${port[@]:${begin}:${preamble}} " =~ " ${number} " ]]; then
        valid=1
      fi
    fi
  done
  if [[ ${valid} -eq 0 ]]; then
    echo ${port[${count}]}
    exit
  fi
done

