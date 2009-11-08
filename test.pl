#!/usr/bin/perl

use 5.006;
use strict;
use warnings;
use lib 'lib';
use Test::More tests => 2;
use Github::Fork::Parent;

is(github_parent('git://github.com/chorny/cgi-session.git'),
 'http://github.com/cromedome/cgi-session');
#print github_parent('git://github.com/chorny/cgi-session.git'),"\n";
#git://github.com/cromedome/cgi-session.git

is(github_parent('git@github.com:chorny/PPI-App-ppi_version-BDFOY.git'),
 'http://github.com/briandfoy/PPI-App-ppi_version-BDFOY');
#print github_parent('git@github.com:chorny/PPI-App-ppi_version-BDFOY.git'),"\n";
#git://github.com/briandfoy/PPI-App-ppi_version-BDFOY.git


# (c) Alexandr Ciornii, 2009
