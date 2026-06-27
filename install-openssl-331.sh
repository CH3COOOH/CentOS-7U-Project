cd ./bin
wget https://github.com/CH3COOOH/CentOS-7U-Project/releases/download/main/openssl-3.3.1-bin.tgz
cp ./openssl-3.3.1-bin.tgz /opt

cd /opt
tar -zxvf ./openssl-3.3.1-bin.tgz
ln -sf /opt/openssl-3.3.1/lib64/libcrypto.so.3 /usr/lib64/
ln -sf /opt/openssl-3.3.1/lib64/libssl.so.3 /usr/lib64/
echo "/opt/openssl-3.3.1/lib64" >> /etc/ld.so.conf
ldconfig
/opt/openssl-3.3.1/bin/openssl version
rm -f ./openssl-3.3.1-bin.tgz
