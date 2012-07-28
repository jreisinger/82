

use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME         => 'Alpha',
    VERSION_FROM => 'lib/Alpha.pm', # finds \$VERSION
    AUTHOR       => 'James E Keenan (jkeenan@cpan.org)',
    ABSTRACT     => 'Demonstrate most useful Test::More functions',
    PREREQ_PM    => {
                     'Test::Simple' => 0.44,
                    },
);
