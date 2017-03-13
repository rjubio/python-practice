#!/usr/bin/perl

use strict;
use Digest::SHA qw(sha256_hex);
use Path::Tiny;

my %self;
my $zsk = "/etc/bind/keys/Kpregi.net.+013+19150.key";
my $ksk = "/etc/bind/keys/Kpregi.net.+013+47282.key";
my $hashdump = "/etc/bind/keys/hashdump.txt";
my $pregi = "/etc/bind/master/pregi.net" ;
my $prevhash = "/etc/bind/master/prev-hash" ;

use Digest::MD5::File qw ( file_md5_hex) ;
my $md5 = file_md5_hex ( $pregi );

print "$md5 \n";
#(my $firstline) = path($prevhash)->lines( { count => 1 } );
open (my $ph, "<$prevhash") or die "Cound not open file '$prevhash' $!";
my $first = <$ph>;
close $ph;
open (my $ph, ">$prevhash") or die "Cound not open file '$prevhash' $!";
if ( $md5 == $first ) { 
print "Same HASH!!!";
} else { 
print $ph "$md5";
}
close $ph;

#open (my $fh, '>>', $pregi) or die "Could not open file '$pregi' $!";
#print $fh "\$include $zsk \n";
#print $fh "\$include $ksk \n";
#close $fh;


