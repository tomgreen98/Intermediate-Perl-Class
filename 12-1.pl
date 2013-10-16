use strict;
use warnings;
use Carp qw(croak carp);

{
	package Animal;

	sub factory {
		ref (my $class = shift) and Carp::croak "class only.";
		my $name = shift;
		my $color = shift;
		my $self = {
			'name' => $name || "unnamed",
			'color' => $color || "brown",
		};

		bless $self, $class;
	}

	sub name {
		my $self = shift;
		if (!ref $self) {
			my $caller = (caller(0))[3];
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
	}
}

{
	package Horse;

	our @ISA = qw(Animal);

}

{
	package RaceHorse;

	our @ISA = qw(Horse);

	sub factory {
		ref (my $class = shift) and Carp::croak "class only.";
		my $self = $class->SUPER::factory(@_);
		$self->{'stats'} = {};
		$self->{'stats'}{$_} = 0 foreach qw(wins places shows losses);

		print "FACTORY: ", $self->{'name'}, "\n";

		my $fn = _get_file_name($self);
		print "FN: $fn\n";

		dbmopen(%{$self->{'stats'}},$fn,0666);
		$self;
	}

	sub won {shift->{'stats'}{'wins'}++;}
	sub placed {shift->{'stats'}{'places'}++;}
	sub showed {shift->{'stats'}{'shows'}++;}
	sub lost {shift->{'stats'}{'losses'}++;}

	sub standings {
		my $self = shift;
		join ", ", map {
				"$self->{'stats'}{$_} $_"
			} qw( wins places shows losses );
	}

	sub _get_file_name {
		my $self = shift;
		return "./" . $self->name . ".history3";
	}

	sub DESTROY {
		my $self = shift;
		dbmclose(%{$self->{'stats'}});
	}
}

my $runner = RaceHorse->factory("Billy Bob");
my @fns = qw(won placed showed lost);
my $random_fn = $fns[int(rand(4)) + 0];
$runner->$random_fn;
print $runner->name, " has standings ", $runner->standings, ".\n";

