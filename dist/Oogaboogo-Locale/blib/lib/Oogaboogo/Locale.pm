package Oogaboogo::Locale;

use strict;
use warnings;
use 5.012;

require Exporter;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use Oogaboogo::Locale ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(
	number_to_day_name
	number_to_month_name
	say_hello
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
	qw (
		number_to_day_name
		number_to_month_name
	)
);

our $VERSION = '0.01';

#---------------------
# State Variables
#---------------------
state $days = [ qw(ark dip wap sen pop sep kir) ];
state $months = [ qw(diz pod bod rod sip wax lin sen kun fiz nap dep)];


=pod

=head4 method

number_to_day_name

=head4 description

Converts the day number into the Oogaboogo day name.

=head4 args

=head5 type

number

=head4 returns

string

=head4 example

	use Oogaboogo::Locale;
	my $dow = number_to_day_name(1);
	print "Day 1 is $dow in Oogaboogo.\n";
=cut
sub number_to_day_name {
	my $num = shift;
	if ($num < 0 or $num > 6) {
		warn "Unknown day of the week $num.";
		return "Unknown";
	}

	return $days->[$num];
}

=pod

=head4 method

number_to_month_name

=head4 description

Converts the month number into the Oogaboogo month name.

=head4 args

=head5 type

number

=head4 returns

string

=head4 example

	use Oogaboogo::Locale;
	my $mon = number_to_month_name(1);
	print "Month 1 is $dow in Oogaboogo.\n";
=cut
sub number_to_month_name {
	my $num = shift;

	if ($num < 0 or $num > 11) {
		warn "Unknown month $num.";
		return "Unknown";
	}

	return $months->[$num];
}


=pod

=head4 method

say_hello

=head4 description

Says hello in Oogaboogo.

=head4 returns

string

=head4 example

	use Oogaboogo::Locale;
	my $hello = say_hello();
	print "Hello in Oogaboogo is $hello.\n";
=cut
sub say_hello {
	return _say("oogaboogo");
}

=pod

=head4 private

=head4 method

_say

=head4 description

Undocumented

=head4 args

=head5 type

string

=head5 description

string to convert to oogaboogo. Does nothing now but return the passed in value.

=head4 returns

string

=head4 example

	use Oogaboogo::Locale;
	my $hello = say_hello();
	print "Hello in Oogaboogo is $hello.\n";
=cut
sub _say {
	return $_[0]
}

1;
__END__
=head1 NAME

Oogaboogo::Locale - Perl extension for processing specific data and greetings
for the Oogaboogo language.

=head1 SYNOPSIS

  	use Oogaboogo::Locale;

  	foreach my $day (-1..7) {
		print "Day $day ", number_to_day_name($day), "\n";
	}

	foreach my $month (-1..12) {
		print "Month $month ", number_to_month_name($month), "\n";
	}

	print Oogaboogo::Locale::say_hello(), "\n";

=head1 DESCRIPTION

Perl extension for processing specific data and greetings
for the Oogaboogo language.

=head2 EXPORT

=over 4

=item * number_to_day_name
=item * number_to_month_name
=item * say_hello

=back

=head1 SEE ALSO

Mention other useful documentation such as the documentation of
related modules or operating system documentation (such as man pages
in UNIX), or any relevant external documentation such as RFCs or
standards.

If you have a mailing list set up for your module, mention it here.

If you have a web site set up for your module, mention it here.

=head1 AUTHOR

Tom Green, E<lt>tomg@apple.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2013 by Tom Green

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.12.3 or,
at your option, any later version of Perl 5 you may have available.


=cut
