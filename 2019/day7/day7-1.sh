#!/bin/bash

compute(){
  unset array
  
  for i in $(sed 's/,/ /g' day7.txt); do
    array+=(${i})
  done

  inputcount=1
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
      if [[ ${inputcount} == 1 ]]; then
        array[${array[$((${count}+1))]}]=${phase}
        ((inputcount++))
      else
        array[${array[$((${count}+1))]}]=${output}
      fi
      ((count+=2))
    elif [[ ${array[${count}]} == 4 ]]; then
      output=${array[${array[$((${count}+1))]}]}
      ((count+=2))
    elif [[ ${array[${count}]} == 5 ]]; then
      if [[ ${array[${array[$((${count}+1))]}]} != 0 ]]; then
        count=${array[${array[$((${count}+2))]}]}
      else
        ((count+=3))
      fi
    elif [[ ${array[${count}]} == 6 ]]; then
      if [[ ${array[${array[$((${count}+1))]}]} == 0 ]]; then
        count=${array[${array[$((${count}+2))]}]}
      else
        ((count+=3))
      fi
    elif [[ ${array[${count}]} == 7 ]]; then
      oper1=${array[${array[$((${count}+1))]}]}
      oper2=${array[${array[$((${count}+2))]}]}
      if [[ ${oper1} < ${oper2} ]]; then
        array[${array[$((${count}+3))]}]=1
      else
        array[${array[$((${count}+3))]}]=0
      fi
      if [[ ${array[${array[$((${count}+3))]}]} != ${count} ]]; then
        ((count+=4))
      else
        count=${array[${array[$((${count}+3))]}]}
      fi
    elif [[ ${array[${count}]} == 8 ]]; then
      oper1=${array[${array[$((${count}+1))]}]}
      oper2=${array[${array[$((${count}+2))]}]}
      if [[ ${oper1} == ${oper2} ]]; then
        array[${array[$((${count}+3))]}]=1
      else
        array[${array[$((${count}+3))]}]=0
      fi
      if [[ ${array[${array[$((${count}+3))]}]} != ${count} ]]; then
        ((count+=4))
      else
        count=${array[${array[$((${count}+3))]}]}
      fi
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
        if [[ ${inputcount} == 1 ]]; then
          if [[ $(eval echo \${place:$((param-2)):1}) == 0 ]]; then
            array[${array[$((${count}+1))]}]=${phase}
          elif [[ $(eval echo \${place:$((param-2)):1}) == 1 ]]; then
            array[$((${count}+1))]=${phase}
          fi
          ((inputcount++))
        else
          if [[ $(eval echo \${place:$((param-2)):1}) == 0 ]]; then
            array[${array[$((${count}+1))]}]=${output}
          elif [[ $(eval echo \${place:$((param-2)):1}) == 1 ]]; then
            array[$((${count}+1))]=${output}
          fi
        fi
        ((count+=2))
      elif [[ $(eval echo \${place:$((param-1)):2}) == 04 ]]; then
        if [[ $(eval echo \${place:$((param-2)):1}) == 0 ]]; then
          output=${array[${array[$((${count}+1))]}]}
        elif [[ $(eval echo \${place:$((param-2)):1}) == 1 ]]; then
          output=${array[$((${count}+1))]}
        fi
        ((count+=2))
      elif [[ $(eval echo \${place:$((param-1)):2}) == 05 ]]; then
        if [[ $(eval echo \${place:$((param-2)):1}) == 0 ]]; then
          oper1=${array[${array[$((${count}+1))]}]}
        elif [[ $(eval echo \${place:$((param-2)):1}) == 1 ]]; then
          oper1=${array[$((${count}+1))]}
        fi
        if [[ ${oper1} != 0 ]]; then
          if [[ $(eval echo \${place:$((param-3)):1}) == 0 ]]; then
            count=${array[${array[$((${count}+2))]}]}
          elif [[ $(eval echo \${place:$((param-3)):1}) == 1 ]]; then
            count=${array[$((${count}+2))]}
          fi
        else
          ((count+=3))
        fi
      elif [[ $(eval echo \${place:$((param-1)):2}) == 06 ]]; then
        if [[ $(eval echo \${place:$((param-2)):1}) == 0 ]]; then
          oper1=${array[${array[$((${count}+1))]}]}
        elif [[ $(eval echo \${place:$((param-2)):1}) == 1 ]]; then
          oper1=${array[$((${count}+1))]}
        fi
        if [[ ${oper1} == 0 ]]; then
          if [[ $(eval echo \${place:$((param-3)):1}) == 0 ]]; then
            count=${array[${array[$((${count}+2))]}]}
          elif [[ $(eval echo \${place:$((param-3)):1}) == 1 ]]; then
            count=${array[$((${count}+2))]}
          fi
        else
          ((count+=3))
        fi
      elif [[ $(eval echo \${place:$((param-1)):2}) == 07 ]]; then
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
        if [[ $(eval echo \${place:$((param-4)):1}) == 0 ]]; then
          if [[ ${oper1} < ${oper2} ]]; then
            array[${array[$((${count}+3))]}]=1
          else
            array[${array[$((${count}+3))]}]=0
          fi
          if [[ ${array[${array[$((${count}+3))]}]} != ${count} ]]; then
            ((count+=4))
          else
            count=${array[${array[$((${count}+3))]}]}
          fi
        elif [[ $(eval echo \${place:$((param-4)):1}) == 1 ]]; then
          if [[ ${oper1} < ${oper2} ]]; then
            array[$((${count}+3))]=1
          else
            array[$((${count}+3))]=0
          fi
          if [[ ${array[${array[$((${count}+3))]}]} != ${count} ]]; then
            ((count+=4))
          else
            count=${array[${array[$((${count}+3))]}]}
          fi
        fi
      elif [[ $(eval echo \${place:$((param-1)):2}) == 08 ]]; then
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
        if [[ $(eval echo \${place:$((param-4)):1}) == 0 ]]; then
          if [[ ${oper1} == ${oper2} ]]; then
            array[${array[$((${count}+3))]}]=1
          else
            array[${array[$((${count}+3))]}]=0
          fi
          if [[ ${array[${array[$((${count}+3))]}]} != ${count} ]]; then
            ((count+=4))
          else
            count=${array[${array[$((${count}+3))]}]}
          fi
        elif [[ $(eval echo \${place:$((param-4)):1}) == 1 ]]; then
          if [[ ${oper1} == ${oper2} ]]; then
            array[$((${count}+3))]=1
          else
            array[$((${count}+3))]=0
          fi
          if [[ ${array[${array[$((${count}+3))]}]} != ${count} ]]; then
            ((count+=4))
          else
            count=${array[${array[$((${count}+3))]}]}
          fi
        fi
      fi
    else
      echo "Something's not right here...."
      echo ${array[${count}]}
      exit
    fi
  done
}

output=0
startsignal="1234"
endsignal="43210"
unset phase_setting
unset thruster

for i in $(seq ${startsignal} ${endsignal}); do
  signal=$(printf %05d ${i})
  if $(echo ${signal} | grep -q '\(.\).*\1'); then
    :
  else 
    nums='^[0-4]+$'
    if [[ ${signal} =~ ${nums} ]]; then
      for phase in $(echo ${signal} | sed -e 's/\(.\)/\1 /g'); do
        echo ${phase}
        compute
      done
      echo ${signal}
      phase_setting+=(${signal})
      thruster+=(${output})
      output=0
    fi
  fi
done

max=${thruster[0]}
for m in ${thruster[@]} ; do
  ((m > max)) && max=$m
done

echo "Max Thruster Signal: ${max}"

for i in ${!thruster[@]}; do
  if [[ ${thruster[${i}]} == ${max} ]]; then
    echo "Phase Setting: ${phase_setting[${i}]}"
    break
  fi
done
