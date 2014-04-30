###Converting NEF to PNG
It takes a lot of time if you converting NEF files to PNG using the usual for loop in terminal. 

##Example 
 dcraw -c -w $filename | pnmtopng > $filename.png
 \#this command is used to convert NEF files to PNG 

 we usually put this inside a for loop 
 
 
 {% hgighlight bash %}
 for filename in *NEF;
 do 
      dcraw -c -w $filename | pnmtopng > $filename.png;
done
 {% endhgighlight %}

 \#this is too inefficient 

###Using GNU Parallel 
#Write a script with the following content 

function convert_func {

      filename=$1
        dcraw -c -w $filename | pnmtopng > $filename.png
}

export -f convert_func

parallel convert_func ::: ./*.NEF

#Run the script inside the desired folder. Now parallel will make use of all the cores available in your system creating more no of dcraws simultaneously.

