use strict;
use warnings;
use feature qw(unicode_strings);
use utf8;
use open 'IO' => ':utf8';
use open ':std';

use Test::More;

use Text::Lossy;

my $lossy = Text::Lossy->new->punctuation;

is($lossy->filter('Hello, World!'), 'Hello World', "ASCII punctuation removed");
is($lossy->filter("Hello\x{2042} World\x{ff1f}"), "Hello World", "non-ASCII punctuation removed");
is($lossy->filter("Hello World\x{2605}"), "Hello World\x{2605}", "non-punctuation stays");

done_testing();
