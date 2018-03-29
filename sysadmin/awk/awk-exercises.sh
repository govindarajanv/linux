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

# to negate the choice, user says he does not want these conditions
#  !(/Never logged in/ || /^Username/ || /^root/) 

# $0 represents the complete line and ~ represents the match; simply print will also print the whole line
# use sed to add a new line to virtualhost.conf
awk -f virtualhost.awk search=example virtualhost.conf

#To search saw from catalog/tool.xml
awk -f virtualhost.awk search=saw catalog/tool.xml

# [><] represents either or field separator
# print in the below middle block is for printing the entire line
# if you want to print 4th column print $4
BEGIN {                 
        FS="[><]";      
        RS="\n\n";      
        OFS=" ";        
}                       
$0 ~ search {           
        print           
}                       

#Before processing any log file understand its schema
#for example, web access logs could have the following schema
# Field 1 	-	Client ip
# Field2/3	-	identd and user id ( --)
# Field 4/5	-	Time and Time zone
# Field 6/7/8	-	Method (GET/POST), File and Protocol
# Field 9	-	Status code
# Field 10	-	size

# To look for error 404 in webserver access log
awk '$9 == 404 { print $0 } ' access.log

# count unique access by a clinet
# in the count awk script, array uses $i ip address which is a named array that stores a key for each ip address
# value of key is incremented each time ip address is found
#ip[10.1.1.31]3 => ip 10.1.1.31 is access 3 times
