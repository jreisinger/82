# -*- perl -*-
# t/06_new_no_string.t - check constructor in absence of 'string' argument
use strict;
use warnings;
use Test::More qw( no_plan );
use lib ( "./lib" );
use Alpha;

my $self;

$self = Alpha->new( {
    string  => 'some string',
} ); 
ok($self, "Alpha->new() returned true value");

eval {
    $self = Alpha->new( {
        string  => undef,
    } );
};
like($@, qr/Alpha::new\(\) needs 'string' argument/,
    "Alpha->new(): got expected error message when 'string' was not defined");

eval {
    $self = Alpha->new( {
        string  => '',
    } );
};
like($@, qr/Alpha::new\(\) needs 'string' argument/,
    "Alpha->new(): got expected error message when 'string' was empty");
