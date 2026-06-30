#!/bin/bash

yum install -y centos-release-scl

set -e

echo "===> Backup origin SCLo repo"
mkdir -p /etc/yum.repos.d/backup-sclo
mv /etc/yum.repos.d/CentOS-SCLo* /etc/yum.repos.d/backup-sclo/ 2>/dev/null || true

echo "===> Import new SCLo repo (official vault.centos.org)"
cat >/etc/yum.repos.d/CentOS-SCLo.repo <<'EOF'
[centos-sclo-rh]
name=CentOS-7 - SCLo rh
baseurl=http://vault.centos.org/7.9.2009/sclo/$basearch/rh/
gpgcheck=0
enabled=1

[centos-sclo-sclo]
name=CentOS-7 - SCLo sclo
baseurl=http://vault.centos.org/7.9.2009/sclo/$basearch/sclo/
gpgcheck=0
enabled=1
EOF

echo "===> Clear yum cache"
yum clean all

echo "===> Rebuild cache"
yum makecache fast

echo "===> Test SCLo repo"
yum --disablerepo="*" --enablerepo="centos-sclo-rh" list >/dev/null && \
echo "SCLo is available." || echo "SCLo is not available. Check your network."