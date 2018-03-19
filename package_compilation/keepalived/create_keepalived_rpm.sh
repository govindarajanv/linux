yum install rpmdevtools && rpmdev-setuptree -y
yum install openssl-devel kernel-devel -y
yum install gcc -y
yum install libnfnetlink-devel autoconf  automake  -y
mkdir -p /root/rpmbuild/BUILD
mkdir -p /root/rpmbuild/BUILDROOT
mkdir -p /root/rpmbuild/RPMS
mkdir -p /root/rpmbuild/SOURCES
mkdir -p /root/rpmbuild/SPECS
mkdir -p /root/rpmbuild/SRPMS
cd /root
wget http://www.keepalived.org/software/keepalived-1.4.2.tar.gz
tar -zxvf keepalived-1.4.2.tar.gz
cd keepalived-1.4.2
./configure
make && make install
cp /root/keepalived-1.4.2.tar.gz /root/rpmbuild/SOURCES
cp /usr/include/linux/lp.h /usr/include/net
chgrp root keepalived.spec
rpmbuild -v -bb keepalived.spec
ls -l /root/rpmbuild/RPMS/x86_64/keepalived-1.4.2*rpm
