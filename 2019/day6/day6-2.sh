#!/bin/bash

find_path(){
  start=$(grep "${person}" day6.txt)
  path+=(${start%)*})
  while [ $(grep ")${start%)*}" day6.txt) ]; do
    new_start=$(grep ")${start%)*}" day6.txt)
    path+=(${new_start%)*})
    start=(${new_start%)*})
  done
  echo ${path[@]}
}

unset path
person="YOU"
find_path

unset path
person="SAN"
find_path