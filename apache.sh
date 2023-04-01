#!/bin/bash

sudo apt update -y

sudo apt install apache2 -y

echo "
ProxyRequests off
<Proxy balancer://lb-apache>
    BalancerMember http://192.168.15.101:80
    BalancerMember http://192.168.15.102:80
    ProxySet lbmethod=byrequests
</Proxy>

<Location /balancer-manager>
    SetHandler balancer-manager
</Location>

ProxyPass /balancer-manager !
ProxyPass / balancer://lb-apache
" > /etc/apache2/conf-available/lb.conf