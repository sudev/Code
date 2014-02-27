#!/bin/bash
#Author : Sudev Ambadi <sudevdev@gmail.com>

#this script is usefull to run many wget process parally 
#two parameters are required no of desired parall wget process and path to text file
if [ $# -ne  ]
  then
    echo "Format ./parallel.sh <no of parallel downloads> <path-to-urlfile>"
fi


parallel -j $1 wget -nvc --progress=bar < $2