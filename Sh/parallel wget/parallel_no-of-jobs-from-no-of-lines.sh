#! /bin/bash
#Sudev Ambadi

if [ $# -ne 2 ]
  then
    echo "Format ./parallel.sh  <path-to-urlfile>"
fi

no=`cat $1 | wc -l`
parallel -j $no wget -nvc --progress=bar < $1