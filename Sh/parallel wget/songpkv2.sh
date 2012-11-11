#!/bin/bash
#Author : Sudev Ambadi <sudevdev@gmail.com>
#uri creator 
#input is a html link of a particular movie ex: http://www.songspk.pk/indian/rockstar_2011_mp3_songs.html
#returns all links of mp3 files from that movie to a text file songspk
touch songspk
touch songspk1
wget -nvc -O page  $1
echo `cat page | grep -Po 'http://link1.*."'`  >> songspk1
cat songspk1 | tr "\"" "\n" >> songspk
rm page songspk1