#!/bin/bash

cat /root/switch.txt | while read line
do
echo "define host {"
echo "        use generic-router"
echo "        host_name $line"
echo "        hostgroups core-routers"
echo "}"

echo "define service {"
echo "        use     local-service"
echo "        host_name      $line"
echo "        service_description     SSH"
echo "        check_command   check_ssh "
echo "}"
#echo $line
done
