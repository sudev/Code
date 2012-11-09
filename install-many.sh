#!/bin/bash
Author : Sudev Ambadi <sudevdev@gmail.com>

#Enter all the required softwres to be installed within the array 
array=( vlc chromium-browser kate geany gnome-do  linuxdccp)
for i in "${array[@]}"
do
	sudo apt-get install $i
done

