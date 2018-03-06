#!/usr/bin/perl -w

use strict;
use Bio::SeqIO;

my $filename;
my $match = shift @ARGV;
$match =~/^([\d^:]+):([ACTGactg])$/ || die "Bad search format. Enter in form 'position:base'. \n";
my($ref, $base)=($1, $2); #based on regex
$ref = $ref - 1; #start at position 1 and not 0 in array
my $in = Bio::SeqIO->new(-file=>"$filename", -format=>'fasta');
while(my $seqobj = $in->next_seq()){
    my $disid = $seqobj->display_id();#get the displayid
    my @seq =split('', $seqobj->seq()); #get sequence and split the sequence base by base
        if($seq[$ref]){#if the ar
            #my $lastbase = $#seq + 1; # get the last base
            my $pos = $seq[$ref];#get the reference to the base or exit the program
            $seq[$ref] =~ s/$pos/$base/; # substitute base;
            my $seq = join( '', @seq); #remove spaces between the sequence
            $seq =~ s/.{1,60}\K/\n/sg; #give 60 characters per line
            print ">$disid\n$seq";
        }
}

