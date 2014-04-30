#Converting NEF to PNG
Helpful in a situation where you have to convert thousands of NEF files to PNG format using terminal and you have a multicore system. Remeber to install gnu parallel before trying out the script. The example given below can be used to convert any for loop to GNU parallel loop.

##Example 
 dcraw -c -w $filename | pnmtopng > $filename.png   /** this command is used to convert NEF files to PNG **/
 
 /** what we usually do is to put this inside a for loop **/
 
 ```bash
 for filename in *NEF;
 do 
      dcraw -c -w $filename | pnmtopng > $filename.png;
 done
 ```

This for loop will only execute one dcraw at a time and will never use more than one core of your multicore system. 

#Using GNU Parallel 
###Write a script with the following content 

```bash
function convert_func {

      filename=$1
        dcraw -c -w $filename | pnmtopng > $filename.png
}


export -f convert_func

parallel convert_func ::: ./*.NEF
```

###Run the script inside the desired folder. Now parallel will make use of all the cores available in your system creating more no of dcraws simultaneously.

