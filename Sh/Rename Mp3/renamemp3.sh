#!/bin/bash
#Author : Sudev Ambadi <sudevdev@gmail.com>

#script rename mp3 files downloaded from sonspk Enter the desired destination 
#this script requires  eyed3 installed to run
read a 
cd $a
pwd
for f in song*
do 
a=`eyeD3  $f | grep title | cut -f1 -d"-" | cut -d\  -f2`
mv $f $a.mp3
done
