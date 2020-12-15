#!/bin/bash

input=day8.txt

count=0
for i in $(cat ${input}); do
  if [[ $((${count}%2)) -eq 0 ]]; then
    oper+=(${i})
  else
    arg+=(${i})
  fi
  ((count++))
done

accumulator=0
count=0
while [ ${count} -lt ${#oper[@]} ]; do
  case ${oper[${count}]} in
    nop)
      if [[ " ${nops[@]} " =~ " ${count} " ]]; then
        echo ${accumulator}
        exit
      fi
      nops+=(${count})
      ((count++))
      ;;
    acc)
      if [[ " ${accs[@]} " =~ " ${count} " ]]; then
        echo ${accumulator}
        exit
      fi
      accs+=(${count})
      dir=${arg[${count}]::1}
      num=${arg[${count}]:1}
      ((accumulator$dir=${num}))
      ((count++))
      ;;
    jmp)
      if [[ " ${jmps[@]} " =~ " ${count} " ]]; then
        echo ${accumulator}
        exit
      fi
      jmps+=(${count})
      dir=${arg[${count}]::1}
      num=${arg[${count}]:1}
      ((count$dir=${num}))
      ;;
    *)
      echo "Something is not right here."
      exit
      ;;
  esac
done
