#!/usr/bin/perl

use warnings; 
use strict;
my $file_in = $ARGV[0];
my $key;
my %fasta_database;
my %genetic_code = ();
# Open our FASTA file to read
open (FASTA, "<", $file_in) || die $!;

# Store data from FASTA file in hash %fasta database
while (my $line = <FASTA>){ # while I have lines to read in file FASTA
	chomp $line; # remove newline character from end of $line
	if ($line =~ /^>/){ # if $line matches a ">" at its first position (^) (is this line a header?)
		$key = $line; # then make this line a KEY in hash %fasta database
		$fasta_database{$key} = ''; # initialize the VALUE ofcurrent key to blank
	}else{
		$fasta_database{$key} = $fasta_database{$key}.$line ; #if not then take this line and concatenate it to whatever is being stored in the hash at the current key's VALUE.
	} 
}
close (FASTA);

open (OUT, ">", "ORFs.txt") || die $!;
foreach my $header(keys %fasta_database){
    my @all_start_forward = ();
    my @all_end_forward = ();
    my @all_start_reverse = ();
    my @all_end_reverse = ();
    
    # forward strand
    my $sequence = $fasta_database{$header};
    # get all the starts in forward strand
	while ($sequence =~/ATG/g){
		push(@all_start_forward, pos($sequence) - 2);
	}
    # get all the stops in forward strand
	while ($sequence =~/TAG|TAA|TGA/g){
		push(@all_end_forward, pos($sequence) - 2);
	}
	
	
	# reverse strand
    my $revcomp = reverseComplement($sequence);
	while ($revcomp =~/ATG/g){
		push(@all_start_reverse, pos($revcomp) - 2);
	}
    # get all the stops in forward strand
	while ($revcomp =~/TAG|TAA|TGA/g){
		push(@all_end_reverse, pos($revcomp) - 2);
	}
	#print "$header\nstart_forward:@all_start_forward\nend_forward:@all_end_forward\n";
	#print "start_reverse:@all_start_reverse\nend_reverse:@all_end_reverse\n";

#code for hw m2d2
my @orfs = (); #store all results
my $orf_start = 0;
my $orf_stop = 0;
my $length = 0;
my $orf_sequence = '';
# Find all pairs in forward strand

foreach $orf_start (@all_start_forward){
    foreach $orf_stop (@all_end_forward){
	$length = $orf_stop - $orf_start+2;
	if ($length % 3 == 0 && $length > 90){
	  $orf_sequence = substr($sequence, $orf_start, $length);
	  push @orfs, "$header|F|".$orf_start."|$orf_stop|$length|$orf_sequence";
	}
     }
}

# Find all pairs in forward strand

foreach $orf_start (@all_start_reverse){
     foreach $orf_stop (@all_end_reverse){
             $length = $orf_stop - $orf_start+2;
             if ($length % 3 == 0 && $length > 90){
              $orf_sequence = substr($sequence, $orf_start, $length);
              push @orfs, "$header|R|".$orf_start."|$orf_stop|$length|$orf_sequence";
              }
         }
   }
foreach my $orf (@orfs){
	print OUT "$orf\n";
}
}

close (OUT); 
################# subroutines ################
sub reverseComplement{
	my ($seq) = @_;
	# reverse the DNA sequence
	my $revcomp = reverse($seq);
	# substitute all bases by their complements
	$revcomp =~ tr/ACGTacgt/TGCAtgca/;
	return $revcomp;
}
