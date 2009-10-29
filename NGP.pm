package NGP;
use 5.006;
use strict;
use warnings;
our $VERSION='0.01';

use YAML::Tiny 1.40;
use LWP::UserAgent;

use Exporter 'import';
our @EXPORT = qw(github_parent);

sub get_network_data {
  my ($author,$project)=@_;
  my $url = "http://github.com/api/v2/yaml/repos/show/$author/$project/network";

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

sub github_parent {
  my $link=shift;
  my ($author,$project)=parse_github_links($link);
  my $yaml_content=get_network_data($author,$project);
  my $yaml=YAML::Tiny->read_string($yaml_content);
  my @network=@{$yaml->[0]->{network}};
}
#

1;
# (c) Alexandr Ciornii, 2009
