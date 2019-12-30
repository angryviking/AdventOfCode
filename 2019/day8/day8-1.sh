#!/bin/bash

unset layers
unset zeros
unset ones
unset twos
image=$(cat day8.txt)
size=$((25*6))
count=0

while [ ${count} -lt $((${#image}/${size})) ]; do
  layers+=(${image:$((${count}*${size})):${size}})
  zeros+=($(echo ${layers[${count}]} | grep -o 0 | wc -l))
  ones+=($(echo ${layers[$count]} | grep -o 1 | wc -l))
  twos+=($(echo ${layers[$count]} | grep -o 2 | wc -l))
  ((count++))
done

min=${zeros[0]}
for m in ${zeros[@]} ; do
  ((m < min)) && min=$m
done

for i in ${!zeros[@]}; do
  if [[ ${zeros[${i}]} == ${min} ]]; then
    echo $((${ones[${i}]}*${twos[${i}]}))
    break
  fi
done