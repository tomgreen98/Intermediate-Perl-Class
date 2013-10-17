use strict;
use warnings;
use lib "./lib/";

{
	use Oogaboogo::Locale (); # import nothing

	foreach my $day (-1..7) {
		print "Day $day ", Oogaboogo::Locale::number_to_day_name($day), "\n";
	}

	foreach my $month (-1..12) {
		print "Month $month ", Oogaboogo::Locale::number_to_month_name($month), "\n";
	}

	print Oogaboogo::Locale::say_hello(), "\n";
}

{
	use Oogaboogo::Locale; # import defaults

	foreach my $day (-1..7) {
		print "Day $day ", number_to_day_name($day), "\n";
	}

	foreach my $month (-1..12) {
		print "Month $month ", number_to_month_name($month), "\n";
	}

	print Oogaboogo::Locale::say_hello(), "\n";
}

{
	use Oogaboogo::Locale qw(number_to_day_name number_to_month_name say_hello);

	foreach my $day (-1..7) {
		print "Day $day ", number_to_day_name($day), "\n";
	}

	foreach my $month (-1..12) {
		print "Month $month ", number_to_month_name($month), "\n";
	}

	print say_hello(), "\n";
}

# {
# 	eval{
# 		use Oogaboogo::Locale qw(say); # Wont compile
# 		print say("hello\n");
# 	}

# 	if ($@) {
# 		print "We can't import items if we use @EXPORT_OK and don't add our method to this list.\n";
# 	}
# }