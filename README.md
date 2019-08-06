# NAME

Test::PerlTidy::XTFiles - XT::Files interface for Test::PerlTidy

# VERSION

Version 0.001

# SYNOPSIS

    use Test::PerlTidy::XTFiles;
    Test::PerlTidy::XTFiles->new->all_files_ok;

# DESCRIPTION

Adds support for the [XT::Files](https://metacpan.org/pod/XT::Files) interface to [Test::PerlTidy](https://metacpan.org/pod/Test::PerlTidy).

# USAGE

## new( \[ ARGS \] )

Returns a new `Test::PerlTidy::XTFiles` instance. `new` takes an optional
hash or list with its arguments.

    Test::Pod::Links->new(
        mute => 1,
        perltidyrc => 'the_perltidyrc_file_to_use',
    );

The following arguments are supported:

### mute (optional)

By default, [Test::PerlTidy](https://metacpan.org/pod/Test::PerlTidy) will output diagnostics about any errors
reported by perltidy, as well as any actual differences found between the
pre-tidied and post-tidied files. Set `mute` to a true value to turn off
that diagnostic output.

Internally, we set the localized `$Test::PerlTidy::MUTE` package variable,
depending on this value.

### perltidyrc (optional)

The `perltidy` argument can be used to specify a specific `.perltidyrc`
config file.

## all\_files\_ok

Calls the `all_perl_files` method of [Test::XTFiles](https://metacpan.org/pod/Test::XTFiles) to get all the files to
be tested. All files will be checked by calling `is_file_tidy` from
[Test::PerlTidy](https://metacpan.org/pod/Test::PerlTidy).

It calls `done_testing` or `skip_all` so you can't have already called
`plan`.

`all_files_ok` returns something _true_ if all files test ok and _false_
otherwise.

Please see [XT::Files](https://metacpan.org/pod/XT::Files) for how to configure the files to be checked.

# EXAMPLES

## Example 1 Default usage

Check all the files returned by [XT::Files](https://metacpan.org/pod/XT::Files) with [Test::PerlTidy](https://metacpan.org/pod/Test::PerlTidy).

    use 5.006;
    use strict;
    use warnings;

    use Test::PerlTidy::XTFiles;

    Test::PerlTidy::XTFiles->new->all_files_ok;

## Example 2 Check non-default directories or files

Use the same test file as in Example 1 and create a `.xtfilesrc` config
file in the root directory of your distribution.

    [Dirs]
    module = lib
    module = tools
    module = corpus/hello

    [Files]
    module = corpus/world.pm

# SEE ALSO

[Test::More](https://metacpan.org/pod/Test::More), [Test::PerlTidy](https://metacpan.org/pod/Test::PerlTidy), [XT::Files](https://metacpan.org/pod/XT::Files)

# SUPPORT

## Bugs / Feature Requests

Please report any bugs or feature requests through the issue tracker
at [https://github.com/skirmess/Test-PerlTidy-XTFiles/issues](https://github.com/skirmess/Test-PerlTidy-XTFiles/issues).
You will be notified automatically of any progress on your issue.

## Source Code

This is open source software. The code repository is available for
public review and contribution under the terms of the license.

[https://github.com/skirmess/Test-PerlTidy-XTFiles](https://github.com/skirmess/Test-PerlTidy-XTFiles)

    git clone https://github.com/skirmess/Test-PerlTidy-XTFiles.git

# AUTHOR

Sven Kirmess <sven.kirmess@kzone.ch>

# COPYRIGHT AND LICENSE

This software is Copyright (c) 2019 by Sven Kirmess.

This is free software, licensed under:

    The (two-clause) FreeBSD License
