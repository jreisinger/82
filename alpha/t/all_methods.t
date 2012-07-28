# perl
# t/all_methods.t
use strict;
use warnings;
use Test::More;
use lib ( "./lib" );
use Alpha;

my ($self, $expected, $got, $language);

##### new() #####

# new(): typical case
$self = Alpha->new( {
    name    => 'Sylvester',
    string  => 'some string',
} ); 
ok($self, "Alpha->new() returned true value");

# new() without 'name' element
$self = Alpha->new( {
    string  => 'some string',
} ); 
ok($self, "Alpha->new() returned true value even without 'name' argument");

##### get_name() #####

$expected = 'Sylvester';

# new() with variable as value for 'name' element
$self = Alpha->new( {
    name    => $expected,
    string  => 'some string',
} ); 
ok($self, "Alpha->new() returned true value");

# get_name()
$got = $self->get_name();
is( $got, $expected, "get_name() returned '$expected' as expected" );

#new() with undefined value for 'name' element
$self = Alpha->new( {
    name    => undef,
    string  => 'some string',
} ); 
ok($self, "Alpha->new() returned true value");

# get_name() default case
$got = $self->get_name();
is( $got, 'George',
    "get_name() returned 'George' as expected in default case" );

##### get_string() #####

$expected = 'abcxyz';

# new() without 'name' element
$self = Alpha->new( { string  => $expected } ); 
ok($self, "Alpha->new() returned true value");

# get_string()
$got = $self->get_string();
is( $got, $expected, "get_string() returned '$expected' as expected" );

##### is_valid_plang() #####

# new() without 'name' element
$self = Alpha->new( { string  => 'abcxyz' } ); 
ok($self, "Alpha->new() returned true value");

# is_valid_plang(): tests for several values of arguments
$language = 'perl';
ok($self->is_valid_plang($language), "'$language' is a valid language");

$language = 'Perl';
ok($self->is_valid_plang($language), "'$language' is a valid language");

$language = 'Python';
ok($self->is_valid_plang($language), "'$language' is a valid language");

# is_valid_plang: test for no argument provided
ok(! defined($self->is_valid_plang()),
    "is_valid_plang() returned undefined");

# is_valid_plang: test for invalid value (correctly written)
$language = 'abracadabra';
ok(! $self->is_valid_plang($language),
    "'$language' is not a valid language");

# is_valid_plang: test for invalid value
# uncomment to see test FAIL
# $language = 'abracadabra';
# ok($self->is_valid_plang($language),
# "'$language' is a valid language");

##### 'die' conditions #####

# new(): 'string' element undefined
# method will 'die'; capture error message
eval {
    $self = Alpha->new( {
        string  => undef,
    } );
};
like($@, qr/Alpha::new\(\) needs 'string' argument/,
    "Alpha->new(): got expected error message when 'string' was not defined");

# new(): 'string' element is empty string
# method will 'die'; capture error message
eval {
    $self = Alpha->new( {
        string  => '',
    } );
};
like($@, qr/Alpha::new\(\) needs 'string' argument/,
    "Alpha->new(): got expected error message when 'string' was empty");

done_testing();
