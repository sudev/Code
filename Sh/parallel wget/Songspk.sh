#!/bin/bash
#Author : Sudev Ambadi <sudevdev@gmail.com>

#uri creator 
touch songspk
for i in {1..91}
do
echo https://class.coursera.org/bigdata-2012-001/lecture/download.mp4?lecture_id=$i >> songspk
done
