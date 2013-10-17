# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl My-List-Util.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use strict;
use warnings;

use lib "../lib";
use Test::More;

BEGIN { use_ok('My::List::Util') };

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

ok(sum(10..100) == 5005, "10..100 adds up to 5005.");
ok(sum() == 0, "Nothing adds up to 0.");
ok(sum(-10..10) == 0, "-10..10 adds up to 0.");
ok(sum(-5..10) == 40, "-5..10 adds up to 40.");

done_testing(5);