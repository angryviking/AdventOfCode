#!/bin/bash

find_path(){
  orbitee=${origin%)*}
  while [ $(grep ")${orbitee}" day6.txt) ]; do
    path+=(${orbitee%)*})
    orbiter=$(grep ")${orbitee}" day6.txt)
    orbitee=${orbiter%)*}
  done
}

origin="YOU"
find_path
path_you=(${path[@]})
unset path
echo ${path_you[@]}

origin="SAN"
find_path
path_san=(${path[@]})
echo ${path_san[@]}