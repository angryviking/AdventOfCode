#!/bin/bash

unset orbiting
sum=0
start="YOU"
end="SAN"

find_path(){
for i in $(grep "${orbiting}" day6.txt | grep -v "${start}"); do
  if [ $(echo ${i} | grep "^${orbiting}") ]; then
    options+=(${i#*)})
  else 
    options+=(${i%)*})
  fi
done
}

orbiting=$(grep "${start}" day6.txt | awk -F')' '{print $1}')
find_path
for p in ${options[@]}; do
  orbiting=${p}
  find_path
done
echo ${options[@]}

unset options

start="SAN"
orbiting=$(grep "${start}" day6.txt | awk -F')' '{print $1}')
find_path
for p in ${options2[@]}; do
  orbiting=${p}
  find_path
done
echo ${options[@]}
