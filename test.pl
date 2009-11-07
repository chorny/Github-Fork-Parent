#!/usr/bin/perl

use 5.006;
use strict;
use warnings;
use lib 'lib';
use Github::Fork::Parent;

print github_parent('git://github.com/chorny/cgi-session.git'),"\n";
#git://github.com/cromedome/cgi-session.git

print github_parent('git@github.com:chorny/PPI-App-ppi_version-BDFOY.git'),"\n";
#git://github.com/briandfoy/PPI-App-ppi_version-BDFOY.git


# (c) Alexandr Ciornii, 2009
