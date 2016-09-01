#	 Brent Gruber
#	 CS 4170
#	 Bicycling homework part A
#
#	 This script will calculate and display the average of data points taken for power,
#	 speed, cadence, and Heart Rate


#data is hardcoded for part A, was not specified how to retrieve data.

#power data points
@power = (5, 6, 7);
#speed data points
@speed = (10, 15, 13);
#cadence data points
@cadence = (0, 0, 0);
#heart rate data points
@heart = (120, 140, 130);


#calculate and print averages for each category
$avg = average(\@power);
print "Average Power: $avg\n";
$avg = average(\@speed);
print "Average Speed: $avg\n";
$avg = average(\@cadence);
print "Average Cadence: $avg\n";
$avg = average(\@heart);
print "Average Heart Rate: $avg\n";




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