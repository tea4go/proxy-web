#!/bin/bash
#https://developer.apple.com/legacy/library/documentation/Darwin/Reference/ManPages/man8/networksetup.8.html


network="Wi-Fi"
httpproxy=$1
port=$2
switch=$3



if [ "$switch" = "close" ]
then 
    networksetup -setwebproxystate $network off
    networksetup -setsecurewebproxystate $network off
    networksetup -setproxybypassdomains $network Empty
    networksetup -setautoproxystate $network off
    networksetup -setsocksfirewallproxystate $network off
    echo successfully shutdown proxy
else 
    networksetup -setwebproxy $network $httpproxy $port off
    networksetup -setsecurewebproxy $network $httpproxy $port off
    networksetup -setproxybypassdomains $network 127.0.0.1 192.168.0.0/16 10.0.0.0/8 172.16.0.0/12 localhost *.local
    networksetup -setautoproxystate $network off
    networksetup -setsocksfirewallproxystate $network off
    echo successfully setup proxy
fi




