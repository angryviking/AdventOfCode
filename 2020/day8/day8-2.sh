#!/bin/bash

input=day8.txt

set_array(){
  unset oper
  unset arg
  count=0
  for i in $(cat ${input}); do
    if [[ $((${count}%2)) -eq 0 ]]; then
      oper+=(${i})
    else
      arg+=(${i})
    fi
    ((count++))
  done
}

get_acc() {
  bad=0
  accumulator=0
  count=0
  while [ ${count} -lt ${#oper[@]} ]; do
    case ${oper[${count}]} in
      nop)
           if [[ " ${nops[@]} " =~ " ${count} " ]]; then
             bad=1
             break
           fi
           nops+=(${count})
           ((count++))
           if [[ ${count} -eq ${#oper[@]} ]]; then
             echo ${accumulator}
             exit
           fi
           ;;
      acc)
           if [[ " ${accs[@]} " =~ " ${count} " ]]; then
             bad=1
             break
           fi
           accs+=(${count})
           dir=${arg[${count}]::1}
           num=${arg[${count}]:1}
           ((accumulator$dir=${num}))
           ((count++))
           if [[ ${count} -eq ${#oper[@]} ]]; then
             echo ${accumulator}
             exit
           fi
           ;;
      jmp)
           if [[ " ${jmps[@]} " =~ " ${count} " ]]; then
             bad=1
             break
           fi
           jmps+=(${count})
           dir=${arg[${count}]::1}
           num=${arg[${count}]:1}
           ((count$dir=${num}))
           if [[ ${count} -eq ${#oper[@]} ]]; then
             echo ${accumulator}
             exit
           fi
           ;;
      *)
           echo "Something is not right here."
           exit
           ;;
    esac
  done
}

set_array
for ((n=0; n<${#oper[@]}; n++)); do
  if [[ ${oper[${n}]} == "nop" ]]; then
    oper[${n}]=jmp
    get_acc
    if [[ ${bad} -eq 1 ]]; then
      set_array
    fi
  elif [[ ${oper[${n}]} == "jmp" ]]; then
    oper[${n}]=nop
    get_acc
    if [[ ${bad} -eq 1 ]]; then
      set_array
    fi
  fi
  unset nops
  unset accs
  unset jmps
done
