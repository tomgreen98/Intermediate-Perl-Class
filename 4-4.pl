use strict;
use warnings;

use Data::Dumper;
use List::MoreUtils;

sub get_personal_info {
	local $_;
	my $who = shift;

	open (FILE, "clothing-size") or die "Can't open clithing-size file: $!";

	chomp($_ = <FILE>);
	my @headings = split /\t/;

	my $index = List::MoreUtils::first_index {$_ eq 'name'} @headings;
	# my $length = @headings;

	# print "Length: $length\n";
	# print 0..$length-1, "\n";

	# my ($index) = grep {$headings[$_] eq 'name'; print "Heading: $headings[$_] $_\n"; $_;} 0..$length-1;
	# print "Index: $index\n";



	while(<FILE>) {
		chomp;
		my @data = split /\t/;
		next unless $data[$index] eq $who;

		my %hash;
		@hash{@headings} = @data; # Hash slice assigns each data to each key

		close FILE;

		return \%hash;
	}

	close FILE;
	();
}

print Dumper(get_personal_info("Tom"));
print Dumper(get_personal_info("Tommy"));
print Dumper(get_personal_info("Andy"));

print get_personal_info("Tom") ? "true" : "false", "\n";
print get_personal_info("Tommy") ? "true" : "false", "\n";
print get_personal_info("Andy") ? "true" : "false", "\n";

