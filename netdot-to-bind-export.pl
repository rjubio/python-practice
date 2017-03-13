#!/usr/bin/perl

use strict;
use Digest::SHA qw(sha256_hex);

my %self;
my $zsk = "/etc/bind/keys/Kpregi.net.+013+19150.key";
my $ksk = "/etc/bind/keys/Kpregi.net.+013+47282.key";
my $hashdump = "/etc/bind/keys/hashdump.txt";
my $pregi = "/etc/bind/master/pregi.net" ;

#my $salt = substr(sha256_hex(defined $ARGV[0]?$ARGV[0]:random_hash(8,32)),0,16);
#open (my $fsalt, '>>', $hashdump) or die "Could not open file '$hashdump' $!";
#print $fsalt $salt;
#print $fsalt " \n";
#close $fsalt;

print "running netdot exporter.pl... \n";
if ($? != -1) {
print "dump success... \n";
system('/usr/local/netdot/bin/exporter.pl -t BIND -z 128.90.202.in-addr.arpa,129.90.202.in-addr.arpa,131.90.202.in-addr.arpa,132.90.202.in-addr.arpa,149.90.202.in-addr.arpa,158.90.202.in-addr.arpa,134.90.202.in-addr.arpa,133.90.202.in-addr.arpa,130.90.202.in-addr.arpa,153.90.202.in-addr.arpa,phopenix.net,137.90.202.in-addr.arpa,136.90.202.in-addr.arpa,136.90.202.in-addr.arpa,135.90.202.in-addr.arpa,172.32.198.in-addr.arpa');

#Create a diff checker using hash of old file and new file
#if comp_md5 {

system('/usr/local/netdot/bin/exporter.pl -t BIND -z pregi.net ');
print "command success... \n";
print "signing zone files... \n";
open (my $fh, '>>', $pregi) or die "Could not open file '$pregi' $!";
print $fh "\$include $zsk \n";
print $fh "\$include $ksk \n";
close $fh;

##### Not in use 
##### Bind doing auto signing now
##### Ignore this manual signing

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

#}
#end comp_md5 subroutine

#system('/usr/sbin/nsdc rebuild');
#system('/usr/sbin/nsdc reload');
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

