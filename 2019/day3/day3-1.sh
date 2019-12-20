#!/bin/bash

# U = Up = +y
# D = Down = -y
# R = Right = +x
# L = Left = -x

unset wire1
unset wire2
rm -rf wire1.txt wire2.txt points.txt totals.txt

x=0
y=0
count=1

for i in $(cat day3.txt); do
  IFS=',' read -r -a  wire${count} <<< "${i}"
  ((count++))
done

#wire1=(R8 U5 L5 D3)
#wire2=(U7 R6 D4 L4)
#wire1=(R75 D30 R83 U83 L12 D49 R71 U7 L72)
#wire2=(U62 R66 U55 R34 D71 R55 D58 R83)
#wire1=(R98 U47 R26 D63 R33 U87 L62 D20 R33 U53 R51)
#wire2=(U98 R91 D20 R16 D67 R40 U7 R15 U6 R7)

count=1
while [ ${count} -le 2 ]; do
  wire=wire${count}
  for i in $(eval echo \${wire$count[@]}); do
    case ${i:0:1} in
      U)  
          y1=$((${y}+${i:1}))
          until [ ${y} -ge ${y1} ]; do
            echo "${x} ${y}" >> ${wire}.txt
            ((y++))
          done 
          ;;
      D)
          y1=$((${y}-${i:1}))
          until [ ${y} -le ${y1} ]; do
            echo "${x} ${y}" >> ${wire}.txt
            ((y--))
          done
          ;;
      R)
	        x1=$((${x}+${i:1}))
          until [ ${x} -ge ${x1} ]; do
            echo "${x} ${y}" >> ${wire}.txt
            ((x++))
          done
          ;;
      L)  
          x1=$((${x}-${i:1}))
          until [ ${x} -le ${x1} ]; do
            echo "${x} ${y}" >> ${wire}.txt
            ((x--))
          done
          ;;
      *)  
          echo "Something's not right here.... "
          echo ${i:0:1}
          exit
          ;;
    esac
  done
  echo "${x} ${y}" >> ${wire}.txt
  ((count++))
  x=0
  y=0
done

comm -12 <(sort wire1.txt) <(sort wire2.txt) > points.txt
sum=0

while read p; do
  for i in ${p}; do
    num=${i#-}
    sum=$((${sum}+${num}))
  done
  echo "${p} ${sum}" >> totals.txt
  sum=0
done <points.txt 

sort -k3 -n totals.txt | head -2
