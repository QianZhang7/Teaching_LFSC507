#!/usr/bin/perl
use warnings; 
use strict;
# Variable Declarations
my $filein = $ARGV[0];
my $key;
my $value;
my %fasta_database;

# Open Our File to read
open (FASTA, "<", $filein) || die $!;

#While I have lines to read
while (my $line = <FASTA>){
	chomp $line;
	if ($line =~ /^>/){ 
	# is this line a header ??
	$key = $line; # if yes then make this line a key
	}
	else{
	$fasta database{$key} = $fasta_database{$key}.$line;
	#if no then take this line and add it whatever is being stored in the hash at the current key value.
} 
}
exit;


