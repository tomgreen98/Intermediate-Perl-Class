package Oogaboogo::Locale;

use strict;
use warnings;
use 5.012;

our @EXPORT = qw(number_to_day_name number_to_month_name);
our @EXPORT_OK = qw(say_hello);
use Exporter;
our @ISA = qw(Exporter);

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

sub say_hello {
	return _say("oogaboogo");
}

sub _say {
	return $_[0]
}

1;