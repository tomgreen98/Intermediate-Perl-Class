use strict;
use warnings;


print "2. Runtime.\n";
BEGIN {
	print "1. Compile time.\n";
}

BEGIN {
	my @DOW = qw{ Sun Mon Tue Wed Thur Fri Sat };

	sub DayOfWeek {
		#print $_[0];
		return $DOW[$_[0]];
	}
}

print DayOfWeek(1), "\n";
print DayOfWeek(5), "\n";