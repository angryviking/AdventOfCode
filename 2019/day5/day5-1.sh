#!/bin/bash

unset array
sum=0
input=$1

for i in $(sed 's/,/ /g' day5.txt); do
  array+=(${i})
done

count=0
while [ ${count} -le ${#array[@]} ]; do
  if [[ ${array[${count}]} == 99 ]]; then
    break
  elif [[ ${array[${count}]} == 1 ]]; then
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
  elif [[ ${array[${count}]} == 3 ]]; then
    array[${array[$((${count}+1))]}]=${input}
    ((count+=2))
  elif [[ ${array[${count}]} == 4 ]]; then
    echo ${array[${array[$((${count}+1))]}]}
    ((count+=2))
  elif [[ ${array[${count}]} -ne 99 && ${#array[${count}]} -gt 1 ]]; then
    param=4
    place=$(printf %05d ${array[${count}]})
    if [[ $(eval echo \${place:$((param-1)):2}) == 01 ]]; then
      if [[ $(eval echo \${place:$((param-2)):1}) == 0 ]]; then
        oper1=${array[${array[$((${count}+1))]}]}
      elif [[ $(eval echo \${place:$((param-2)):1}) == 1 ]]; then
        oper1=${array[$((${count}+1))]}
      fi
      if [[ $(eval echo \${place:$((param-3)):1}) == 0 ]]; then
        oper2=${array[${array[$((${count}+2))]}]}
      elif [[ $(eval echo \${place:$((param-3)):1}) == 1 ]]; then
        oper2=${array[$((${count}+2))]}
      fi
      sum=$((${oper1}+${oper2}))
      if [[ $(eval echo \${place:$((param-4)):1}) == 0 ]]; then
        array[${array[$((${count}+3))]}]=${sum}
      elif [[ $(eval echo \${place:$((param-4)):1}) == 1 ]]; then
        array[$((${count}+3))]=${sum}
      fi
      ((count+=4))
    elif [[ $(eval echo \${place:$((param-1)):2}) == 02 ]]; then
      if [[ $(eval echo \${place:$((param-2)):1}) == 0 ]]; then
        oper1=${array[${array[$((${count}+1))]}]}
      elif [[ $(eval echo \${place:$((param-2)):1}) == 1 ]]; then
        oper1=${array[$((${count}+1))]}
      fi
      if [[ $(eval echo \${place:$((param-3)):1}) == 0 ]]; then
        oper2=${array[${array[$((${count}+2))]}]}
      elif [[ $(eval echo \${place:$((param-3)):1}) == 1 ]]; then
        oper2=${array[$((${count}+2))]}
      fi
      sum=$((${oper1}*${oper2}))
      if [[ $(eval echo \${place:$((param-4)):1}) == 0 ]]; then
        array[${array[$((${count}+3))]}]=${sum}
      elif [[ $(eval echo \${place:$((param-4)):1}) == 1 ]]; then
        array[$((${count}+3))]=${sum}
      fi
      ((count+=4))
    elif [[ $(eval echo \${place:$((param-1)):2}) == 03 ]]; then
      if [[ $(eval echo \${place:$((param-2)):1}) == 0 ]]; then
        array[${array[$((${count}+1))]}]=${input}
      elif [[ $(eval echo \${place:$((param-2)):1}) == 1 ]]; then
        array[$((${count}+1))]=${input}
      fi
      ((count+=2))
    elif [[ $(eval echo \${place:$((param-1)):2}) == 04 ]]; then
      if [[ $(eval echo \${place:$((param-2)):1}) == 0 ]]; then
        echo ${array[${array[$((${count}+1))]}]}
      elif [[ $(eval echo \${place:$((param-2)):1}) == 1 ]]; then
        echo ${array[$((${count}+1))]}
      fi
      ((count+=2))
    fi
  else
    echo "Something's not right here...."
    echo ${array[${count}]}
    exit
  fi
done
