use strict;
use warnings;

my @list = ( qw(aaa zz1-ss def fed ljss kke wew zea bbx) );
{
	local $, = "\n";
	print @list;
}

sub get_key {
	my ($item) = @_;
	my $key = $item;

	$key =~ tr/A-Z/a-z/;
	$key =~ tr/a-z//cd;

	print "Key:$key\n";

	return $key;
}

my @results = map $_->[0],
sort { $a->[1] cmp $b->[1] }
map [$_, get_key($_)],
@list;

{
	local $, = "\n";
	print @results;
}