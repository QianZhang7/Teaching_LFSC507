#!/usr/bin/perl

use warnings;
use strict;

my $string = 'The source code generally was not there when I needed it.';

#split the string, and save the fragments in an array

my @after_split = split/\s/, $string;

#extract the 3rd on into a new string

#my $third_word = @after_split[2];

#print $third_word, "\n";

print $after_split[2], "\n";

exit;
