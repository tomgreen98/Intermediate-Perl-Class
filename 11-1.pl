use strict;
use warnings;
use Carp qw(croak carp);


{
	package Creature;

	sub factory {
		my $class = shift;
		if (ref $class) {
			my $caller = ${caller(0)}[3];
			Carp::croak "Called a class method $caller from a instance.";
		}


		my $props = shift;

		# default case, no property set
		if (!$props or !ref $props) {
			$props = {};
		}

		if (!ref $props and defined $props) {
			# passed bare parameters
			$props->{'name'} = $props;
		}

		if (@_ and !ref $props and defined $props ) {
			# passed bare parameters
			$props->{'color'} = $_[0];
		}

		# Fill in missing defaults
		$props->{'name'} = "unnamed" if (!exists $props->{'name'});
		$props->{'color'} = "" if (!exists $props->{'color'});

		# Construct
		bless $props, $class;
	}

	sub name {
		my $self = shift;
		if (!ref $self) {
			my $caller = ${caller(0)}[3];
			Carp::croak "Called an instance method $caller from a class.";
		}

		if (@_) {
			#setter
			my $old = $self->{'name'};
			$self->{'name'} = $_[0];
			return $old;
		}
		else {
			#getter
			return $self->{'name'};
		}
	};

	sub color {
		my $self = shift;
		if (!ref $self) {
			{
				local $, = ", ";
				print "CALLER: "; print caller(0), "\n";
			}
			my $caller1 = (caller(0))[3];
			Carp::croak "Called an instance method ${\caller(0)->[3]} from a class.";
		}

		if (@_) {
			#setter
			my $old = $self->{'color'};
			$self->{'color'} = $_[0];
			return $old;
		}
		else {
			#getter
			return $self->{'color'};
		}
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

	sub name {
		my $self = shift;
		if (@_) {

		}
	}
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

my $talking = Horse->factory("Mr. Ed");
$talking->name("Mister Ed");
$talking->color("grey");
print $talking->name, " is ", $talking->color, "\n";
print Sheep->name, " colored ", Sheep->color;
