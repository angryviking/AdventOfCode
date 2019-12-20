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

origin="SAN"
find_path
path_san=(${path[@]})

result_san=(${path_san[@]})
for planet in ${path_you[@]}; do
  result_san=(${result_san[@]/*${planet}*/})
done

result_you=(${path_you[@]})
for planet in ${path_san[@]}; do
  result_you=(${result_you[@]/*${planet}*/})
done

echo $((${#result_you[@]}+${#result_san[@]}-2))