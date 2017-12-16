#!/bin/sh
x="0"
file="$1"
while read -r f1 f2

do
  x=`expr "$x" "\$f2" "$f1"`
done<"$file"
echo $x
