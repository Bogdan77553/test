#!/bin/sh

countStrings=$(awk '/found/{print $0}' mylab.cpp)
N=$(echo $countStrings | awk '{aq=$3; printf "%d",aq}')

awk 'BEGIN {count=0; printf "{\n\"Board\": [\n"}
END {printf "\n]\n}\n"}
{sub(/\[\]/,"NULL")}  
{sub(/\[/,""); sub(/\]/,"")} 
{sub(/\[/,""); sub(/\]/,"")}  
{if (/device/)
{a=$2; c=$6; d=$4; k=$14; 
printf "{\n\"dev\": \"%s\",\n \"mac\": \"%s\",\n \"ip\": \"%s\",\n\"kay\": \"%s\"\n}",a,c,d,k}} 
{count = count + 1; if ((count < $N)&&(count>1)){ print(",")}  }  ' mylab.cpp > json
