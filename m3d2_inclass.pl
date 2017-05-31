#!/usr/bin/perl

use warnings; 
use strict;


#original data
my @data1 = (165.9,210.3,166.8,182.3,182.1,218,170.1);
my @data2 = (212.1,203.5,210.3,228.4,206.2,203.2,224.9,202.6);

#sample size
my $n1 = scalar(@data1);
my $n2 = scalar(@data2);

#sample mean
my $sum1 = 0;
foreach my $data1(@data1){
	$sum1 = $sum1 + $data1;
}

my $mean1 = $sum1/$n1;

my $sum2 = 0;
foreach my $data2(@data2){
        $sum2 = $sum2 + $data2;
}

my $mean2 = $sum2/$n2;


# sample standard deviation

my $varsum1 = 0;
foreach my $data1(@data1){
	$varsum1 += ($data1 - $mean1)**2;
}

my $variance1 = $varsum1/$n1;
my $sd1 = sqrt($variance1);


my $varsum2 = 0;
foreach my $data2(@data2){
        $varsum2 += ($data2 - $mean2)**2;
}

my $variance2 = $varsum2/$n2;
my $sd2 = sqrt($variance2);

#degree of freedom

my $df = $n1+ $n2 -2;

# calculate sp
my $sp = sqrt((($n1-1)*$variance1+($n2-1)*$variance2)/$df);

# t stat

my $t = ($mean1-$mean2)/($sp*sqrt(1/$n1+2/$n2));


print("Mean1: ",$mean1,"\nMean2: ", $mean2, "\nvariance1: ",$variance1, "\nvariance2: ", $variance2, "\nPooled SD: ", $sp, "\nT stat: ", $t,"\n" )



