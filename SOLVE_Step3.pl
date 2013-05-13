#!/usr/bin/perl
## SOLVE_Step3.pl
##
## Step 3 compares the gene list generated in Step 2
## with the list of genes in the Developmental Brain
## Disorders Database (DBDB). 
##
## Written 05 May 2013
## Updated 10 May 2013

use strict;
use warnings;

my %a;
open F, shift;
while (<F>) {chomp;$a{$_}++}
open F, shift;
while (<F>) {chomp;print if $a{$_};
print"\n";}
print"\n";
