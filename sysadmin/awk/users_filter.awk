BEGIN { 
	FS=":"; 
	print "Username" 
} 
$3 > 499
{ 
	print $1 ;
	count++
}
END {
	print "Total Users : " NR;
	print "Total matches : " count
}
