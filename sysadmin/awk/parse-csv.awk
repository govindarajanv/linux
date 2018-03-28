BEGIN {
	FS=",";
}
{
	print toupper($1), tolower($2), $3;
	print tolower($1), toupper($2), $3;
	print "Number of fields encountered :" NF;
	print "\n"
}
