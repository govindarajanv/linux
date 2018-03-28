# print contents of a file
awk ' { print } ' /etc/ntp.conf

#use begin and end blocks
awk ' BEGIN { print "ntp.conf" } { print } END { print NR} ' /etc/ntp.conf 

#print contents with each line bearing a line number
awk ' BEGIN { print "ntp.conf" } { print NR,$0 } END { print NR} ' /etc/ntp.conf 

#get inet6 from ifconfig
ifconfig enp0s8|awk -F ":" ' /inet6/ { print $3 $4 $5 }'
ifconfig enp0s8|awk -F ":" ' /inet6/ { print toupper($3 $4 $5) }'

#just like control file .sed you can use .awk file
# FS - File separator
# NR - Number of records
# BEGIN and END blocks are executed only one except for the unnamed block
$cat users.awk
BEGIN { FS=":" ; print "Username" }
{ print $1 }
END { print "Total user = " NR }

# modify the above command to print if UID is greater than 499
$cat users.awk
BEGIN { FS=":" ; print "Username" }
$3 > 499 { print $1 }
END { print "Total user = " NR }

# count the returned rows
$cat users.awk
BEGIN { FS=":" ; print "Username" }
/^root/ { print $1; count++ }
END { print "Total users = " count }

#usage awk -f users.awk /etc/passwd


