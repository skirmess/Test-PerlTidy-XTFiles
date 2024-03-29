use 5.006;
use strict;
use warnings;

use ExtUtils::MakeMaker;

my %WriteMakefileArgs = (
    ABSTRACT           => 'XT::Files interface for Test::PerlTidy',
    AUTHOR             => 'Sven Kirmess <sven.kirmess@kzone.ch>',
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => 0,
    },
    DISTNAME         => 'Test-PerlTidy-XTFiles',
    LICENSE          => 'open_source',
    MIN_PERL_VERSION => '5.006',
    NAME             => 'Test::PerlTidy::XTFiles',
    PREREQ_PM        => {
        'Class::Tiny'    => '1',
        'Test::Builder'  => 0,
        'Test::PerlTidy' => 0,
        'Test::XTFiles'  => 0,
        strict           => 0,
        warnings         => 0,
    },
    TEST_REQUIRES => {
        'Test::Builder::Tester' => 0,
        'Test::MockModule'      => '0.14',
        'Test::More'            => '0.88',
        constant                => 0,
        lib                     => 0,
    },
    VERSION => '0.001',
    test    => {
        TESTS => 't/*.t',
    },
);

my %FallbackPrereqs = (
    'Class::Tiny'           => '1',
    'Test::Builder'         => 0,
    'Test::Builder::Tester' => 0,
    'Test::MockModule'      => '0.14',
    'Test::More'            => '0.88',
    'Test::PerlTidy'        => 0,
    'Test::XTFiles'         => 0,
    constant                => 0,
    lib                     => 0,
    strict                  => 0,
    warnings                => 0,
);

if ( !eval { ExtUtils::MakeMaker->VERSION('6.63_03') } ) {
    delete $WriteMakefileArgs{TEST_REQUIRES};
    delete $WriteMakefileArgs{BUILD_REQUIRES};
    $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

if ( !eval { ExtUtils::MakeMaker->VERSION(6.52) } ) {
    delete $WriteMakefileArgs{CONFIGURE_REQUIRES};
}

WriteMakefile(%WriteMakefileArgs);

# vim: ts=4 sts=4 sw=4 et: syntax=perl
