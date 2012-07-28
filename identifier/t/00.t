use strict;
use warnings;
use Test::More;
use lib ("./lib");
use Identifier;

$|++;

# No argument (defaults to 10)
{
    my $varname = make_varname();
    my $expected_length = 10;
    my $got_lentgh = length $varname;

    is ($expected_length, $got_lentgh, "Passing nothing - got $got_lentgh expected $expected_length");
}

# Variuos arguments
for my $length ( qw( -1 0 2 3 5 10 15 20 23 ) )
{
    my $varname = make_varname($length);

    my $expected_length;
    if ( $length < 3 ) {
        $expected_length = 3;
    } elsif ( $length > 20 ) {
        $expected_length = 20;
    } else {
        $expected_length = $length;
    }

    my $got_lentgh = length $varname;

    is ($expected_length, $got_lentgh, "Passing $length - got $got_lentgh expected $expected_length");
}

done_testing();
