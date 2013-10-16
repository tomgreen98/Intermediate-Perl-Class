use strict;
use warnings;

{
	package Animal;

	sub say {
		"";
	};

	sub speak {
		my ($class, $says, $no_cr) = @_;

		$no_cr ||= 0;
		eval {
			$says ||= $class->say();
		};

		if ($@) {
			print "We don't know what sound a $class makes.";
			print "\n" if !$no_cr;
			return;
		}

		print "A $class goes $says.";
		print "\n" if !$no_cr;
	};
}

{
	package Cow;

	our @ISA = qw(Animal);

	sub say {
		"moooo";
	};
}

{
	package Horse;

	our @ISA = qw(Animal);

	sub say {
		"neigh";
	};

}

{
	package Sheep;

	our @ISA = qw(Animal);

	sub say {
		"baaaaa";
	};

}

{
	package Mouse;

	our @ISA = qw(Animal);

	sub say {
		"eeekk";
	};

	sub speak {
		my ($class, $says) = @_;
		$class->SUPER::speak($says, 1);
		print "[but you can barely hear it!]\n";
	}
}

my @yard = qw (Cow Cow Horse Sheep Mouse Cow Cow Lizard);

while (<>) {
	chomp ($_);
	if ($_ ne '') {
		push @yard, $_;
	} else {
		last;
	}
}

{
	local $, = ", ";
	print "We have the following animals in the yard: ";
	print @yard;
	print "\n";
}

foreach my $animal (@yard) {
	$animal->speak();
}