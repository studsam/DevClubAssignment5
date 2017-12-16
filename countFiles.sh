#!/bin/sh
initial=`pwd`
cd $1
count="0"
x=`ls *$2 2>/dev/null`
if [ "$?" -eq "0" ]
then
 for i in $x
  do
  count=`expr $count \+ 1`
 done

fi

if [ -z "$2" ]
then

x=`ls -d */ 2>/dev/null`
 if [ "$?" -eq "0" ]
 then
   for i in $x
     do
    count=`expr $count \- 1`
    done
 fi

fi
echo $count
cd $initial
