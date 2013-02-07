use strict;
use warnings;

use Test::More;

use Text::Lossy;

my $lossy = Text::Lossy->new->whitespace;

is($lossy->filter('Hello,   World!'), 'Hello, World!', "Multiple spaces collapsed");
is($lossy->filter('Hello, World!  '), 'Hello, World!', "Spaces at end removed");
is($lossy->filter('  Hello, World!'), 'Hello, World!', "Spaces at beginning removed");

is($lossy->filter(" \t Hello, \n\r\n World!\x{A0}\x{A0}"), 'Hello, World!', "Various whitespace removed");

is($lossy->filter("Hello, Wo\x{2060}rld!"), "Hello, Wo\x{2060}rld!", "Word Joiner left alone");

done_testing();
