package NGP;
use 5.006;
use strict;
use warnings;
our $VERSION='0.01';

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
#

1;
# (c) Alexandr Ciornii, 2009
