# -*- perl -*-
# t/03_get_name.t - check get_name()
use strict;
use warnings;
use Test::More qw( no_plan );
use lib ( "./lib" );
use Alpha;

my ($self, $expected, $got);

$expected = 'Sylvester';

$self = Alpha->new( {
    name    => $expected,
    string  => 'some string',
} ); 
ok($self, "Alpha->new() returned true value");

$got = $self->get_name();
is( $got, $expected, "get_name() returned '$expected' as expected" );

$self = Alpha->new( {
    name    => undef,
    string  => 'some string',
} ); 
ok($self, "Alpha->new() returned true value");

$got = $self->get_name();
is( $got, 'George',
    "get_name() returned 'George' as expected in default case" );

