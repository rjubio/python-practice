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

#my $salt = substr(sha256_hex(defined $ARGV[0]?$ARGV[0]:random_hash(8,32)),0,16);
#open (my $fsalt, '>>', $hashdump) or die "Could not open file '$hashdump' $!";
#print $fsalt $salt;
#print $fsalt " \n";
#close $fsalt;

### Export zones from netdot
###  
print "running netdot exporter.pl... \n";
if ($? != -1) {
system('/usr/local/netdot/bin/exporter.pl -t BIND -z 128.90.202.in-addr.arpa,129.90.202.in-addr.arpa,131.90.202.in-addr.arpa,132.90.202.in-addr.arpa,149.90.202.in-addr.arpa,158.90.202.in-addr.arpa,134.90.202.in-addr.arpa,133.90.202.in-addr.arpa,130.90.202.in-addr.arpa,153.90.202.in-addr.arpa,phopenix.net,137.90.202.in-addr.arpa,136.90.202.in-addr.arpa,136.90.202.in-addr.arpa,135.90.202.in-addr.arpa,172.32.198.in-addr.arpa');
system('/usr/local/netdot/bin/exporter.pl -t BIND -z pregi.net ');
print "export success... \n";

### To check for updates on the pregi zone
### compute the md5 hash and compare with 
### the one on record
use Digest::MD5::File qw ( file_md5_hex ) ;
my $md5 = file_md5_hex ( $pregi );
print "MD5 computed on the zone: $md5 \n";
open (my $ph, "<$prevhash") or die "Could not open file '$prevhash' $!";
my $first = <$ph>;
print "MD5 read from the record: $first \n";
close $ph;
if ( $md5 eq $first ) {
print "Same HASH!!!";
} else {
open (my $fh, '>>', $pregi) or die "Could not open file '$pregi' $!";
print $fh "\$include $zsk \n";
print $fh "\$include $ksk \n";
close $fh;
open (my $ph, '>', $prevhash) or die "Could not open file '$prevhash' $!";
my $md5 = file_md5_hex ( $pregi );
print $ph "$md5";
close $ph;
print "MD5 written to the record: $md5 \n";
}

#### Not in use 
#### Bind doing auto signing now
#### Ignore this manual signing

#my $cmd = ("/usr/sbin/dnssec-signzone");
#$cmd .= " \-x \-o pregi.net";
#$cmd .= " \-k ";
#$cmd .= $ksk;
#$cmd .= " \-3 ";
#$cmd .= $salt;
#$cmd .= " ";
#$cmd .= $pregi;
#$cmd .= " ";
#$cmd .= $zsk;
#system($cmd);
#system('/usr/sbin/dnssec-signzone -x -o pregi.net -k $ksk $pregi $zsk');
#system('/usr/sbin/dnssec-signzone -x -o pregi.net -k /etc/nsd/keys/Kpregi.net.+007+44408.key /etc/nsd/keys/Kpregi.net.+007+58746.key');

system('/usr/sbin/rndc reconfig');
system('/usr/sbin/rndc reload');
print "notify NS success... \n";
}
else 
{
print "command failed... \n";
}

sub random_hash {
   my ($ash,$ml) = ('',((defined$_[0]&&$_[0]>0)?$_[0]:4));
   my $Ml=(defined$_[1]&&$_[1]>=$ml)?$_[1]:$ml+5;
   $ash .= ('.','/',0..9,'A'..'Z','a'..'z')[rand 64]
                   foreach(1..($ml+int(rand $Ml-$ml)));
   $ash;
}

