#5-1


use strict;
use warnings;

my $wish_list = {};

open (FILE, "wish-list") or die "Can't open wish-list file: $!";

while(<FILE>) {
	chomp;
	my @data = split /\t/;
	push (@{$wish_list->{$data[0]}} ,$data[1]);
}

close FILE;

print "Dumper\n";
use Data::Dumper;
print Dumper($wish_list);

print "YAML\n";
use YAML;
print Dump($wish_list);

print "Data::Printer\n";
use Data::Printer;
my %wl = %{$wish_list};
p( %wl );

print "Storable\n";
use Storable;
Storable::nstore $wish_list, './wish_list.stor' or die "WHAT WHAT WHAT";
#print "STORABLE: $res\n";

my $wish_list2 = retrieve('./wish_list.stor');
print Dumper($wish_list2);
