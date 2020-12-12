#!/bin/bash

input=day7.txt

expression=$(grep ^"shiny gold" ${input} | \
  sed -r 's/^(\S+) (\S+) bags contain//g' | \
  sed -r 's/ ([0-9]+) (\S+) (\S+) bags?,/(\1*(\2 \3))+/g' | \
  sed -r 's/ ([0-9]+) (\S+) (\S+) bags?./(\1*(\2 \3))/g')

while [[ $(grep -oE "[a-z]+ [a-z]+" <<< ${expression}) ]]; do
  while read line; do
    replace=$(grep ^"${line}" ${input} | \
      sed -r 's/^(\S+) (\S+) bags contain//g' | \
      sed -r 's/ ([0-9]+) (\S+) (\S+) bags?,/(\1*(\2 \3))+/g' | \
      sed -r 's/ ([0-9]+) (\S+) (\S+) bags?./(\1*(\2 \3))+1/g' | \
      sed 's/ no other bags./1/g')
    expression=$(sed 's/'"${line}"'/'"${replace}"'/' <<< ${expression})
  done < <(grep -oE "[a-z]+ [a-z]+" <<< ${expression})
done

echo $((${expression}))
