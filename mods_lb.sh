#!/bin/bash

a2enmod proxy_http

a2enmod lbmethod_byrequests

a2enmod lbmethod_bytraffic

a2enmod lbmethod_bybusyness

a2enmod lbmethod_heartbeat

a2enconf lb.conf

systemctl restart apache2