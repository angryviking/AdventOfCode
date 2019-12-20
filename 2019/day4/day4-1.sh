#!/bin/bash

unset order
unset multiple
start=372304
end=847060

for i in $(seq ${start} ${end}); do
  count=0 
  while [ $(eval echo \${i:$count:1}) -le $(eval echo \${i:$(($count+1)):1}) ]; do
    ((count++))
    if [ $((${count}+1)) -eq ${#i} ]; then
      order+=(${i})
      break
    fi
  done
done

for i in ${order[@]}; do
  count=0
  while [ ${count} -le 9 ]; do
    repeat=$(echo ${i} | grep -o ${count}'\{1,\}')
    if [ ${#repeat} -ge 2 ]; then
      multiple+=(${i})
      break
    fi
    ((count++))
  done
done

echo ${#multiple[@]}
