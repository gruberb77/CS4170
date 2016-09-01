#	 Brent Gruber
#	 CS 4170
#	 Bicycling homework part B
#
#	 This script will calculate and display the average of data points taken for power,
#	 speed, cadence, and Heart Rate


#data is input by user in part B

#power data points
@power;
#speed data points
@speed;
#cadence data points
@cadence;
#heart rate data points
@heart;

#prompt user
prompt();

#seperate Sections
for(my $i=0; $i<4; $i++)
{
	newlines();
}

#output results
output();


#subroutine to print some new lines
sub newlines{
	print "\n";
}

#subroutine to print output
sub output{
	#calculate and print averages for each category
	
	print "#########AVERAGES#########\n";
	$avg = average(\@power);
	print "Average Power: $avg\n";
	$avg = average(\@speed);
	print "Average Speed: $avg\n";
	$avg = average(\@cadence);
	print "Average Cadence: $avg\n";
	$avg = average(\@heart);
	print "Average Heart Rate: $avg\n";
}

#subroutine to calculate average of an array, any size
sub average{
	#retrieve arguments
	my @temp = @{$_[0]};
	#counter
	my $n = 0;
	#sum of inputs
	my $sum - 0;
	
	foreach (@temp){
		$n += 1;
		$sum += $_;
	}
	my $average = $sum / $n;
	
	return $average;
}


#subroutine to prompt user for data points
sub prompt{
	
	print "Please enter 3 data points for power\n";
	@power = get_data();
	print "Please enter 3 data points for speed\n";
	@speed = get_data();
	print "Please enter 3 data points for cadence\n";
	@cadence = get_data();
	print "Please enter 3 data points for Heart Rate\n";
	@heart = get_data();
}

#subroutine to get data points from keyboard
sub get_data{
	my @temp;
	for(my $i-0; $i<3; $i++)
	{
		print "enter value: ";
		my $input = <STDIN>;
		chomp ($input);
		push @temp, $input;
	}
	
	return @temp;
}