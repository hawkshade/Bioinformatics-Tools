#!/usr/bin/perl -w
use strict;
use Bio::Tools::CodonOptTable;

my $filename = shift @ARGV;
my $seqobj = Bio::Tools::CodonOptTable->new(
        -file           =>"$filename",
        -format         =>'Fasta',
        -genetic_code   => 2,
        );
my $myCodons = $seqobj->rscu_rac_table();
if($myCodons) {
    print "Codon\tFreq\tAA\tRSCU\tRAC\n" ;
        foreach my $each_aa (@$myCodons) {
            print "$each_aa->{'codon'}\t";
            print "$each_aa->{'frequency'}\t";
            print "$each_aa->{'aa_name'}\t";
            print "$each_aa->{'rscu'}\t";       #Relative Synonymous Codons Uses
           print "$each_aa->{'rac'}\t\n";    #Relative Adaptiveness of a Codon
        }

 }
