# perl
use strict; use warnings;
use Test::Simple (tests => 4);

my ($x, $y, $expected);

$x = 1; ok( $x, "'$x' evaluates to true in Perl" );

$x = 0; ok( ! $x, "'$x' evaluates to false in Perl" );

$x = 4; $y = 3; $expected = 7;
ok( ( $x + $y == $expected ),
    "'$x' + '$y' adds up to '$expected'" );

$x = 'Love is a ';
$y = 'many splendored thing';
$expected = 'Love is a many splendored thing';
ok( ( $x . $y ) eq $expected,
    "Concatenated to '$expected'" );

