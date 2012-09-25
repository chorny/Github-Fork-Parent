#!/usr/bin/perl

use 5.006;
use strict;
use warnings;
use lib 'lib';
use Test::More tests => 4;
use Github::Fork::Parent;
#$|=1;

is(github_parent('git://github.com/chorny/cgi-session.git'),
 'https://github.com/cromedome/cgi-session');
#print github_parent('git://github.com/chorny/cgi-session.git'),"\n";
#git://github.com/cromedome/cgi-session.git

is(github_parent('git@github.com:chorny/test-more.git'),
 'https://github.com/schwern/test-more');
is(github_parent_author('git@github.com:chorny/test-more.git'),
 'schwern');

my @l=Github::Fork::Parent::parse_github_links('https://github.com/schwern/test-more.git');
is($l[0], 'schwern');

# (c) Alexandr Ciornii, 2009
