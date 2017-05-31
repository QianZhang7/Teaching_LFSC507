#!/usr/bin/perl

use warnings;
use strict;

#Variable Declarations

my $inputfile = $ARGV[0];
my $key;
my $value;
my %fasta_database;

# Open Our File to read

open (FASTA, "<", $inputfile) || die $!;

# read the file and match patterns

while (my $line = <FASTA>){
	chomp $line;
	if ($line =~ /^>/){ 
        # is this line a header ??
        $key = $line; # if yes then make this line a key
	$fasta_database{$key} = ''; #initialize the value for each key
        }
	else{
	$fasta_database{$key} = $fasta_database{$key}.$line;
	#if no then take this line and add it whatever is being stored in the hash at the current key value.
	} 
}

close(FASTA);

################### Module 1 Day 2 part #################################
# Restriction Enzyme: Sep 21, 2015                                      #
#########################################################################

#count times the sequence match the enzyme
sub check_for_cuts{
    my @input = @_;
    #get one element of input array
    my $current_seq = $input[0];
    my $enzyme = 'GTCGAC';
    my $count = 0;
    foreach ($current_seq =~ /$enzyme/g){
       $count++;
       }
    return $count;
}
# Main program to check each sequence

foreach my $header(keys %fasta_database){
    my @short_header = split(/\s/,$header);
    print $short_header[0], "\t";
    print check_for_cuts($fasta_database{$header}), "\n";
    }

