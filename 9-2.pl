use strict;
use warnings;

require '9-1a.pm';

my ($sec, $min, $hour, $mday, $mon, $year, $wday) = localtime;

print "Today is ${\Oogaboogo::Locale::number_to_day_name($wday)}, ${\Oogaboogo::Locale::number_to_month_name($mon)} $mday, $year\n";