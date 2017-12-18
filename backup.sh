#!/bin/bash
count1=`tree -i -f $1 | wc -l`
count1=`expr $count1 \- 2`
count2=`expr $count1 \- 1`
file1="$1"
file2="$2"
len1=`echo "$1"| wc -m`
len2=`echo "$2"| wc -m`

list1=""
for x in `tree -i -f $1| head -$count1| tail -$count2` ;
do
x=`echo "${x:$len1}"`
list1=`
echo "$x
$list1"`
done

count1a=`tree -i -f $2 | wc -l`
count1a=`expr $count1a \- 2`
count2a=`expr $count1a \- 1`
list2=""
for x in `tree -i -f $2| head -$count1a| tail -$count2a` ;
do
x=`echo "${x:$len2}"`
list2=`echo "$x
$list2"`
done
list1=`echo $list1 | sort`
list2=`echo $list2 | sort`


echo "Files copied from $file1 to $file2 are:"

for x in $list1
do
cd $file2
temp=`ls $x 2>/dev/null`
if [ "$?" -ne "0" ]
then
cd $file1
temp=`cat $x 2>/dev/null`
if [ "$?" -eq "0" ]
  then

   echo "$x"
   cp "$file1/$x" $file2
 fi
fi
done

echo "Files copied from $file2 to $file1 are:"

for x in $list2
do
cd $file1
temp=`ls $x 2>/dev/null`
if [ "$?" -ne "0" ]
then
cd $file2
temp=`cat $x 2>/dev/null`
if [ "$?" -eq "0" ]
  then

   echo "$x"
   cp "$file2/$x" $file1
 fi
fi
done

