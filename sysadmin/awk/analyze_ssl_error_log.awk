BEGIN { FS=" ";  print "Analysis Summary of SSL Error Log" }
{ ip[$8]++ }
END {
for ( i in ip)
print i, " has accessed ", ip[i], " times." }
