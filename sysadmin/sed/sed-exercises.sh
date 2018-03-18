
# print both matching pattern 'p' and stdout, output is duplicated, space is optional
sed ' p ' /etc/passwd

#suppress stdout and print only if pattern matches, use -n switch to suppress stdout
sed -n 'p' /etc/passwd

#print first 5 line
sed -n '1,5 p ' /etc/passwd

#print lines beginning with user
sed -n '/^user/ p ' /etc/passwd

#remove commented lines from a file
sed ' /^#/ d' /etc/ntp.conf

#remove both commented  and empty lines from a file
sed ' /^#/ d; /^$/ d' /etc/ntp.conf

#Take a backup of ntp.conf as ntp.conf.safe, remove commented line '#' and empty lines
#sed -i.backup '/^#/d;/^$/d' /etc/ntp.conf


