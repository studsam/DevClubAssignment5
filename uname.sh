#!/bin/bash
file="$1"
j=`echo $1 | tail -c 5`
if [ -z "$1" ]
 then
   if [ -z "$2"]
    then

           exit 1
   fi
 else
   if [ ".txt" != "$j" ]
    then

     echo
     exit 1
   fi
fi
x="0"
while IFS=: read -r f1 f2 f3 f4 f5 f6 f7
do
 if [ "$f1" == "$2" ]
 then
  echo "$f5"
  x="1"
  fi
done<"$file"
if [ "$x" -ne "1" ]
then echo "Invalid Username"
fi


