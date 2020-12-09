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
    if [[ ${number} -eq ${port[${i}]} ]]; then
      :
    else
      if [[ " ${port[@]:${begin}:${preamble}} " =~ " $((${port[${count}]}-${port[${i}]})) " ]]; then
        valid=1
      fi
    fi
  done
  if [[ ${valid} -eq 0 ]]; then
    not_valid+=${port[${count}]}
  fi
done

echo ${not_valid[@]}
