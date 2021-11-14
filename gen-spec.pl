#!/usr/bin/perl
use strict;
use warnings;
#-------------------------------------------------------------------------------
# Substitute variables in the ingestion spec
#-------------------------------------------------------------------------------

use Getopt::Long;

my $usage = <<"EOF";
    usage: $0 --json-template <json-template> --date <date> --data-source <data source> --append <true|false>
EOF

my $json_template;
my $d_date;
my $data_source;
my $append;

GetOptions(
    "json-template=s"     => \$json_template,
    "date=s"              => \$d_date,
    "data-source=s"       => \$data_source,
    "append=s"            => \$append)
or die $usage;

open INFILE, "<$json_template" or die "could not open file $json_template";
while (<INFILE>) {
    s/\$d_date/$d_date/g;
    s/\$data_source/$data_source/g;
    s/\$append/$append/g;
    print;
}
close INFILE;

