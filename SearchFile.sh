#!/bin/bash

echo $0
#directory to search
echo $1
#file extention/file type to search
echo $2
#string to search for in file
echo $3
#optional 4th parameter, copy into directory if given, print out files meeting search criteria if not given
echo $4
cd

#find path to directory to search
param1=$(find $HOME -type d -name $1)
param2=$2
param3=$3


cd $param1
#search for the files that meet your criteria
files=$(ls | grep -i "$param3" $param2 | cut -d ":" -f 1)
#check to see which files match your criteria to copy into new directory or print given parameters
if [ -z $4 ]
    then
        echo "Files matching your search criteria:"
        echo ${files[@]}
else
    param4=$(find $HOME -type d -name $4)
#   echo $param4
    for file in ${files[@]}
        do
            cp $file $param4
        done
    echo "Your files were copied"
fi
