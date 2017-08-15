package team;
use strict;
use warnings;

sub new {
  my $type = shift;
  my %params = @_;
  my $self = {};
  $self->{'Name'} = $params{'Name'};
  $self->{'Super Bowl Wins'} = $params{'Super Bowl Wins'};
  bless $self, $type;
}

1;

