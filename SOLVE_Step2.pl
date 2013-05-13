#!/usr/bin/perl
##
## SOLVE_Step2.pl
##
## This is the second step of SOLVE
## It takes a vcf annotated by Annovar
## and extracts the gene symbols
## If your input is from SOLVE AR it will give 
## you the genes with homozygous and compound heterozygous
## variants.
## Or you run $ uniq -u on the output
## and get a file of the unique gene
## symbols.
##
## Written 9 Mar 2013
## Updated 10 May 2013

use strict;
use warnings;

my $file = shift;
open my ( $F ), $file;
LINE: while ($_=<$F>) {
    my @line = split /\t/;
    my @gene_symbol = $line[1];

    my $printme = 0;
    ++$printme if @gene_symbol;

    print join(qq/\t/, @gene_symbol, qq/\n/) if $printme;
}
print STDERR "SOLVE Step 2 done.\n";
