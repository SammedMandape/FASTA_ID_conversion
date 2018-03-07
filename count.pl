#! usr/bin/perl
use Data::Dumper;
open FH, "<Test.txt";

#################################################
## Create a hash of the fasta file
my %hash;
my $foo;
while (my $line = <FH>){
chomp $line;
if ($line =~ /^>(\d+)/){
$foo = "";
$foo = $1;
next;
}
print $foo."\n";
if(exists $hash{$foo}){
push (@{$hash{$foo}},$line);
}else{
push (@{$hash{$foo}},$line);
}
}
#print keys(%hash)."\n";

#print Dumper(\%hash);
close FH;
## Done creating hash.

foreach my $foo (keys %hash){
my $newval = join("",@{$hash{$foo}});
my $count = length $newval;
print $count."\n";
}