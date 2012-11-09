#!/bin/bash
#Author : Sudev Ambadi <sudevdev@gmail.com>


#Inspired from jaseem abid to set a wallpaper in Xfce from Natgeo
# Make cache directory
#dir=~/.wpoftheday


echo -ne "Fecthing link.. \n"
page="http://photography.nationalgeographic.com/photography/photo-of-the-day/"
wget -q -O p1  $page

# echo "Scraping the link"
 
# get the previous days picks link 
prev=$(cat p1 | grep -r previous |  grep -Po 'day/.*./' | sed s:day/::)
#Downloading the previous day html
wget -q -O p2  $page$prev
# link for the image 
link=$(cat p2 | grep "Download Wallpaper" |  grep -Po 'http.*.jpg')

#wget -c -P /home/sudev/Downloads/Natgeo --progress=bar:force $link
echo -ne "Downloading $prev:..\n"
wget -nvc $link
echo -ne "\b\b\b\b"
echo -ne "Done Downloading \n"
file=$(echo  $link |  grep -Po '[-\w]*.jpg')
# Set picture $file as desktop background
# 0 - Auto, 1 - Centered, 2 - Tiled, 3 - Stretched, 4 - Scaled, 5 - Zoomed
mv $file 1.jpg
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/image-path -s 1.jpg
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/image-style -s 0
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/image-show -s false
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/image-show -s true
echo -ne "\nWallpaper set \n Saved to ~/Natgeo\n"
[ -d ~/Natgeo ] || mkdir ~/Natgeo
mv 1.jpg ~/Natgeo/`date +%d-%m-%Y`.jpg
# Delete index file if it exists
rm p1 p2