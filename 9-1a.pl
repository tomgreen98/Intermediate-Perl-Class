use strict;
use warnings;

require '9-1a.pm';

foreach my $day (-1..7) {
	print "Day $day ", Oogaboogo::Locale::number_to_day_name($day), "\n";
}

foreach my $month (-1..12) {
	print "Month $month ", Oogaboogo::Locale::number_to_month_name($month), "\n";
}

