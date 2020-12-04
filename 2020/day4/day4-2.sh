#!/bin/bash

while read line; do
  if [[ ${line} =~ (byr:19[2-9][0-9]|byr:200[0-2]) && \
        ${line} =~ (iyr:201[0-9]|iyr:2020) && \
        ${line} =~ (eyr:202[0-9]|eyr:2030) && \
        ${line} =~ (hgt:1[5-8][0-9]cm|hgt:19[0-3]cm|hgt:59in|hgt:6[0-9]in|hgt:7[0-6]in) && \
        ${line} =~ (hcl:'#'[0-9a-f]{6}) && \
        ${line} =~ (ecl:amb|ecl:blu|ecl:brn|ecl:grn|ecl:gry|ecl:hzl|ecl:oth) && \
        ${line} =~ (pid:[0-9]{9}) ]]; then
    passports+=("${line}")
  fi
done < <(awk -v RS= '$1=$1' day4.txt | awk '/byr:/ && /iyr:/ && /eyr:/ && /hgt:/ && /hcl:/ && /ecl:/ && /pid:/')

echo ${#passports[@]}
