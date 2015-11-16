#!/usr/bin/perl

use 5.006;
use strict;
use warnings;
use LWP::Online ':skip_all';
use Test::More tests => 5;
use Github::Fork::Parent;

use LWP::UserAgent;
my $ua = LWP::UserAgent->new;
$ua->env_proxy;
$ua->timeout(10);
#$ua->ssl_opts( verify_hostname => 0 );
my $site = 'https://api.github.com/';
my $r = $ua->get($site);
my $content = $r->content;
my $api_site_available = 1;
if ( !$r->is_success ) { $api_site_available = 0; diag("api.github.com error: ".$r->status_line); }
elsif ( $content !~ /^\s*\{/s) { $api_site_available = 0; diag("api.github.com content error: $content");}

SKIP: {
  skip "api.github.com unavailable", 4 unless $api_site_available;

  is(github_parent('git://github.com/chorny/plagger.git'),
   'https://github.com/miyagawa/plagger');
#git://github.com/cromedome/cgi-session.git

  is(github_parent('git@github.com:chorny/test-more.git'),
   'https://github.com/Test-More/test-more');
  is(github_parent_author('git@github.com:chorny/test-more.git'),
   'Test-More');

  is(github_parent_author('http://github.com/chorny/Github-Fork-Parent'),
   'chorny');
   

}

my @l=Github::Fork::Parent::parse_github_links('https://github.com/schwern/test-more');
is($l[0], 'schwern','parse_github_links');

# (c) Alexandr Ciornii, 2009-2013
