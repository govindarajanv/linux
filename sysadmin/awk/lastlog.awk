BEGIN{
	printf "%8s %11s\n","Username","Login Date";
	print "--------------------------------------------------"
}
!(/Never logged in/ || /^Username/ ) {
	count++;
	if ( NF == 8)
		printf "%8s %2s %3s %4s\n", $1,$5,$4,$8
	else
		printf "%8s %2s %3s %4s\n", $1,$6,$5,$9
	
}
END{
	print "---------------------------------------------------";
	print "Total users processed: ", count

}
