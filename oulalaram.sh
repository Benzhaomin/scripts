ps -e -orss=,args= | sort -b -k1,1n | pr -TW$COLUMNS
