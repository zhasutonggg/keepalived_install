#!/bin/bash
# FileName: keepalived_install.sh
# Author: zhasutong
# Email: 1875786959@qq.com
# Date: 2021-01-02 15:07:29
# Description: install keepalived 

SOFTWARE_URL='https://www.keepalived.org/software/keepalived-2.0.20.tar.gz'
yum install -y gcc kernel-devel openssl openssl-devel wget vim &> /dev/null
cd /opt
mkdir -p /usr/local/keepalived
wget -c ${SOFTWARE_URL}

if [ $? -eq 0 ];then
	tar -xf keepalived-2.0.20.tar.gz && cd keepalived-2.0.20
else
	echo "下载失败！"
fi
mv /opt/keepalived-2.0.20 /usr/local/keepalived
cd /usr/local/keepalived
./configure  && make && make install
mkdir -p /etc/keepalived
cp /usr/local/keepalived/keepalived-2.0.20/keepalived/etc/init.d/keepalived /etc/init.d/
cp /usr/local/keepalived/keepalived-2.0.20/keepalived/etc/keepalived/keepalived.conf /etc/keepalived/
cp /usr/local/keepalived/keepalived-2.0.20/keepalived/etc/sysconfig/keepalived /etc/sysconfig/keepalived


systemctl start keepalived
systemctl status keepalived
systemctl enable keepalived
