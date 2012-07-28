# -*- perl -*-
# t/05_is_valid_plang.t - check get_string()
use strict;
use warnings;
use Test::More qw( no_plan );
use lib ( "./lib" );
use Alpha;

my ($self, $language);

$self = Alpha->new( { string  => 'abcxyz' } ); 
ok($self, "Alpha->new() returned true value");

$language = 'perl';
ok($self->is_valid_plang($language), "'$language' is a valid language");

$language = 'Perl';
ok($self->is_valid_plang($language), "'$language' is a valid language");

$language = 'Python';
ok($self->is_valid_plang($language), "'$language' is a valid language");

ok(! defined($self->is_valid_plang()),
    "is_valid_plang() returned undefined");

# $language = 'abracadabra';
# ok($self->is_valid_plang($language),
# "'$language' is a valid language");

$language = 'abracadabra';
ok(! $self->is_valid_plang($language),
    "'$language' is not a valid language");
