use strict;
use warnings;
use feature qw(unicode_strings);
use utf8;
use open 'IO' => ':utf8';
use open ':std';

use Test::More;

use Text::Lossy;

my $lossy = Text::Lossy->new->alphabetize;

is($lossy->filter('Hello, World!'), 'Hello, Wlord!', "Internally sorted");
is($lossy->filter('alphabetization'), 'aaabehiilopttzn', "Long word internally sorted");
is($lossy->filter("!!::..::!! \t\t\r\n 162534"), "!!::..::!! \t\t\r\n 162534", "Whitespace, punctuation and numbers unaffected");
is($lossy->filter('dcba1dcba zyx1 1zyx'), 'dcba1dcba zyx1 1zyx', "Requires end-of-word at each side");
is($lossy->filter("drüben señor"), "dberün seoñr", "Unicode sorting");
is($lossy->filter("こんにちは"), "こちにんは", "More unicode sorting");

done_testing();
