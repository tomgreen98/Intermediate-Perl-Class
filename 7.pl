use strict;
use warnings;

open my $in_fh, "<", "7.txt" or die "Failed to open 7.txt: $!\n";

my %filehandles;

while (<$in_fh>) {
	chomp;
	my @data = split /\t/;
	my $name = substr($data[0], 0, length($data[0]) - 1);

	print "Processing $name\n";

	if (!defined $filehandles{$name}) {
		open my $out_fh, ">", "$name.info";
		$filehandles{$name} = $out_fh;
	}

	print {$filehandles{$name}} $_, "\n";
}

close $in_fh;
foreach my $item (keys %filehandles) {
	print "Closing $item\n";
	close $filehandles{$item};
}