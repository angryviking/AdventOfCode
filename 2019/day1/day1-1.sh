#!/bin/bash

unset array

for i in $(cat day1.txt); do
  array+=($((${i}/3-2)))
done

sum=$(IFS=+; echo "$((${array[*]}))")
echo ${sum}
