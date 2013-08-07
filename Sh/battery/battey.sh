#!/bin/bash
#Author Sudev Ambadi
    date >> /home/sudev/.batlog
    upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "state|time|per" >> /home/sudev/.batlog
    echo $'\n' >> /home/sudev/.batlog
