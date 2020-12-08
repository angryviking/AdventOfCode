#!/bin/bash

input=day7.txt

sum=0
get_bags() {
  while read line; do
    outer=$(echo ${line} | awk '{ print $1" "$2}')
    if [[ ! "${found[@]}" =~ "${outer}" ]]; then
      found+=("${outer}")
      get_bags
    fi
  done < <(grep "${outer}" ${input} | grep -v ^"${outer}")
}

outer="shiny gold"
get_bags

echo ${#found[@]}
