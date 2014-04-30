function convert_func {

  filename=$1
  dcraw -c -w $filename | pnmtopng > $filename.png
}

export -f convert_func

parallel convert_func ::: ./*.NEF