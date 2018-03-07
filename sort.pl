#!/usr/bin/perl -w
use strict;
use Bio::SeqIO;

my ( %seqs, $id, $seq, $length, $key );
my ($match, $filename) = @ARGV;
$match =~ /(length|id)/ || die "Enter 'length' or 'id' to sort.\n";
my $in = Bio::SeqIO->new(-file=>"$filename", -format=>'fasta');
while(my $seqobj = $in->next_seq()){
    my $id = $seqobj->display_id();
    my $length = $seqobj->length();
    #$seqs{$seq} =~s/.{1,60}\K/\n/sg;
    $seqs{$id} = $seqobj, unless $match eq 'length';
    $seqs{$length}{$id} = $seqobj, unless $match eq 'id';
    }
    if($match eq 'id'){
        foreach my $id (sort keys %seqs) {
            printf ">%-9s \n%-s\n", $id, $seqs{$id}->seq;
        }
    }
    elsif($match eq 'length'){
        foreach my $length(sort {$a <=>$b}keys %seqs){
            foreach my $id (keys %{ $seqs{$length} }) {
                printf ">%-10s\n%-s\n" ,$id, $seqs{$length}{$id}->seq;
            }
        }
    }
 
