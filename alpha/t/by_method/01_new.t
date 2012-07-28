# -*- perl -*-
# t/01_new.t - check constructor
use strict;
use warnings;
use Test::More qw( no_plan );
use lib ( "./lib" );
use Alpha;

my $self = Alpha->new( {
    name    => 'Sylvester',
    string  => 'some string',
} ); 
ok($self, "Alpha->new() returned true value");

