#!/bin/bash
rm -f link.txt
dir=$(echo $1 | awk -F/ '{print $4"/"$7}')

lynx --dump $1 | awk 'NR%2==0'| awk '/http/{print $2}' | grep 4cdn >> link.txt

aria2c -x 16 -j 5 -i link.txt -d "$dir" $i
