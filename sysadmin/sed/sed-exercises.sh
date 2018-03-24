
# print both matching pattern 'p' and stdout, output is duplicated, space is optional
sed ' p ' /etc/passwd

#suppress stdout and print only if pattern matches, use -n switch to suppress stdout
sed -n 'p' /etc/passwd

#print first 5 line
sed -n '1,5 p ' /etc/passwd

#print till the last line from 5th line
sed -n '5,$ p ' /etc/passwd

#print lines beginning with user
sed -n '/^user/ p ' /etc/passwd

#remove commented lines from a file
sed ' /^#/ d' /etc/ntp.conf

#remove both commented  and empty lines from a file
sed ' /^#/ d; /^$/ d' /etc/ntp.conf

#Take a backup of ntp.conf as ntp.conf.safe, remove commented line '#' and empty lines
#sed -i.backup '/^#/d;/^$/d' /etc/ntp.conf

#format of sed
#sed ' [range] [/pattern/] s/<string>/<replacement>/ ' /etc/passwd
# '/' follows 's' is a delimiter
# 'g' optionis required for more than one replacement required per line

[root@work-station vagrant]# sed ' 6,9 s/^/    /g' parsecsv.sh
#!/bin/bash
OLDIFS=$IFS
IFS=","
while read product price quantity
do
        echo -e "\e[1;33m$product \
            ========================\e[0m\n\
        Price : \t $price \n\
        Quantity : \t $quantity \n"

done < $1
IFS=$OLDIFS
[root@work-station vagrant]# sed -n ' 6,9 s/^/    /g' parsecsv.sh
[root@work-station vagrant]# sed -n ' 6,9 s/^/    /p' parsecsv.sh
        echo -e "\e[1;33m$product \
            ========================\e[0m\n\
        Price : \t $price \n\
        Quantity : \t $quantity \n"
#modify the shell from bash to sh
sed -n ' /^vagrant/ s@/bin/bash@/bin/sh@p ' /etc/passwd

#Append, insert and delete
#find server 3 and append server ntp.example.com
sed ' /^server 3/ a server ntp.example.com ' /etc/ntp.conf

sed ' /^server 0/ i server ntp.example.com ' /etc/ntp.conf
sed ' /^server\s[0-9]\.ubuntu/ d ' /etc/ntp.conf
