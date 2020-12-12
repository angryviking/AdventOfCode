#!/bin/bash

# north = +x
# south = -x
# east = +y
# west = -y
input=day12.txt
x=0
y=0
facing=east

while read line; do
#  echo ${line}
  case ${line:0:1} in
      F)
          if [[ ${facing} == "east" ]]; then
            ((y+=${line:1:${#line}}))
          elif [[ ${facing} == "west" ]]; then
            ((y-=${line:1:${#line}}))
          elif [[ ${facing} == "north" ]]; then
            ((x+=${line:1:${#line}}))
          elif [[ ${facing} == "south" ]]; then
            ((x-=${line:1:${#line}}))
          fi
          ;;
      L)
          if [[ ${line:1:${#line}} -eq 90 ]]; then
            if [[ ${facing} == "east" ]]; then
              facing=north
            elif [[ ${facing} == "north" ]]; then
              facing=west
            elif [[ ${facing} == "west" ]]; then
              facing=south
            elif [[ ${facing} == "south" ]]; then
              facing=east
            fi
          elif [[ ${line:1:${#line}} -eq 180 ]]; then
            if [[ ${facing} == "east" ]]; then
              facing=west
            elif [[ ${facing} == "north" ]]; then
              facing=south
            elif [[ ${facing} == "west" ]]; then
              facing=east
            elif [[ ${facing} == "south" ]]; then
              facing=north
            fi
          elif [[ ${line:1:${#line}} -eq 270 ]]; then
            if [[ ${facing} == "east" ]]; then
              facing=south
            elif [[ ${facing} == "north" ]]; then
              facing=east
            elif [[ ${facing} == "west" ]]; then
              facing=north
            elif [[ ${facing} == "south" ]]; then
              facing=west
            fi
          fi
          ;;
      R)
           if [[ ${line:1:${#line}} -eq 90 ]]; then
            if [[ ${facing} == "east" ]]; then
              facing=south
            elif [[ ${facing} == "north" ]]; then
              facing=east
            elif [[ ${facing} == "west" ]]; then
              facing=north
            elif [[ ${facing} == "south" ]]; then
              facing=west
            fi
          elif [[ ${line:1:${#line}} -eq 180 ]]; then
            if [[ ${facing} == "east" ]]; then
              facing=west
            elif [[ ${facing} == "north" ]]; then
              facing=south
            elif [[ ${facing} == "west" ]]; then
              facing=east
            elif [[ ${facing} == "south" ]]; then
              facing=north
            fi
          elif [[ ${line:1:${#line}} -eq 270 ]]; then
            if [[ ${facing} == "east" ]]; then
              facing=noth
            elif [[ ${facing} == "north" ]]; then
              facing=west
            elif [[ ${facing} == "west" ]]; then
              facing=south
            elif [[ ${facing} == "south" ]]; then
              facing=east
            fi
          fi
          ;;
      N)
          ((x+=${line:1:${#line}}))
          ;;
      S)
          ((x-=${line:1:${#line}}))
          ;;
      E)
          ((y+=${line:1:${#line}}))
          ;;
      W)
          ((y-=${line:1:${#line}}))
          ;;
      *)
          echo "Something's not right here."
          exit
          ;;
  esac
#  echo "facing=${facing}"
#  echo "y=${y}"
#  echo "x=${x}"
done < ${input}

echo $((${x#-} + ${y#-}))
