#!/bin/bash

input=day14.txt

while read line; do
  if [[ "${line}" =~ "mask" ]]; then
    mask=$(cut -d" " -f3 <<< ${line})
    continue
  elif [[ "${line}" =~ "mem" ]]; then
    address=$(cut -d"[" -f2 <<< ${line} | cut -d"]" -f1)
    value=$(cut -d" " -f3 <<< ${line})
    binary=$(printf "%${#mask}s\n" $(bc <<< "obase=2;${value}") | tr ' ' '0')
  fi
  for ((i=0; i<${#mask}; i++)); do
    if [[ ${mask:${i}:1} != "X" ]]; then
      binary=$(sed -E "s/^(.{${i}})${binary:${i}:1}/\1${mask:${i}:1}/" <<< ${binary})
    fi
  done
  mem[$address]=$((2#${binary}))
done < ${input}

echo $(IFS=+; echo "$((${mem[*]}))")
