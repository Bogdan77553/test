#!/bin/sh

countStrings=$(awk '/found/{print $0}' mylab.cpp)
count=$(echo $countStrings | awk '{aq=$3; printf "%d",aq}')

workStrings=$(awk '/ip/{print $0}' mylab.cpp)
echo "w=$workStrings" > tmp.txt

#echo $count

echo "" | awk '{printf "{\n\"Dev\": [\n"}'


c=0
i=0
while [ "$c" -lt "$count" ]; do
  
   #echo $workStrings | awk '{a=$2; c=$6; d=$4; 
   #printf "dev:%s mac=%s ip=%s\n",a,c,d}'
   
   c=$(($c+1))
   i=$(($i+1))
   
   printf "dev $i"

   if [ $i != $count ]; then
      echo ","
   fi
done

#awk '{a=$2; c=$6; d=$4;
#{printf "{\n\"devNumber\": \"%s\",\n\"mac\": \"%s\",\n\"ip\": \"%s\",\n},",a,c,d}' tmp.txt >> json

echo "" | awk '{printf "\n]\n}\n"
}'

#rm tmp.txt
