package NGP;
use 5.006;
use strict;
use warnings;
our $VERSION='0.01';
use Exporter 'import';
our @EXPORT = qw();

sub get_parent {
  my $link=shift;
  my $url = "http://github.com/api/v2/yaml/repos/show/schacon/grit/network";

  my $ua=LWP::UserAgent->new();
  my $response = $ua->get($url);
  if ($response->is_success) {
    my $yaml = $response->content();
    return $yaml;
  } else {
    if ($response->code eq '404') {
      return undef;
    } else {
      die "Could not GET data (".$response->status_line.")";
    }
  }
}

sub parse_github_links {
  my $link=shift;
  if ($link=~m#^(?:\Qgit://github.com/\E|git\@github\.com:\E|\Qhttp://github.com/\E)([^/]+)/([^/]+).git$#) {
    return ($1,$2);
  } else {
    return (undef,undef);
  }
  
}
#

1;
# (c) Alexandr Ciornii, 2009
