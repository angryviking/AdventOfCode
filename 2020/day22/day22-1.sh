#!/bin/bash

player1=(17 19 30 45 25 48 8 6 39 36 28 5 47 26 46 20 18 13 7 49 34 23 43 22 4)
player2=(44 10 27 9 14 15 24 16 3 33 21 29 11 38 1 31 50 41 40 32 42 35 37 2 12)

while true; do
  if [[ ${#player1[@]} -eq 0 || ${#player2[@]} -eq 0 ]]; then
    product=1
    pos=-1
    if [[ ${#player1[@]} -gt 0 ]]; then
      for ((count=0; count<${#player1[@]}; count++)); do 
        ((sum+=${product}*${player1[${pos}]}))
        ((product++))
        ((pos--))
      done
    else
      for ((count=0; count<${#player2[@]}; count++)); do
        ((sum+=${product}*${player2[${pos}]}))
        ((product++))
        ((pos--))
      done
    fi
    echo ${sum}
    exit
  fi
  if [[ ${player1[0]} -gt ${player2[0]} ]]; then
    player1+=(${player1[0]})
    player1+=(${player2[0]})
    player1=("${player1[@]:1}")
    player2=("${player2[@]:1}")
  else
    player2+=(${player2[0]})
    player2+=(${player1[0]})
    player2=("${player2[@]:1}")
    player1=("${player1[@]:1}")  
  fi 
done
