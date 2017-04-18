#!/usr/bin/perl

use strict;
use warnings;
use Digest::SHA qw(sha256_hex);
use Path::Tiny;

my %self;
my $zsk = "/etc/bind/keys/Kpregi.net.+013+19150.key";
my $ksk = "/etc/bind/keys/Kpregi.net.+013+47282.key";
my $hashdump = "/etc/bind/keys/hashdump.txt";
my $pregi = "/etc/bind/master/pregi.net" ;
my $prevhash = "/etc/bind/master/prev-hash" ;

my $salt = substr(sha256_hex(defined $ARGV[0]?$ARGV[0]:random_hash(8,32)),0,16);
open (my $fsalt, '>', $hashdump) or die "Could not open file '$hashdump' $!";
print $fsalt $salt;
print $fsalt " \n";
close $fsalt;

sub random_hash {
   my ($ash,$ml) = ('',((defined$_[0]&&$_[0]>0)?$_[0]:4));
   my $Ml=(defined$_[1]&&$_[1]>=$ml)?$_[1]:$ml+5;
   $ash .= ('.','/',0..9,'A'..'Z','a'..'z')[rand 64]
                   foreach(1..($ml+int(rand $Ml-$ml)));
   $ash;
}
