use strict;
use warnings;
use utf8;

use Test::More;

use Text::Lossy;

my $lossy = Text::Lossy->new->lower;

# ascii
is($lossy->filter('Hello, World!'), 'hello, world!', "ASCII lowercase");
is($lossy->filter('hello, world!'), 'hello, world!', "No change on already lower");

# latin1
is($lossy->filter('TÜR schließen'), 'tür schließen', "Latin1 one");
is($lossy->filter('FRÊRE ÇA JALAPEÑO'), 'frêre ça jalapeño', "Latin1 two");

# Greek
is($lossy->filter('ΑΒΓΔ'), 'αβγδ', "Greek");

# Kyrillic
is($lossy->filter('АБДЖ'), 'абдж', "Cyrillic");

done_testing();
