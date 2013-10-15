use strict;
use warnings;

use Benchmark qw(:all) ;

my @glob = glob "./*";
my @sorted;
my $count = 10;

 my $results = timethese($count, {
	'Sort' => sub {
		@sorted = sort { -M $a <=> -M $b } @glob;
	},
	'Sort with Swartzian Transform' => sub {
		@sorted = map $_->[0],
		sort {
			$a->[1] <=> $b->[1]
		}
		map [ $_, -M $_ ],
		@glob;
	},
});

cmpthese( $results );

{
	local $, = ",\n";
	print @sorted;
}