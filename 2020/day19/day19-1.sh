#!/bin/bash

input=day19.txt

while read line; do
  rules[$(cut -d":" -f1 <<< ${line})]=$(cut -d":" -f2 <<< ${line})
done < <(grep -E "^[0-9]+:" ${input})

rule0=${rules[0]}
while [[ $(grep -oE "\b[0-9]+\b" <<< ${rule0}) ]]; do
  while read line; do
    [[ $(grep "|" <<< ${rules[${line}]}) ]] && \
       rule0=$(sed -rE "s/\b${line}\b/(${rules[${line}]})/g" <<< ${rule0}) || \
       rule0=$(sed -rE "s/\b${line}\b/${rules[${line}]}/g" <<< ${rule0})
  done < <(grep -oE "\b[0-9]+\b" <<< ${rule0})
done

rule0=$(sed -r -e "s/\"//g"  -e "s/ //g" <<< ${rule0})
sum=0

while read line; do
  [[ "${line}" =~ ^${rule0}$ ]] && ((sum++))
done < <(grep -E "^[a-z]+" ${input})

echo ${sum}
  