#!/bin/bash

#description=Downloads the ipmitool package from github and installs it

cd /root

wget https://raw.githubusercontent.com/dmacias72/unRAID-plugins/master/source/packages/ipmitool-1.8.17-x86_64-1.txz

installpkg *.txz