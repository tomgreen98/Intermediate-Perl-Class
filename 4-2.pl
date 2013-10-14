use strict;
use warnings;

use Data::Dumper;

sub get_personal_info {
	local $_;
	my $who = shift;

	open (FILE, "clothing-size") or die "Can't open clithing-size file: $!";

	chomp($_ = <FILE>);
	my @headings = split /\t/;

	while(<FILE>) {
		chomp;
		my @data = split /\t/;
		next unless $data[0] eq $who;

		my %hash;
		@hash{@headings} = @data; # Hash slice assigns each data to each key

		close FILE;

		return \%hash;
	}

	close FILE;
	();
}

print Dumper(get_personal_info("Tom"));
print Dumper(get_personal_info("Andy"));

print get_personal_info("Tom") ? "true" : "false", "\n";
print get_personal_info("Andy") ? "true" : "false", "\n";

