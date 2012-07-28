# -*- perl -*-
# t/02_new_no_name.t - check constructor in absence of 'name' argument
use strict;
use warnings;
use Test::More qw( no_plan );
use lib ( "./lib" );
use Alpha;

my $self;

$self = Alpha->new( {
    name    => 'Sylvester',
    string  => 'some string',
} ); 
ok($self, "Alpha->new() returned true value");

$self = Alpha->new( {
    string  => 'some string',
} ); 
ok($self, "Alpha->new() returned true value even without 'name' argument");

