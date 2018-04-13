#!/bin/sh

countStrings=$(awk '/found/{print $0}' mylab.cpp)
count=$(echo $countStrings | awk '{aq=$3; printf "%d",aq}')

echo "" | awk '{printf "{\n\"Board\": [\n"}' > json

i=1
awk '/device \[/{print $0}' mylab.cpp > temp
      
FILE="temp"
while read line; do
     echo "{" >> json
     asd=$(echo "$line" | sed 's/\[\]/0/g') 
     asd=$(echo $asd | sed 's/\[//g; s/\]//g')
     
     echo "$asd"| awk '{
     a=$2; c=$6; d=$4; k=$14; 
     printf "\"dev\": \"%s\",\n \"mac\": \"%s\",\n \"ip\": \"%s\",\n\"kay\": \"%s\"\n",a,c,d,k}' >> json
     
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
