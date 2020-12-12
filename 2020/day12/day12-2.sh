#!/bin/bash

# east = +x
# west = -x
# north = +y
# south = -y

input=day12.txt
sx=0
sy=0
wx=10
wy=1

while read line; do
  case ${line:0:1} in
    F)
      ((sx+=${wx}*${line:1:${#line}}))
      ((sy+=${wy}*${line:1:${#line}}))
      ;;
    L)
      case ${line:1:${#line}} in
        90)
          owx=${wx}
          owy=${wy}
          wx=$((-1*${owy}))
          wy=$((${owx}))
          ;;
        180)
          owx=${wx}
          owy=${wy}
          wx=$((-1*${wx}))
          wy=$((-1*${wy}))
          ;;
        270)
          owx=${wx}
          owy=${wy}
          wx=$((${owy}))
          wy=$((-1*${owx}))
          ;;
      esac
      ;;
    R)
      case ${line:1:${#line}} in
        90)
          owx=${wx}
          owy=${wy}
          wx=$((${owy}))
          wy=$((-1*${owx}))
          ;;
        180)
          owx=${wx}
          owy=${wy}
          wx=$((-1*${wx}))
          wy=$((-1*${wy}))
          ;;
        270)
          owx=${wx}
          owy=${wy}
          wx=$((-1*${owy}))
          wy=$((${owx}))
          ;;
      esac
      ;;
    E)
        ((wx+=${line:1:${#line}}))
        ;;
    W)
        ((wx-=${line:1:${#line}}))
        ;;
    N)
        ((wy+=${line:1:${#line}}))
        ;;
    S)
        ((wy-=${line:1:${#line}}))
        ;;
    *)
        echo "Something's not right here."
        exit
        ;;
  esac
done < ${input}

echo $((${sx#-} + ${sy#-}))
