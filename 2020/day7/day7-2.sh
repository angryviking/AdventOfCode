#!/bin/bash

input=day7.txt
output=day7_out.txt
bag="shiny gold"
rm -rf ${output}

grep ^"${bag}" ${input} | sed -r 's/^(\S+) (\S+) bags contain /\1_\2=$((/g' \
                        | sed -r 's/([0-9]+) (\S+) (\S+) bags?,/(\1*(\2 \3)) +/g' \
                        | sed -r 's/([0-9]+) (\S+) (\S+) bags?./(\1*(\2 \3))))/g' \
                        | sed 's/no other bags./1))/g' > ${output}

while [[ $(grep -oE "[a-z]+ [a-z]+" ${output}) ]]; do
  while read line; do
    replace=$(grep ^"${line}" ${input} | sed -r 's/^(\S+) (\S+) bags contain //g' \
                                       | sed -r 's/([0-9]+) (\S+) (\S+) bags?,/(\1*(\2 \3)) +/g' \
                                       | sed -r 's/([0-9]+) (\S+) (\S+) bags?./(\1*(\2 \3)) + 1/g' \
                                       | sed 's/no other bags./1/g')
    sed -i 's/'"${line}"'/'"${replace}"'/' ${output}
  done < <(grep -oE "[a-z]+ [a-z]+" ${output})
done

source ${output}
echo $((${shiny_gold}))
rm -rf ${output}
