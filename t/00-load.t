#!/usr/bin/perl

use strict;
use warnings;

use Test::More;

BEGIN {
    require_ok('Text::Lossy');
}

diag( "Testing Text::Lossy $Text::Lossy::VERSION, Perl $], $^X" );

for my $sub (qw(
    new
    process
    add
    as_coderef

    lower
    whitespace
    punctuation
    alphabetize

    register_filters
)) {
    can_ok('Text::Lossy', $sub);
}

done_testing();
