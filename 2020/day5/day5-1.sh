#!/bin/bash

# Formulas needed for math
# Let r = range
# Let s = start position
# Let e = end position
# r = (e-s)+1
# F/L = e=((r/2)-1)+s
# B/R = s=(r/2)+s

passes+=($(cat day5.txt))

count=0
while [ ${count} -lt ${#passes[@]} ]; do
  rowstart=0
  rowend=127
  rowrange=$((${rowend}-${rowstart}+1))
  while read -n1 row; do
    if [[ ${row} == "F" ]]; then
      rowend=$((${rowrange}/2-1+${rowstart}))
    elif [[ ${row} == "B" ]]; then
      rowstart=$((${rowrange}/2+${rowstart}))
    fi
    rowrange=$((${rowend}-${rowstart}+1))
  done < <(echo -n ${passes[${count}]:0:6})
  if [[ ${passes[${count}]:6:1} == "F" ]]; then
    seatrow=${rowstart}
  elif [[ ${passes[${count}]:6:1} == "B" ]]; then
    seatrow=${rowend}
  fi
  colstart=0
  colend=7
  colrange=$((${colend}-${colstart}+1))
  while read -n1 col; do
    if [[ ${col} == "L" ]]; then
      colend=$((${colrange}/2-1+${colstart}))
    elif [[ ${col} == "R" ]]; then
      colstart=$((${colrange}/2+${colstart}))
    fi
    colrange=$((${colend}-${colstart}+1))
  done < <(echo -n ${passes[${count}]:7:3})
  if [[ ${passes[${count}]:9:1} == "L" ]]; then
    seatcol=${colstart}
  elif [[ ${passes[${count}]:9:1} == "R" ]]; then
    seatcol=${colend}
  fi
  seatid+=($((${seatcol}+${seatrow}*8)))
  ((count++))
done

max=${seatid[0]}
for m in ${seatid[@]} ; do
  ((m > max)) && max=$m
done

echo ${max}
