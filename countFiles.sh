#!/bin/sh
initial=`pwd`
cd $1
count="0"
x=`ls *$2`
if [ "$?" -eq "0" ]
 then
 for i in *$2
  do 
  count=`expr $count \+ 1`
  done
fi

echo $count
cd $initial
