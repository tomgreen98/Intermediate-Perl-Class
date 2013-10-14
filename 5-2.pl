#5-2


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

foreach my $person (sort keys %{$wish_list}) {
	print "$person: @{$wish_list->{$person}}\n";
}