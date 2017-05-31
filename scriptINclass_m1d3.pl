#scriptINclass_m1d3.pl

my $reverse_restriction_site = 'atcgac';
my $forward_restriction_site = 'cccggg';
my $sequence = "atgaactttcgtgctctgttcgctgccaccgttgctgccctcgtcggctccaccgtacgcgaacgggttctcgtctacgtgtgcgtcgctatga";
#turn our string into an array with the split function
#this function takes two arguments: the first indicates a pattern
#to split on , the second what variable to split.
my @sequence_array = split(//,$sequence);
#now we slice the first 21 nucleotides out of our array
my @first21nt = @sequence_array [0..20];
#join is the opposite of split taking an array and joining it together with your pattern between each element.
my $primer_f = join("" , @first21nt);
#print primer_f variable
#What do you think this type of splicing does ?
# my @last21nt = @sequence ￼_array [ −21..−1];

my $primer_forward = "tga".$forward_restriction_site.$primer_f; 
#This block of code will allow you to check for start codon. 
if ($sequence =~ /ˆATG/i){ 
	#I have a start codon 
	} 
else{
	#I need a start codon 
} 
if ($sequence =~/TAG$/i || $sequence=~/TAA$/i || $sequence =~/TGA$/i ){ 
	#I have a stop codon 
} 
else{
	#I don’t have a stop codon 
} 

my $last21 ="tctacgtgtgcgtcgctatga";
#reverse the order of our sequence
$last21 = reverse($last21); 
#print "$last21\n";
#complement our string
$last21 =~ tr/atgc/tacg/;
#print "$last21\n";
my $primer_reverse = "tat".$reverse_restriction_site.$last21; 
if ((length($last21) % 3) == 0){ 
	# we’re in frame 
	} 
else {
	#we are not 
}
# if everything is alright
# how to know everything is alright??
	print "$primer_forward\n";
	print "$primer_reverse\n"; 
exit;