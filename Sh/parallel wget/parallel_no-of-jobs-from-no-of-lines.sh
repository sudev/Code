#!/bin/bash
#Author : Sudev Ambadi <sudevdev@gmail.com>

if [ $# -ne 2 ]
  then
    echo "Format ./parallel.sh  <path-to-urlfile>"
fi

no=`cat $1 | wc -l`
echo -ne "Total  "$no"  Wgets are running\n"
parallel -j $no wget -nvc --progress=bar < $1