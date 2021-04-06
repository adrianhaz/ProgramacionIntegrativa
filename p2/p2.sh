#! /bin/bash

for i in $(find -type f);
do 
		N="$(basename $i)"
		if grep -q "$1" <<< "$N";
		then
				echo "$i";
		fi
done