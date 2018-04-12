#!/bin/sh

workStrings=$(awk '/ip/{print $0}' mylab.cpp)
echo "w=$workStrings" > tmp.txt

#echo $workStrings | awk '{a=$2; c=$6; d=$4; 
#printf "dev:%s mac=%s ip=%s\n",a,c,d}'

echo "" | awk '{printf "{\n\"Dev\": [\n"}'


#awk '{a=$2; c=$6; d=$4;
#printf "{\n\"devNumber\": \"%s\",\n\"mac\": \"%s\",\n\"ip\": \"%s\",\n},",a,c,d}' tmp.txt >> json

#$(echo "" | awk '{
#printf "],\n}"
#}') >> json
#rm tmp.txt
