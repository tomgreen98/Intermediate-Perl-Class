#3-2:
use strict;
use warnings;

require 5.010.0;
use feature "state";

my @skipper = qw{ blue_shirt hat jacket preserver sunscreen};
my @professor = qw { sunscreen water_bottle slide_rule batteries radio};
my @gilligan = qw { red_shirt hat lucky_socks water_bottle };
my %all = (
	"Skipper" => \@skipper,
	"Professor" => \@professor,
	"Gilligan" => \@gilligan,
);

sub check_required_items {
	my $who = shift;
	my $items = shift;

	my %items = map { $_, 1} @$items;
	#state @required = qw(preserver sunscreen water_botle jacket); # state requires 5.10. (similar to static, initialized the first time only.)
	#Initialization of state variables in list context currently forbidden
	my @required = qw(preserver sunscreen water_botle jacket); # state requires 5.10. (similar to static, initialized the first time only.)

	my @missing = ();

	foreach my $item (@required) {
		unless (exists $items{$item}) {
			print "$who is missing $item. \n";
			push @missing, $item;
		}
	}

	if (@missing) {
		print "Adding @missing to @$items for $who.\n";
		push @$items, @missing;
	}
}

sub check_items_for_all {
	my $hash_ref = shift;
	my %hash = %$hash_ref;

	foreach my $name (keys %hash) {
		check_required_items($name, $hash{$name});
	}
}

check_items_for_all(\%all);