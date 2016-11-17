

#!/usr/bin/perl
# an example script demonstrating the use of BioMart webservice
# ref: http://www.biomart.org/martservice.html

use strict;
use LWP::UserAgent;

# Please use the HGNC symbol checker to get a unique gene name: http://www.genenames.org/cgi-bin/symbol_checker
# TUBA6 ---> TUBA1C
# HRMT1L1  ---> PRMT2


# my $gene_name = "RPL41,RPL37A,TUBA6,EEF1A1,C21orf33,WRB,HRMT1L1,ATP5O";
my $gene_name = @ARGV[0];


my $xml = qq(<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE Query>
<Query  virtualSchemaName = "default" formatter = "FASTA" header = "0" uniqueRows = "0" count = "" datasetConfigVersion = "0.6" >
			
	<Dataset name = "hsapiens_gene_ensembl" interface = "default" >
		<Filter name = "chromosome_name" value = "1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,X,Y,MT"/>
		<Filter name = "hgnc_symbol" value = "$gene_name"/>
		<Attribute name = "external_gene_name" />
		<Attribute name = "gene_exon_intron" />
	</Dataset>
</Query>); 


# my $path="http://www.biomart.org/biomart/martservice?"; 
my $path="http://useast.ensembl.org/biomart/martservice?";
my $request = HTTP::Request->new("POST",$path,HTTP::Headers->new(),'query='.$xml."\n");
my $ua = LWP::UserAgent->new;

my $response;

$ua->request($request, 
	     sub{   
		 my($data, $response) = @_;
		 if ($response->is_success) {
		     print "$data";
		 }
		 else {
		     warn ("Problems with the web server: ".$response->status_line);
		 }
	     },1000);