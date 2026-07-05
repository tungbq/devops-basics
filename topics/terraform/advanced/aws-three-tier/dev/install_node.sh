#! /bin/bash
yum update -y
yum -y install curl
yum install -y gcc-c++ make
curl -sL https://rpm.nodesource.com/setup_16.x | bash -
yum install -y nodejs
