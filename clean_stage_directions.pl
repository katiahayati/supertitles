use warnings;
use strict;

my $in_paren = 0;
while (<>) {
    if (/\(/) {
	$in_paren = 1;
    }
    print unless $in_paren;
    if (/\)/) {
	$in_paren = 0;
    }
}
