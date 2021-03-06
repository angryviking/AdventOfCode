#!/bin/bash

# top left = (x-1,y-1)
# top center = (x-1,y)
# top right = (x-1,y+1)
# left = (x,y-1)
# center = (x,y)
# right = (x,y+1)
# bottom left = (x+1,y-1)
# bottom center = (x+1,y)
# bottom right = (x+1,y+1)

input=day11.txt

declare -A seats
declare -A occupy

load_matrix() {
  local x=0
  local line
  local y
  while read -r line; do
    y=0
    for i in $(sed -e 's/\(.\)/\1\n/g' <<< ${line}); do
      seats[$x,$y]="${i}"
      ((y+=1))
    done
      ((x+=1))
  done
}
load_matrix < ${input}

height=$(wc -l < ${input})
width=$(echo -n $(head -1 ${input}) | wc -m)
count=0
newcount=-1

until [[ ${count} -eq ${newcount} ]]; do
  count=${newcount}

  for ((x=0; x<${height}; x++)); do
    for ((y=0; y<${width}; y++)); do
      full=0
      # diagonal up left
      i=$((x-1))
      j=$((y-1))
      until [[ ${i} -lt 0 || ${j} -lt 0 ]]; do
        if [[ ${seats[${i},${j}]} == "#" ]]; then
          ((full++))
          break
        elif [[ ${seats[${i},${j}]} == "L" ]]; then
          break
        fi
        ((i--))
        ((j--))
      done
      # up
      i=$((x-1))
      j=${y}
      until [[ ${i} -lt 0 ]]; do
        if [[ ${seats[${i},${j}]} == "#" ]]; then
          ((full++))
          break
        elif [[ ${seats[${i},${j}]} == "L" ]]; then
          break
        fi
        ((i--))
      done
      # diagonal up right
      i=$((x-1))
      j=$((y+1))
      until [[ ${i} -lt 0 || ${j} -gt ${width} ]]; do
        if [[ ${seats[${i},${j}]} == "#" ]]; then
          ((full++))
          break
        elif [[ ${seats[${i},${j}]} == "L" ]]; then
          break
        fi
        ((i--))
        ((j++))
      done
      # left
      i=${x}
      j=$((y-1))
      until [[ ${j} -lt 0 ]]; do
        if [[ ${seats[${i},${j}]} == "#" ]]; then
          ((full++))
          break
        elif [[ ${seats[${i},${j}]} == "L" ]]; then
          break
        fi
        ((j--))
      done
      # right
      i=${x}
      j=$((y+1))
      until [[ ${j} -gt ${width} ]]; do
        if [[ ${seats[${i},${j}]} == "#" ]]; then
          ((full++))
          break
        elif [[ ${seats[${i},${j}]} == "L" ]]; then
          break
        fi
        ((j++))
      done
      # diagonal down left
      i=$((x+1))
      j=$((y-1))
      until [[ ${i} -gt ${height} || ${j} -lt 0 ]]; do
        if [[ ${seats[${i},${j}]} == "#" ]]; then
          ((full++))
          break
        elif [[ ${seats[${i},${j}]} == "L" ]]; then
          break
        fi
        ((i++))
        ((j--))
      done
      # down
      i=$((x+1))
      j=${y}
      until [[ ${i} -gt ${height} ]]; do
        if [[ ${seats[${i},${j}]} == "#" ]]; then
          ((full++))
          break
        elif [[ ${seats[${i},${j}]} == "L" ]]; then
          break
        fi
        ((i++))
      done
      # diagonal down right
      i=$((x+1))
      j=$((y+1))
      until [[ ${i} -gt ${height} || ${j} -gt ${width} ]]; do
        if [[ ${seats[${i},${j}]} == "#" ]]; then
          ((full++))
          break
        elif [[ ${seats[${i},${j}]} == "L" ]]; then
          break
        fi
        ((i++))
        ((j++))
      done
      
      if [[ ${full} -eq 0 && ${seats[${x},${y}]} == "L" ]]; then
        occupy[${x},${y}]="occupy"
      elif [[ ${full} -ge 5 && ${seats[${x},${y}]} == "#" ]]; then
        occupy[${x},${y}]="vacate"
      else 
        occupy[${x},${y}]="static"
      fi

    done
  done

  for ((x=0; x<${height}; x++)); do
    for ((y=0; y<${width}; y++)); do
      [[ ${occupy[${x},${y}]} == "occupy" ]] && seats[${x},${y}]="#"
      [[ ${occupy[${x},${y}]} == "vacate" ]] && seats[${x},${y}]="L"
    done
  done
  newcount=$(grep -o "#" <<< ${seats[@]} | wc -l)
done

echo ${newcount}
