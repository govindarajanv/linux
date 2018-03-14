#Get the function names with lower case characters or _
declare -f|grep '^[a-z_]'

#get number of packets received and number of bytes transmitted
ifconfig enps08|grep RX

#get the cpu core details
grep -c name /proc/cpuinfo

#in the same above command,try to display two lines after the match
grep -A2 name /proc/cpuinfo

#in the same above command,try to display two lines before the match
grep -B2 name /proc/cpuinfo

#if you want to print 2 lines before and after the match
grep -a2 name /proc/cpuinfo
grep -C2 name /proc/cpuinfo

#search ntp.conf file starting with server
grep '^server' /etc/ntp.conf

#search logrotate file ending with 4 in a server
grep '4$' /etc/logrotate.d/*

#search logrotate file not ending with 4 in a server
grep -v '4$' /etc/logrotate.d/*

#search ntp.conf file for empty lines
grep '^$' /etc/logrotate.d/*

#display file with invisible special characters
cat -vet filename

#To list the details of the function
declare -f|

#functions beginning with lower case or _
declare -f|grep '^[a-z_]'

# look for file with rotate 4 or rotate 6
grep 'rotate [46]$' /etc/logrotate.d/*

# look for file without rotate 4 or rotate 6 - ^ symbol negates
grep 'rotate [^4]$' /etc/logrotate.d/*

#look for the word server with s being case insensitive
grep '[Ss]erver' /etc/ntp/conf.bak

#look for workd server in ntp.conf, avoid getting both server and servers
grep 'server\b' /etc/ntp.conf   // \b word boundary
grep '^server\b' /etc/ntp.conf
grep 'server\s' /etc/ntp.conf   // space after server

#look for line with server pattern with no space after the pattern
grep 'server\S' /etc/ntp.conf

#look for pop from /etc/services
grep '\bpop[0-9]\b' /etc/services

#look for pop from /etc/services but with some prefix to pop
grep '\Bpop[0-9]\b' /etc/services

#look for pop from /etc/services but with some suffix to pop
grep 'pop[0-9]\B' /etc/services
