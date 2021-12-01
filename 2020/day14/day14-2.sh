#!/bin/bash

input=test.txt

while read line; do
  if [[ "${line}" =~ "mask" ]]; then
    mask=$(cut -d" " -f3 <<< ${line})
    echo "mask=${mask}"
    continue
  elif [[ "${line}" =~ "mem" ]]; then
    address=$(cut -d"[" -f2 <<< ${line} | cut -d"]" -f1)
    value=$(cut -d" " -f3 <<< ${line})
    binary=$(printf "%${#mask}s\n" $(bc <<< "obase=2;${address}") | tr ' ' '0')
    echo "address=${binary}"
  fi
  for ((i=0; i<${#mask}; i++)); do
#    if [[ ${mask:${i}:1} != "X" ]]; then
    case ${mask:${i}:1} in
      1|X)
        binary=$(sed -E "s/^(.{${i}})${binary:${i}:1}/\1${mask:${i}:1}/" <<< ${binary})
        ;;
      0)
        ;;
      *)
        echo "Something's not right here."
        exit
        ;;
    esac
#      mem[$((2#${binary}))]=${value}
#      mem[$address]=$((2#${binary}))
#    fi
  done
  sed -E "s/X/(0|1)/g" <<< ${binary}
  echo "masked address=${binary}"
done < ${input}

#echo ${mem[@]}
#echo $(IFS=+; echo "$((${mem[*]}))")
