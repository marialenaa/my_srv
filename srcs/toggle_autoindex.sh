#!/bin/bash

if [ $AUTOINDEX = "on" ]
then
    sed -i 's/autoindex on;/autoindex off;/g' /etc/nginx/sites-available/default.conf
    export AUTOINDEX=off
    echo "Autoindex is $AUTOINDEX"
    service nginx reload
else
    sed -i 's/autoindex off;/autoindex on;/g' /etc/nginx/sites-available/default.conf
    export AUTOINDEX=on
    echo "Autoindex is $AUTOINDEX"
    service nginx reload
fi
