use Test::More;
use strict;
use warnings;
use utf8;

use File::Slurp qw/read_file/;
use EPUB::Parser;

my $ee = EPUB::Parser->new;
$ee->load_file({ file_path  => 't/var/denden_converter.epub' });

is($ee->navi->path, 'OEBPS/nav.xhtml', 'path');
ok( length $ee->navi->data, 'data');
is( ref $ee->navi->parser, 'EPUB::Parser::File::Parser::Navi', 'parser');

is_deeply($ee->navi->toc->list, [
    { title => 'このコンテンツについて', href => 'bodymatter_0_0.xhtml#toc_index_1' },
    { title => '一',                     href => 'bodymatter_0_1.xhtml#toc_index_1' },
    { title => '二',                     href => 'bodymatter_0_2.xhtml#toc_index_1' },
    { title => '三',                     href => 'bodymatter_0_3.xhtml#toc_index_1' },
    { title => '四',                     href => 'bodymatter_0_4.xhtml#toc_index_1' },
    { title => '五',                     href => 'bodymatter_0_5.xhtml#toc_index_1' },
    { title => '六',                     href => 'bodymatter_0_6.xhtml#toc_index_1' },
], 'toc list');

done_testing;
