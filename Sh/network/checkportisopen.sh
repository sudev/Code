#!/bin/bash

#   ./script <ip-addr> <port-num>
#Amazingly slow network script to check if a port is open 
#input give a port number as the argunmrnt 
#to run this script you need to have netcat installed in your system

nc -z $1 $2
if [ $? -eq 0 ]
then
    echo $2"    port is open in ip   "$1;
fi
exit 0

