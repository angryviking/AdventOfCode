#!/bin/bash

input=day10.txt
diff1=0
diff3=0

for i in $(cat ${input}); do
  adapt+=(${i})
done

IFS=$'\n' sorted=($(sort -n <<< "${adapt[*]}"))
unset IFS

if [[ ${sorted[0]} -eq 1 ]]; then
  ((diff1++))
else
  ((diff3++))
fi

for (( i=1; i<=${#sorted[@]}; i++ )); do
  if [[ $((${sorted[${i}]}-${sorted[$((${i}-1))]})) -eq 1 ]]; then
    ((diff1++))
  else
    ((diff3++))
  fi
done

echo $((${diff1}*${diff3}))
