#/bin/bash


# Make cache directory
dir=~/.wpoftheday
[ -d $dir ] || mkdir $dir

# CD to cache dir
cd $dir

# Delete index file if it exists
[ -e p1 ] || rm p1
[ -e p2 ] || rm p2

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
echo -n "Downloading $prev:.."
echo -n "    "
wget --progress=dot $link 2>&1 | grep --line-buffered "%" | sed -u -e "s,\.,,g" | awk '{printf("\b\b\b\b%4s", $2)}'
echo -ne "\b\b\b\b"
echo " DONE"
