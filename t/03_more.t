# perl
use strict; use warnings;
use Test::More;

my ($x, $y, $expected);

$x = 1; ok( $x, "'$x' evaluates to true in Perl" );
$x = 0; ok( ! $x, "'$x' evaluates to false in Perl" );

$x = 4;
$y = 3;
$expected = 7;
is(
    ($x + $y),                              # got
    $expected,                              # expected
    "'$x' + '$y' adds up to '$expected'"    # description
);

done_testing();

