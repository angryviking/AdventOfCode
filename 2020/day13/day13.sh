#!/bin/bash

input=day13.txt

IFS=',' ids=($(tail -1 ${input}))
unset IFS
timestamp=$(head -1 ${input})

for ((i=0; i<${#ids[@]}; i++)); do
  if [[ ${ids[${i}]} != "x" ]]; then
    sum=${ids[${i}]}
    while [[ ${sum} -lt ${timestamp} ]]; do
      ((sum+=${ids[${i}]}))
    done
    times[${i}]=${sum}
  fi
done

min=${times[0]}
for m in ${times[@]} ; do
  ((m < min)) && min=$m
done

for i in ${!times[@]}; do
  if [[ ${times[${i}]} -eq ${min} ]]; then
   echo $((${ids[${i}]}*(${times[${i}]}-${timestamp})))
  fi
done
