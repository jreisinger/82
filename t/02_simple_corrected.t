# perl
use strict; use warnings;
use Test::Simple ( tests => 2 );

my ($x);

$x = 1;
ok( $x, "'$x' evaluates to true in Perl" );

$x = 0;
ok( ! $x, "'$x' evaluates to false in Perl" );

