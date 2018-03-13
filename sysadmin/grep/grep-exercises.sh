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

