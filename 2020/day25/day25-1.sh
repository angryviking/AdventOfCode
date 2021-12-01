#!/bin/bash

count=1
value=1
divval=20201227

until [[ ${value} -eq 576801 ]]; do
  ((value*=7))
  value=$((${value}%${divval}))
  echo ${value}
  ((count++))
done

echo ${count}