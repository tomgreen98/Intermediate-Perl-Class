
use strict;
use warnings;
use Time::HiRes qw(time);

my @glob = glob "/bin/*";

my $t0 = time;

my @sorted = sort { -M $a <=> -M $b } @glob;

my $elapsed = time - $t0;

print "Process Old Way: $elapsed\n";

$t0 = time;
@sorted = map $_->[0],
sort {
	$a->[1] <=> $b->[1]
}
map [ $_, -M $_ ],
@glob;

my $elapsed2 = time - $t0;

print "Process Schwartzian Way: $elapsed\n";

print "Diff:", $elapsed - $elapsed2, "\n";
