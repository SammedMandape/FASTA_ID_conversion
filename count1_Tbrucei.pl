#! usr/bin/perl
use Data::Dumper;
open FH, "<TbruceiAnnotatedProteins_TriTrypDB+TEV.fasta";
open FH1, ">TbruceiAnnotatedProteins_TriTrypDB+TEV_count.txt";

#################################################
## Create a hash of the fasta file
my %hash;
my $foo;
while (my $line = <FH>){
chomp $line;
if ($line =~ /^>(psu\|[A-Za-z0-9]+.*\.\d+)\s\|/){
$foo = "";
$foo = $1;
#print $foo."\n";
next;
}
#print $foo."\n";
if(exists $hash{$foo}){
push (@{$hash{$foo}},$line);
}else{
push (@{$hash{$foo}},$line);
}
}
print keys(%hash)."\n";

#print Dumper(\%hash);
close FH;
## Done creating hash.

foreach my $foo (keys %hash){
my $newval = join("",@{$hash{$foo}});
#my $count = length $newval;
my @count1 = $newval =~ m/[A-Za-z]/g;
#print FH1 $foo."\t".$count."\n";
print FH1 $foo."\t".scalar(@count1)."\n";
}