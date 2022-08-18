#!perl

# vim: ts=4 sts=4 sw=4 et: syntax=perl
#
# Copyright (c) 2019-2022 Sven Kirmess
#
# Permission to use, copy, modify, and distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

use 5.006;
use strict;
use warnings;

use Test::More 0.88;

use Test::PerlTidy::XTFiles;

use constant CLASS => 'Test::PerlTidy::XTFiles';

chdir 'corpus/empty' or die "chdir failed:  $!";

my $obj = CLASS()->new;
isa_ok( $obj, CLASS(), 'new() returns a ' . CLASS() . ' object' );

is( $obj->perltidyrc, undef, 'perltidyrc is not defined' );
is( $obj->mute,       undef, 'mute is not defined' );

$obj = CLASS()->new( perltidyrc => 'nonexisting_file.txt', mute => 1 );
isa_ok( $obj, CLASS(), 'new(...) returns a ' . CLASS() . ' object' );

is( $obj->perltidyrc, 'nonexisting_file.txt', 'perltidyrc returnes the config file' );
is( $obj->mute,       1,                      'mute returnes 1' );

#
done_testing();

exit 0;
