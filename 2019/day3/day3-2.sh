#!/bin/bash

oper1=0
oper2=0
sum=0
rm -rf distance.txt

sed -i 's/ /,/g' points.txt
sed -i 's/ /,/g' wire1.txt
sed -i 's/ /,/g' wire2.txt

for i in $(cat points.txt); do
  oper1=$(sed -n '0,/^'${i}'$/p' wire1.txt | wc -l)
  oper2=$(sed -n '0,/^'${i}'$/p' wire2.txt | wc -l)
  sum=$(expr ${oper1} + ${oper2})
  echo ${sum} >> distance.txt
done

sort -n distance.txt | head -1
