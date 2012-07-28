package Alpha;
use strict;
our $VERSION = '0.01';
use Carp;

=head1 NAME

Alpha - Demonstrate most useful Test::More functions

=head1 SYNOPSIS

    use Alpha;

    $self = Alpha->new( {
        name    => 'Sylvester',     # optional
        string  => 'some string',
    } ); 

    $name = $self->get_name();

    $string = $self->get_string();

    $return_value = $self->is_valid_plang('Perl');

=head1 DESCRIPTION

This is a simple Perl 5 object-oriented module intended to be used to
demonstrate the use of C<Test::More>'s C<ok()>, C<is()> and C<like()>
functions as well as that of the command-line utility F<prove>.

=head1 METHODS

=head2 C<new()>

=over 4

=item * Purpose: Alpha constructor.

=item * Arguments:  Reference to hash with two key-value pairs.

    $self = Alpha->new( {
        name    => 'Sylvester', # optional; defaults to 'George'
        string  => 'some string',
    } ); 

=item * Return Value: Alpha object.

=item * Comment: Internally defines a set of valid languages limited to:

    perl php prolog python

... spelled both that way and with initial upper-case letters.

=back

=cut

sub new {
    my ($class, $args) = @_;

    $args->{name} ||= 'George';

    croak "Alpha::new() needs 'string' argument"
        unless (defined($args->{string}) and $args->{string} ne '');

    my @lc_languages = qw( perl php prolog python );
    my @languages = @lc_languages;
    for (@lc_languages) { push @languages, ucfirst($_); }
    $args->{languages} = { map { $_ => 1 } @languages };

    my $self = bless $args, $class;
    return $self;
}

=head2 C<get_name()>

=over 4

=item * Purpose: Report the value of the C<name> element in the Alpha object's data structure.

=item * Arguments: None.

    $name = $self->get_name();

=item * Return Value: String.

=item * Comment: Will default to C<George> if no value was supplied to C<name> argument in C<new()>.

=back

=cut

sub get_name {
    my ($self) = @_;
    return $self->{name};
}

=head2 C<get_string()>

=over 4

=item * Purpose: Report the value of the C<string> element in the Alpha object's data structure.

=item * Arguments: None.

    $string = $self->get_string();

=item * Return Value: String.

=back

=cut

sub get_string {
    my ($self) = @_;
    return $self->{string};
}

=head2 C<is_valid_plang()>

=over 4

=item * Purpose: Reports whether string passed as argument is member of set of valid computer languages set by constructor.

=item * Argument: String.

    $return_value = $self->is_valid_plang('Perl');

=item * Return Value:

=over 4

=item * True: If argument is a member of the set of valid languages.

=item * False (but defined): If argument was defined but is not a member of
the set of valid languages.

=item * Undefined: If no argument was defined.

=back

=back

=cut

sub is_valid_plang {
    my ($self, $lang) = @_;
    return unless defined $lang;
    return 0 unless $self->{languages}->{$lang};
    return 1;
}

=head1 AUTHOR

    James E Keenan
    CPAN ID: jkeenan
    jkeenan@cpan.org
    http://thenceforward.net/perl/

=head1 COPYRIGHT

This program is free software; you can redistribute
it and/or modify it under the same terms as Perl itself.

The full text of the license can be found in the
LICENSE file included with this module.

=head1 SEE ALSO

perl(1).  prove(1).  C<perldoc Test::More>.

=cut

1;
# The preceding line will help the module return a true value

