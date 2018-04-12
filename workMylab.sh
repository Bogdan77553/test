#!/bin/sh

countStrings=$(awk '/found/{print $0}' mylab.cpp)
count=$(echo $countStrings | awk '{aq=$3; printf "%d",aq}')

echo "" | awk '{printf "{\n\"Board\": [\n"}' > json

i=1
awk '/device \[/{print $0}' mylab.cpp > temp
      

FILE="temp"
while read line; do
     echo "{" >> json
     echo "$line"| awk '{a=$2; c=$6; d=$4; 
     printf "\"dev\": \"%s\",\n \"mac\": \"%s\",\n \"ip\": \"%s\"\n",a,c,d}' >> json
     
     printf "}" >> json
     if [ $i != $count ]; then
        echo "," >> json
     fi
     printf "\n" >> json

   i=$(($i+1))

done < $FILE 


#awk '{a=$2; c=$6; d=$4;
#{printf "{\n\"devNumber\": \"%s\",\n\"mac\": \"%s\",\n\"ip\": \"%s\",\n},",a,c,d}' tmp.txt >> json

echo "" | awk '{printf "\n]\n}\n" 
}' >> json

#rm -f temp
