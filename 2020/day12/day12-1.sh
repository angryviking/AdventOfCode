#!/bin/bash

# east = +x
# west = -x
# north = +y
# south = -y

input=day12.txt
x=0
y=0
facing=east

while read line; do
  case ${line:0:1} in
    F)
      case ${facing} in
        east)
          ((x+=${line:1:${#line}}))
          ;;
        west)
          ((x-=${line:1:${#line}}))
          ;;
        north)
          ((y+=${line:1:${#line}}))
          ;;
        south)
          ((y-=${line:1:${#line}}))
          ;;
      esac
      ;;
    L)
      case ${line:1:${#line}} in
        90)
          case ${facing} in
            east)
              facing=north
              ;;
            west)
              facing=south
              ;;
            north)
              facing=west
              ;;
            south)
              facing=east
              ;;
          esac
          ;;
        180)
          case ${facing} in
            east)
              facing=west
              ;;
            west)
              facing=east
              ;;
            north)
              facing=south
              ;;
            south)
              facing=north
              ;;
          esac
          ;;
        270)
          case ${facing} in
            east)
              facing=south
              ;;
            west)
              facing=north
              ;;
            north)
              facing=east
              ;;
            south)
              facing=west
              ;;
          esac
          ;;
      esac
      ;;
    R)
      case ${line:1:${#line}} in
        90)
          case ${facing} in
            east)
              facing=south
              ;;
            west)
              facing=north
              ;;
            north)
              facing=east
              ;;
            south)
              facing=west
              ;;
          esac
          ;;
        180)
          case ${facing} in
            east)
              facing=west
              ;;
            west)
              facing=east
              ;;
            north)
              facing=south
              ;;
            south)
              facing=north
              ;;
          esac
          ;;
        270)
          case ${facing} in
            east)
              facing=north
              ;;
            west)
              facing=south
              ;;
            north)
              facing=west
              ;;
            south)
              facing=east
              ;;
          esac
          ;;
      esac
      ;;
    E)
      ((x+=${line:1:${#line}}))
      ;;
    W)
      ((x-=${line:1:${#line}}))
      ;;
    N)
      ((y+=${line:1:${#line}}))
      ;;
    S)
      ((y-=${line:1:${#line}}))
      ;;
    *)
      echo "Something's not right here."
      exit
      ;;
  esac
done < ${input}

echo $((${x#-} + ${y#-}))
