#!/usr/bin/perl

use 5.006;
use strict;
use warnings;
use Test::More tests => 3;
use LWP::Online ':skip_all';
use Github::Fork::Parent;

is(github_parent('git://github.com/chorny/cgi-session.git'),
 'http://github.com/cromedome/cgi-session');
#git://github.com/cromedome/cgi-session.git

is(github_parent('git@github.com:chorny/test-more.git'),
 'http://github.com/schwern/test-more');
is(github_parent_author('git@github.com:chorny/test-more.git'),
 'schwern');

# (c) Alexandr Ciornii, 2009-2010
