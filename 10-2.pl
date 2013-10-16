use strict;
use warnings;

use strict;
use warnings;

{
	package Creature;

	# sub say {
	# 	"";
	# };

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
	package Plant;

	our @ISA = qw(Creature);

	sub speak {
		my $class = shift;
		$class->SUPER::speak();
	}

}

{
	package Person;

	our @ISA = qw(Creature);

	sub say {
		"mmmmmmmmm";
	}
}

{
	package Animal;

	our @ISA = qw(Creature);

	sub speak {
		my ($class, $says, $no_cr) = @_;

		if ($says) {
			$says =~ tr/AEIOU/aeiou/;
			my $first = substr($says, 0, 1, "");
			$says =~ tr/aeiou//cd;
			$says = $first . $says;
		}

		$class->SUPER::speak($says, $no_cr);
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

my @yard = qw (Plant Plant Cow Person Cow Horse Sheep Mouse Cow Cow Lizard Person Cow);

while (<>) {
	chomp ($_);
	push @yard, $_;
}

{
	local $, = ", ";
	print "We have the following animals in the yard: ";
	print @yard;
	print "\n\n";
}

my $animal = "Person";
$animal->speak("Hello World");

$animal = "Cow";
$animal->speak("Mello World");
$animal->speak("Good");

foreach my $animal (@yard) {

	eval {
		$animal->speak();
	};

	if ($@) {
		print "We can not find the animal $animal you requested.\n";
	}
}

