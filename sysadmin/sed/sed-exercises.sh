
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
#insert
sed ' /^server 0/ i server ntp.example.com ' /etc/ntp.conf
#delete
sed ' /^server\s[0-9]\.ubuntu/ d ' /etc/ntp.conf

#Multiple sed commands
sed ' {
/^server 0/ i server ntp.example.com
/^server \s[0-9]/d 
} ' /etc/ntp.conf

#create .sed file
#deletion of empty lines /^$/d
#deletion of commented line /^\s*#/d

sed -f ntp.sed /etc/ntp
sed -i.backup -f ntp.sed /etc/ntp

#remotely edit file using ssh and sed
# -t switch in ssh assigns a tty allowing for sudo password
# .sed file will be on remote server
#ssh -t user@server sudo sed -i.bak -f /tmp/ntp.sed
scp ntp.sed vagrant@10.1.1.31:/tmp
ssh -t vagrant@10.1.1.31 sudo -i.bkp -f /tmp/ntp.sed /etc/ntp.conf

#substitution groups
# 1 indicates first file in the replacing string, make the last name of the employee all caps
#
sed ' s@\([^,]*\)@\U\1@' employees
# with last name of the employee all caps and first name in all small 
# two groupings are separated by comma character no 17
# first command removes comma in the output while second one retains it
#https://regexr.com/   ^ - Negated set, match any character not in the set
sed 's@\([^,]*\),\([^,]*\)@\U\1\L\2@' employees
sed 's@\([^,]*\),\([^,]*\)@\U\1,\L\2@' employees

#cat dictFile
#first:second
#one:two
#swap the contents delimited by :
sed 's/\(.*\):\(.*\)/\2:\1/' dictFile

#change the above employee file such as way that print first name:last name: third column
sed 's@\(.*\),\(.*\),\(.*\)@\2:\1:\3@' employees

#
sed 's/\(^\|[0-9.]\)([0-9]\+\)\([0-9]\{3\}\)/\1\2,\3/g' /proc/loadavg

#To execute a command using sed
# cat file.list gives /etc/hosts and /etc/services

sed '       s/^/ls -l /e ' file.list

# add users in the system by reading a file containing user names
sed ' s/^/sudo useradd /e ' user.list

# creating and deleting tar files
sed ' /^\// s/^/tar -rf catalog.tar /e' cat.list
sed ' /^\// s/^/rm -f /e' cat.list

#Add extra spaces in a given range in vim
#%/stats/stuff/g here % says entire document else you can specify a range
#g represents global meaning all occurrences not the first occurrence.
# 1,30s/server/stuff/g

#if you want to intend the line, first one is pattern matching
# /^restrict/s/^/    /

#to add spaces till the end of the document from 8th line
# 8,$ s/^/

#selectively move lines to a new file
#4,10 w <filename>

#read a file
#:r <filename>


# Remove blank lines from virtualhost.conf; \ represnets a new blank line
sed ' /^\s*$/d ' virtualhost.conf
sed ' /^\s*$/d;/^<\/Virt/a \ ' virtualhost.conf
