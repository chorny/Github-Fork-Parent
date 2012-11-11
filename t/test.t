#!/usr/bin/perl

use 5.006;
use strict;
use warnings;
use LWP::Online ':skip_all';
use Test::More tests => 4;
use Github::Fork::Parent;

is(github_parent('git://github.com/chorny/cgi-session.git'),
 'https://github.com/cromedome/cgi-session');
#git://github.com/cromedome/cgi-session.git

is(github_parent('git@github.com:chorny/test-more.git'),
 'https://github.com/schwern/test-more');
is(github_parent_author('git@github.com:chorny/test-more.git'),
 'schwern');

my @l=Github::Fork::Parent::parse_github_links('https://github.com/schwern/test-more');
is($l[0], 'schwern','parse_github_links');


# (c) Alexandr Ciornii, 2009-2012
