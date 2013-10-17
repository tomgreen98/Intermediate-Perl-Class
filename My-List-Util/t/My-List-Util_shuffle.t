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

ok(join("", sort( shuffle(0..9) ) ) eq '0123456789', "Deal!");

done_testing(2);