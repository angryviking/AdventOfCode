#!/bin/bash

cups=(7 8 9 4 6 5 1 2 3)
curr_cup=0

for ((count=0; count<100; count++)); do
  tmp_cups=(${cups[@]:0:$((curr_cup+1))} ${cups[@]:$((curr_cup+4))})
  mv_cups=(${cups[@]:$((curr_cup+1)):3})
  dest_cup=$((${cups[${curr_cup}]}-1))
  while [[ ! " ${tmp_cups[@]} " =~ " ${dest_cup} " ]]; do
    ((dest_cup--))
    [[ ${dest_cup} -le 0 ]] && dest_cup=9
  done

  for i in ${!tmp_cups[@]}; do
    [[ ${tmp_cups[${i}]} -eq ${dest_cup} ]] && element=${i}
  done

  cups=(${tmp_cups[@]:0:$((element+1))} ${mv_cups[@]} ${tmp_cups[@]:$((element+1))})
  ((curr_cup++))
  curr_cup_value=${tmp_cups[${curr_cup}]}

  for i in ${!cups[@]}; do
    [[ ${cups[${i}]} -eq ${curr_cup_value} ]] && curr_cup=${i}
  done

  if [[ $((curr_cup+3)) -ge ${#tmp_cups[@]} ]]; then
    cups=(${cups[@]:$((curr_cup))} ${cups[@]:0:$((curr_cup))})
    curr_cup=0
  fi

done

for i in ${!cups[@]}; do
  if [[ ${cups[${i}]} -eq 1 ]]; then
    cups=(${cups[@]:${i}} ${cups[@]:0:${i}})
  fi 
done
echo ${cups[@]:1}