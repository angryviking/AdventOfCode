#!/bin/bash

while read line; do
  repeat+=($(cut -d" " -f1 <<< ${line}))
  key+=($(cut -d" " -f2 <<< ${line}))
  pass+=($(cut -d" " -f3 <<< ${line}))
done < day2.txt

sum=0
count=0
while [ ${count} -lt ${#key[@]} ]; do
  pos1=$(($(cut -d"-" -f1 <<< ${repeat[${count}]})-1))
  charpos1=${pass[${count}]:${pos1}:1}
  pos2=$(($(cut -d"-" -f2 <<< ${repeat[${count}]})-1))
  charpos2=${pass[${count}]:${pos2}:1}
  if [[ ${charpos1} == ${key[${count}]:0:1} || ${charpos2} == ${key[${count}]:0:1} ]]; then
    ((sum++))
    if [[ ${charpos1} == ${key[${count}]:0:1} && ${charpos2} == ${key[${count}]:0:1} ]]; then
      ((sum--))
    fi
  fi
  ((count++))
done

echo ${sum}
