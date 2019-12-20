#!/bin/bash

sum=0

for i in $(cat day6.txt); do
  ((sum++))
  orbitee=${i%)*}
  while [ $(grep ")${orbitee}" day6.txt) ]; do
    ((sum++))
    orbiter=$(grep ")${orbitee}" day6.txt)
    orbitee=${orbiter%)*}
  done
done

echo ${sum}