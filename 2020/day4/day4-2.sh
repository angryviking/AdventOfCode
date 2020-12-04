#!/bin/bash
shopt -s compat31

valid=0
while read line; do
  if [[ ${line} =~ \\bbyr:(19[2-9][0-9]|200[0-2])\\b && \
        ${line} =~ \\biyr:20(1[0-9]|20)\\b && \
        ${line} =~ \\beyr:20(2[0-9]|30)\\b && \
        ${line} =~ \\bhgt:(1([5-8][0-9]|9[0-3])cm|(59|6[0-9]|7[0-6])in)\\b && \
        ${line} =~ \\bhcl:#[0-9a-f]{6}\\b && \
        ${line} =~ \\becl:(amb|blu|brn|grn|gry|hzl|oth)\\b && \
        ${line} =~ \\bpid:[0-9]{9}\\b ]]; then
    ((valid++))
  fi
done < <(awk -v RS= '$1=$1' day4.txt)

echo ${valid}
