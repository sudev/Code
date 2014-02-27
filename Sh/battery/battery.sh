#!/bin/bash
#Author Sudev Ambadi
#crontab to be created to run the script so that we can track the battery performance 
#crontab entry - */5 * * * * /path-to-this script
    date >> /home/sudev/.batlog
    upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "state|time|per" >> /home/sudev/.batlog
    echo $'\n' >> /home/sudev/.batlog
