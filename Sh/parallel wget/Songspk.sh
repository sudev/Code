#!/bin/bash
#Author : Sudev Ambadi <sudevdev@gmail.com>

#uri creator 
touch songspk
for i in {8806..8819}
do
echo http://link1.songspk.pk/song1.php?songid=$i >> songspk
done
