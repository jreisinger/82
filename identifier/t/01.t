use strict;
use warnings;
use Test::More;
use lib ("./lib");
use Identifier;

$|++;

# No argument (defaults to 10)
{
    my $got_length = length make_varname();
    is( $got_length, 10, "Passing nothing - got $got_length" );
}

# Variuos arguments
for my $length (qw( -1 0 2 3 5 10 15 20 23 )) {

    my $expected_length;
    if ( $length < 3 ) {
        $expected_length = 3;
    } elsif ( $length > 20 ) {
        $expected_length = 20;
    } else {
        $expected_length = $length;
    }

    my $got_length = length make_varname($length);

    is( $got_length, $expected_length, "Passing $length - got $got_length" );
}

done_testing();
