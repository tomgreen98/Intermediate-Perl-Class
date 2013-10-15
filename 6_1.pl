#6_1


use File::Find;
use Time::Local;

sub gather_mtime_between {
	my ($start, $end) = @_;
	my (@files);

	my $process = sub {

		#print "File: $File::Find::name\n";
		my @stat = lstat($File::Find::name);
		#print "Stat: @stat\n";

		unless (defined @stat) {
			warn "Can't stat $File::Find::name: $!, skipping\n";
			return;
		}


		my $timestamp = $stat[9];
		#print "FileTS:$timestamp\n";
		#print "Start:$start\n";
		#print "Stop:$end\n";
		push @files, {
			'name' => $File::Find::name,
			'stat' => \@stat,
		} if $start < $timestamp && $timestamp < $end;
	};

	my $output = sub {
		return @files;
	};

	return ($process, $output);
}

my $target_dow = 1;
my @starting_directories = (".");

my $seconds_per_day = 24 * 60 * 60;
my ($sec, $min, $hour, $day, $mon, $year, $dow) = localtime;

my $start = timelocal(0, 0, 0, $day, $mon, $year); # start of today

while ($dow != $target_dow) {
	# Back up one day
	$start -= $seconds_per_day;
	$dow = 7 if --$dow < 0;
}

my $stop = $start + $seconds_per_day;

#print "Start, Stop: $start, $stop\n";
my ($gather, $yield) = gather_mtime_between($start, $stop);


#print "Gather: $gather\n";
#print "Yield: $yield\n";
find($gather, @starting_directories);

my @files = $yield->();

foreach my $file (@files) {
	use Data::Dumper;
	Dumper($file);
	my $mtime = $file->{'stat'}[9];
	my $when = localtime $mtime;
	print "$when: $file->{'name'}\n";
}