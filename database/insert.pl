use strict;
use warnings;
use IPC::System::Simple qw(system capture);
use DBI;
use DBD::mysql;
use Data::Dumper;

my %genes;


my $dsn = "DBI:mysql:database=bgruber;host=p1.cs.ohiou.edu;port=3306";
my $userid = "bgruber";
my $passwd = "bg839337";

my @rows;
my $connection = DBI->connect($dsn,$userid,$passwd);
my $query = "SELECT id, symbol FROM gene";
my $statement = $connection->prepare($query);
$statement->execute();

while(my @data = $statement->fetchrow_array()) {
	$genes{$data[1]} = $data[0];
}

foreach my $gene (keys %genes)
{
	get_seq($gene)
}


sub get_seq{

my $gn = @_;

print $gn;

my @lines = capture($^X, "get_gene_biomart.pl", $gn);
my $gene = $lines[0];
my @seque = @lines[1..$#lines];
my $sequence = join('',@seque);
$sequence =~ tr/\r\n//d;
$gene =~ tr/>//d;

return $sequence;
}
#my $promoter = capture($^X, "promoter.pl");



# invoke the ConnectToMySQL sub-routine to make the database connection
#my $l_connection = DBI->connect($dsn,$userid,$passwd);

# set the value of your SQL query
#my $query = "insert into seq (seq, gene) values ('$sequence', '$gene')";

#print $query;

# prepare your statement for connecting to the database
#my $statement = $l_connection->prepare($query);

# execute your SQL statement
#$statement->execute();

