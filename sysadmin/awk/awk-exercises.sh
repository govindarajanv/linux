# print contents of a file
awk ' { print } ' /etc/ntp.conf

#use begin and end blocks
awk ' BEGIN { print "ntp.conf" } { print } END { print NR} ' /etc/ntp.conf 

#print contents with each line bearing a line number
awk ' BEGIN { print "ntp.conf" } { print NR,$0 } END { print NR} ' /etc/ntp.conf 

#get inet6 from ifconfig
ifconfig enp0s8|awk -F ":" ' /inet6/ { print $3 $4 $5 }'
ifconfig enp0s8|awk -F ":" ' /inet6/ { print toupper($3 $4 $5) }'
