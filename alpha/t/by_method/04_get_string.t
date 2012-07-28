# -*- perl -*-
# t/04_get_string.t - check get_string()
use strict;
use warnings;
use Test::More qw( no_plan );
use lib ( "./lib" );
use Alpha;

my ($self, $expected, $got);

$expected = 'abcxyz';

$self = Alpha->new( {
    string  => $expected,
} ); 
ok($self, "Alpha->new() returned true value");

$got = $self->get_string();
is( $got, $expected, "get_string() returned '$expected' as expected" );

