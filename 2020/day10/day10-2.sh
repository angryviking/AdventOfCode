#!/bin/bash

input=day10.txt
adapt=($(cat ${input}))
[[ ! " adapt[@] " =~ " 0 " ]] && adapt+=(0)

IFS=$'\n' sorted=($(sort -n <<< "${adapt[*]}"))
unset IFS

product=1
for ((i=0; i<${#sorted[@]}; i++)); do
  chain=(${sorted[${i}]})
  while [[ $((${sorted[${i}]}+1)) -eq ${sorted[$((${i}+1))]} ]]; do
    ((i++))
    chain+=(${sorted[${i}]})
  done
  case ${#chain[@]} in
    1|2)
       ((product*=1))
       ;;
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
       echo "Need more options."
       exit
       ;;
  esac
done

echo ${product}
