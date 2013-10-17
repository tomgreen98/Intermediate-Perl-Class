# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Oogaboogo-Locale.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use strict;
use warnings;
use lib "../lib/";

use Test::More tests => 24;
# BEGIN {
# 	use lib "../lib/";
# 	use_ok('Oogaboogo::Locale')
# };

use Oogaboogo::Locale qw(:all);

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

# Test number_to_day_name
{
	ok(number_to_day_name(-1) eq 'Unknown', 'The Oogaboogo day -1 is Unknown.');
	ok(number_to_day_name(0) eq 'ark', 'The Oogaboogo day 0 is ark.');
	ok(number_to_day_name(1) eq 'dip', 'The Oogaboogo day 1 is dip.');
	ok(number_to_day_name(2) eq 'wap', 'The Oogaboogo day 2 is wap.');
	ok(number_to_day_name(3) eq 'sen', 'The Oogaboogo day 3 is sen.');
	ok(number_to_day_name(4) eq 'pop', 'The Oogaboogo day 4 is pop.');
	ok(number_to_day_name(5) eq 'sep', 'The Oogaboogo day 5 is sep.');
	ok(number_to_day_name(6) eq 'kir', 'The Oogaboogo day 6 is kir.');
	ok(number_to_day_name(7) eq 'Unknown', 'The Oogaboogo day -7 is Unknown.');
}

# Test number_to_month_name
{
	ok(number_to_month_name(-1) eq 'Unknown', 'The Oogaboogo month -1 is Unknown.');
	ok(number_to_month_name(0) eq 'diz', 'The Oogaboogo month 0 is diz.');
	ok(number_to_month_name(1) eq 'pod', 'The Oogaboogo month 1 is pod.');
	ok(number_to_month_name(2) eq 'bod', 'The Oogaboogo month 2 is bod.');
	ok(number_to_month_name(3) eq 'rod', 'The Oogaboogo month 3 is rod.');
	ok(number_to_month_name(4) eq 'sip', 'The Oogaboogo month 4 is sip.');
	ok(number_to_month_name(5) eq 'wax', 'The Oogaboogo month 5 is wax.');
	ok(number_to_month_name(6) eq 'lin', 'The Oogaboogo month 6 is lin.');
	ok(number_to_month_name(7) eq 'sen', 'The Oogaboogo month 7 is sen.');
	ok(number_to_month_name(8) eq 'kun', 'The Oogaboogo month 8 is kun.');
	ok(number_to_month_name(9) eq 'fiz', 'The Oogaboogo month 9 is fiz.');
	ok(number_to_month_name(10) eq 'nap', 'The Oogaboogo month 10 is nap.');
	ok(number_to_month_name(11) eq 'dep', 'The Oogaboogo month 11 is dep.');
	ok(number_to_month_name(12) eq 'Unknown', 'The Oogaboogo month 12 is Unknown.');
}

# Test say_hello
{
	ok(say_hello eq 'oogaboogo', 'Say hello in Oogaboogo is oogaboogo.')
}

