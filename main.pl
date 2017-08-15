use team;
use strict;
use warnings;
use File::stat;
use Time::localtime;

my @teams = ();
my $sp = "\n";
my $filename = 'top3list.csv';
open(my $fh, '<:encoding(UTF-8)', $filename) or die "Could not open file '$filename' $!";
my $timestamp = ctime(stat($fh)->mtime);
print $sp;

print "Filename: " . $filename, $sp;
print "Created At: " . $timestamp;
print $sp, $sp;

while (my $row = <$fh>) {
  chomp $row;
  my @team_pieces = split(',',$row);
  my $t = team->new('Name' => $team_pieces[0], 'Super Bowl Wins' => $team_pieces[1]);
  push @teams, $t;
}

foreach my $team (@teams) {
	my $header = "| Team: " . $team->{'Name'} . " |";
	print "+" . ("-" x (length($header) - 2)) . "+", $sp;
	print $header, $sp;
	my $ws = length($header) - length("| Super Bowl Wins: " . $team->{'Super Bowl Wins'}) - 2;
	print "| Super Bowl Wins: " . $team->{'Super Bowl Wins'} . (" " x $ws) . " |", $sp;
	print "+" . ("-" x (length($header) - 2)) . "+", $sp, $sp;
}