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
    invalid=${port[${count}]}
    break
  fi
done

for ((count=0; count<${#port[@]}; count++ )); do
  place=${count}
  sum=0
  while [ ${sum} -le ${invalid} ]; do
    sum=$((${sum}+${port[${place}]}))
    list_num+=(${port[${place}]})
    if [[ ${sum} -eq ${invalid} ]]; then
      max=${list_num[0]}
      for m in ${list_num[@]} ; do
        ((m > max)) && max=$m
      done
      min=${list_num[0]}
      for n in ${list_num[@]} ; do
        ((n < min)) && min=$n
      done
      echo $((${min}+${max}))
      exit
    elif [[ ${sum} -gt ${invalid} ]]; then
      unset list_num
    fi
    ((place++))
  done
done
