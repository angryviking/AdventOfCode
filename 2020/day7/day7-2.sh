#!/bin/bash

input=day7.txt

expression=$(grep ^"shiny gold" ${input} | \
  sed -r 's/^(\S+) (\S+) bags contain//g' | \
  sed -r 's/ ([0-9]+) (\S+) (\S+) bags?,/(\1*(\2 \3))+/g' | \
  sed -r 's/ ([0-9]+) (\S+) (\S+) bags?./(\1*(\2 \3))/g')

while [[ $(echo ${expression} | grep -oE "[a-z]+ [a-z]+") ]]; do
  while read line; do
    replace=$(grep ^"${line}" ${input} | \
      sed -r 's/^(\S+) (\S+) bags contain//g' | \
      sed -r 's/ ([0-9]+) (\S+) (\S+) bags?,/(\1*(\2 \3))+/g' | \
      sed -r 's/ ([0-9]+) (\S+) (\S+) bags?./(\1*(\2 \3))+1/g' | \
      sed 's/ no other bags./1/g')
    expression=$(echo ${expression} | sed 's/'"${line}"'/'"${replace}"'/')
  done < <(echo ${expression} | grep -oE "[a-z]+ [a-z]+")
done

echo $((${expression}))
