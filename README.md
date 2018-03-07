"# Bioinformatics-Tools" 
# Bioinformatics-Tools

These are several scripts I have created to help Bioinformaticians analyze FASTA files. To use either copy and paste the code or download the file as is. 

There are three tools created with the use of some modules from CPAN:
  - mutate.pl       - changes a nucleotide to another nucleotide
  - sort.pl         - sorts a multiFASTA file by either id or length
  - CodonTable.pl   - gives the frequency RAC(Relative Adaptiveness of a Codon) 
  and RSCU(Relative Synonymous Codon Usage) of a FASTA file

The following describes the format of each script:
    -mutate.pl          - ./mutate.pl 'position:base' [FASTA_file]
    -sort.pl            - ./sort.pl  'id OR length' [FASTA_file]
    -CodonTable.pl      - .CodonTable.pl [FASTA_file]
