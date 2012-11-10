#!/bin/bash
#Author : Sudev Ambadi <sudevdev@gmail.com>
#script rename mp3 files downloaded from sonspk Enter the desired destination and sorts with movie name and puts them to different folders 
#this script requires  eyed3 installed to run

read a 
cd $a
pwd
for f in song*
do
dir=`eyeD3 song1.php\?songid\=8813 | grep album  | awk '{print $2}'`
echo -ne $dir"\n"
[ -d $dir ] || mkdir $dir
a=`eyeD3  $f | grep title | cut -f1 -d"-" | cut -d\  -f2`
mv $f $a.mp3
mv $a.mp3 $dir/
done
