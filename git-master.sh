#!/bin/bash
/usr/local/bin/netdot-to-bind-export.pl
D=/etc/bind/master
cd $D

git add . 
git commit -m "update update!!"
git push origin
