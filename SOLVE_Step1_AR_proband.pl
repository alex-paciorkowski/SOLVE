#!/usr/bin/perl
#
# SOLVE_Step1_AR_proband.pl
# Finds variants that are homozygous or compound heterozygous in proband 
# when no parents present in vcf.
# Reads unannotated vcf from gatk: proband
#
# Written May 10, 2013

use strict;
use warnings;

my $file = shift;
open my  $F, $file;
#print "##fileformat=VCFv4.1\n"; # reattach SeattleSeq header if needed
LINE: while ($_=<$F>){
        next if /^##/;
        my @line = split /\t/;

        my $printme = 0;
        ++ $printme if (($line[9] =~ m{1/1}) && ($line[9] =~ m{:99:}));#proband homozygous genotype and quality score
        ++ $printme if (($line[9] =~ m{1/0}) && ($line[9] =~ m{:99:}));#proband het genotype and quality score
        ++ $printme if (($line[9] =~ m{0/1}) && ($line[9] =~ m{:99:}));#and again       
        print join(qq/\t/, @line) if $printme;
}
print STDERR "Step 1 done.\n";
