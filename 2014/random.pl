#!/usr/bin/perl
use strict;
use List::Util qw(shuffle);

my $file = shift();
open( my $fin, '<', $file ) || die $!;

my @people;
while ( chomp( my $line = <$fin>) ) {
    push ( @people, $line );
}

@people = shuffle( @people );

while ( <> ) {
    my $person = shift( @people );
    print "$person\n\n";
}

