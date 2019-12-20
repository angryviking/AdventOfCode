#!/bin/bash

unset array
sum=0

for i in $(sed 's/,/ /g' day2.txt); do
  array+=(${i})
done

array[1]=12
array[2]=2

count=0
while [ ${count} -le ${#array[@]} ]; do
  if [[ ${array[${count}]} == 1 ]]; then
    oper1=${array[${array[$((${count}+1))]}]}
    oper2=${array[${array[$((${count}+2))]}]}
    sum=$((${oper1}+${oper2}))
    array[${array[$((${count}+3))]}]=${sum}
    ((count+=4))
  elif [[ ${array[${count}]} == 2 ]]; then
    oper1=${array[${array[$((${count}+1))]}]}
    oper2=${array[${array[$((${count}+2))]}]}
    sum=$((${oper1}*${oper2}))
    array[${array[$((${count}+3))]}]=${sum}
    ((count+=4))
  elif [[ ${array[${count}]} == 99 ]]; then
    break
  else
    echo "Something's not right here...."
    exit
  fi
done

echo ${array[0]}
