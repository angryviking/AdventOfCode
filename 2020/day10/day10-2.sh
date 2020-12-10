#!/bin/bash

input=day10.txt

for i in $(cat ${input}); do
  adapt+=(${i})
  if [[ ! " adapt[@] " =~ " 0 " ]]; then
    adapt+=(0)
  fi
done

IFS=$'\n' sorted=($(sort -n <<< "${adapt[*]}"))
unset IFS

product=1
for ((i=0; i<${#sorted[@]}; i++)); do
  chain+=(${sorted[${i}]})
  while [[ $((${sorted[${i}]}+1)) -eq ${sorted[$((${i}+1))]} ]]; do
    ((i++))
    chain+=(${sorted[${i}]})
  done
  case ${#chain[@]} in
    3)
       ((product*=2))
       ;;
    4)
       ((product*=4))
       ;;
    5) 
       ((product*=7))
       ;;
    *)
       ;;
  esac
  unset chain
done

echo ${product}
