#!/bin/bash

#traditional way to download something 
#this script has been improved use url.sh to create uri file containing urls first and
#rum parallel.sh with parameters no of parallel downloads and uri file 
for a in {1..26}
do
res="1280"
		wget -nc --progress=bar "http://ngm.nationalgeographic.com/photo-contest/img/wallpaper/1107wallpaper-"$a"_"$res".jpg"
		wget -nc --progress=bar "http://ngm.nationalgeographic.com/photo-contest/img/wallpaper/1103wallpaper-"$a"_"$res".jpg"
		wget -nc --progress=bar "http://ngm.nationalgeographic.com/photo-contest/img/wallpaper/1027wallpaper-"$a"_"$res".jpg"
		wget -nc --progress=bar "http://ngm.nationalgeographic.com/photo-contest/img/wallpaper/1020wallpaper-"$a"_"$res".jpg"
		wget -nc --progress=bar "http://ngm.nationalgeographic.com/photo-contest/img/wallpaper/1014wallpaper-"$a"_"$res".jpg"
		wget -nc --progress=bar "http://ngm.nationalgeographic.com/photo-contest/img/wallpaper/1006wallpaper-"$a"_"$res".jpg"
		wget -nc --progress=bar "http://ngm.nationalgeographic.com/photo-contest/img/wallpaper/0929wallpaper-"$a"_"$res".jpg"
		wget -nc --progress=bar "http://ngm.nationalgeographic.com/photo-contest/img/wallpaper/0922wallpaper-"$a"_"$res".jpg"
		wget -nc --progress=bar "http://ngm.nationalgeographic.com/photo-contest/img/wallpaper/0915wallpaper-"$a"_"$res".jpg"
		wget -nc --progress=bar "http://ngm.nationalgeographic.com/photo-contest/img/wallpaper/0908wallpaper-"$a"_"$res".jpg"
		wget -nc --progress=bar "http://ngm.nationalgeographic.com/photo-contest/img/wallpaper/0901wallpaper-"$a"_"$res".jpg"
		wget -nc --progress=bar "http://ngm.nationalgeographic.com/photo-contest/img/wallpaper/0825wallpaper-"$a"_"$res".jpg"
		wget -nc --progress=bar "http://ngm.nationalgeographic.com/photo-contest/img/wallpaper/0818wallpaper-"$a"_"$res".jpg"
		wget -nc --progress=bar "http://ngm.nationalgeographic.com/photo-contest/img/wallpaper/0811wallpaper-"$a"_"$res".jpg"


done