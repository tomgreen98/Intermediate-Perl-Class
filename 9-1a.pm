package Oogaboogo::Locale;

use strict;
use warnings;
use 5.012;

state $days = [ qw(ark dip wap sen pop sep kir) ];
state $months = [ qw(diz pod bod rod sip wax lin sen kun fiz nap dep)];

sub number_to_day_name {
	my $num = shift;
	if ($num < 0 or $num > 6) {
		warn "Unknown day of the week $num.";
		return "Unknown";
	}

	return $days->[$num];
}

sub number_to_month_name {
	my $num = shift;

	if ($num < 0 or $num > 11) {
		warn "Unknown month $num.";
		return "Unknown";
	}

	return $months->[$num];
}

1;