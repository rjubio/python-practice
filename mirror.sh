#!/bin/bash

R=`which rsync`
O="-avz --delete-after"
S="/backup/mysql"
D="rod@202.90.133.82:/storage/backup"

$R $O $S $D
